import mongoose from 'mongoose';
import { env } from './env.js';
import { User, Jurisdiction, Report, AdminAuditLog, Rule } from '@lm-verify/shared';

export { User, Jurisdiction, Report, AdminAuditLog, Rule };

let connectionPromise = null;

const atlasOptions = {
  maxPoolSize: 10,
  serverSelectionTimeoutMS: 5000,
  socketTimeoutMS: 45000,
};

// Lifecycle listeners
mongoose.connection.on('connected', () => {
  console.log(`[${env.serviceName}] Connected to MongoDB Atlas (${mongoose.connection.name})`);
});

mongoose.connection.on('error', (err) => {
  console.error(`[${env.serviceName}] MongoDB connection error:`, err.message);
});

mongoose.connection.on('disconnected', () => {
  console.warn(`[${env.serviceName}] Disconnected from MongoDB Atlas`);
});

export async function connectDB() {
  if (mongoose.connection.readyState === 1) return mongoose.connection;
  if (!connectionPromise) {
    connectionPromise = mongoose.connect(env.databaseUrl, atlasOptions)
      .then((conn) => {
        return conn;
      })
      .catch((err) => {
        connectionPromise = null;
        console.error(`[${env.serviceName}] Initial connection to MongoDB Atlas failed:`, err.message);
        throw err;
      });
  }
  return connectionPromise;
}

// Auto-connect on startup
connectDB().catch(() => {});

export async function disconnectDB() {
  if (mongoose.connection.readyState !== 0) {
    await mongoose.disconnect();
  }
}

export const pool = {
  end: disconnectDB,
};

export async function withTransaction(fn) {
  let session = null;
  const topologyType = mongoose.connection?.client?.topology?.description?.type;
  const isReplicaSet = topologyType === 'ReplicaSetWithPrimary' || topologyType === 'Sharded' || !!mongoose.connection?.client?.topology?.description?.setName;

  if (isReplicaSet) {
    try {
      session = await mongoose.startSession();
      session.startTransaction();
    } catch {
      session = null;
    }
  }

  if (session) {
    try {
      const result = await fn(session);
      await session.commitTransaction();
      return result;
    } catch (err) {
      await session.abortTransaction();
      throw err;
    } finally {
      session.endSession();
    }
  } else {
    return fn(null);
  }
}

export async function checkDatabase() {
  try {
    if (mongoose.connection.readyState === 1) {
      await mongoose.connection.db.admin().ping();
      return { ok: true };
    }
    await connectDB();
    await mongoose.connection.db.admin().ping();
    return { ok: true };
  } catch (err) {
    return { ok: false, message: err.message };
  }
}