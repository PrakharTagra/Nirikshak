module.exports = {
  apps: [
    {
      name: 'nirikshak-backend',
      script: './server.js',
      cwd: __dirname,
      instances: 1, // 'max' or integer if clustering on larger EC2 instances
      exec_mode: 'fork',
      autorestart: true,
      watch: false,
      max_memory_restart: '300M', // Protects 1GB RAM instances (t2.micro/t3.micro)
      kill_timeout: 5000,         // Time allowed for graceful shutdown before SIGKILL
      listen_timeout: 8000,
      restart_delay: 4000,
      max_restarts: 10,
      min_uptime: '10s',
      out_file: './logs/out.log',
      error_file: './logs/error.log',
      merge_logs: true,
      log_date_format: 'YYYY-MM-DD HH:mm:ss Z',
      env: {
        NODE_ENV: 'development',
        PORT: 5000
      },
      env_production: {
        NODE_ENV: 'production',
        PORT: 5000
      }
    }
  ]
};
