import mongoose from 'mongoose';
import { env } from './env.js';
import { User, Jurisdiction, Report, AdminAuditLog, Rule } from '@lm-verify/shared';

export { User, Jurisdiction, Report, AdminAuditLog, Rule };

let connectionPromise = null;

export async function connectDB() {
  if (mongoose.connection.readyState === 1) return mongoose.connection;
  if (!connectionPromise) {
    connectionPromise = mongoose.connect(env.databaseUrl)
      .then((conn) => {
        console.log(`[${env.serviceName}] Connected to MongoDB`);
        return conn;
      })
      .catch((err) => {
        connectionPromise = null;
        console.error(`[${env.serviceName}] MongoDB connection error:`, err.message);
        throw err;
      });
  }
  return connectionPromise;
}

// Auto-connect on startup
connectDB().catch(() => {});

export const pool = {
  end: async () => {
    if (mongoose.connection.readyState !== 0) {
      await mongoose.disconnect();
    }
  },
};

export async function withTransaction(fn) {
  let session = null;
  try {
    session = await mongoose.startSession();
    session.startTransaction();
  } catch {
    session = null;
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