const path = require('path');
require('dotenv').config();

module.exports = {
  VIDEO_BASE_PATH: process.env.SHINOBI_VIDEOS_PATH || '/home/Shinobi/videos',
  GROUP_KEY: '1',
  SEGMENT_DURATION_SECONDS: parseInt(process.env.SEGMENT_DURATION) || 30,
  DELAY_BEFORE_PROCESSING: 2000, // 2 segundos,
  MAX_VIDEO_RETRIES: 3,
  MIN_VIDEO_SIZE: 10240, // 10KB mínimo
  PROCESSING_TIMEOUT: parseInt(process.env.MAX_PROCESSING_TIME) || 180000, // 3 minutos
  TEMP_DIR: process.env.TEMP_PATH || path.join(__dirname, '..', 'temp'),
  HLS_DIR: process.env.HLS_PATH || path.join(__dirname, '..', 'hls'),
  WAIT_FOR_FINALIZATION: 2000,
  FTP_VIDEOS_PATH: process.env.FTP_VIDEOS_PATH || '/home/ftp/videos',
  DB_CONFIG: {
    host: process.env.DB_HOST || 'db.replayzone.com.br',
    user: process.env.DB_USER || 'replayzone',
    password: process.env.DB_PASSWORD || 'Kaio@3005',
    database: process.env.DB_NAME || 'replayzone',
    connectionLimit: parseInt(process.env.DB_CONNECTION_LIMIT) || 10,
    connectTimeout: 10000,
  }
};