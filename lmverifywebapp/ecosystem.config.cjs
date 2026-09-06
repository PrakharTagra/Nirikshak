module.exports = {
  apps: [
    {
      name: 'lmv-admin-backend',
      script: 'src/index.js',
      cwd: './admin-backend',
      instances: 1,
      exec_mode: 'fork',
      autorestart: true,
      watch: false,
      max_memory_restart: '500M',
      env: {
        NODE_ENV: 'production',
        ADMIN_BACKEND_PORT: 4001,
      },
      error_file: '../logs/admin-backend-err.log',
      out_file: '../logs/admin-backend-out.log',
      time: true,
    },
    {
      name: 'lmv-senior-inspector-backend',
      script: 'src/index.js',
      cwd: './senior-inspector-backend',
      instances: 1,
      exec_mode: 'fork',
      autorestart: true,
      watch: false,
      max_memory_restart: '500M',
      env: {
        NODE_ENV: 'production',
        SENIOR_INSPECTOR_BACKEND_PORT: 4002,
      },
      error_file: '../logs/senior-inspector-backend-err.log',
      out_file: '../logs/senior-inspector-backend-out.log',
      time: true,
    },
  ],
};
