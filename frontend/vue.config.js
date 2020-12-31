/* eslint-disable @typescript-eslint/no-var-requires */
const path = require('path');

module.exports = {
  devServer: {
    proxy: {
      '^/api': {
        target: 'http://127.0.0.1'
      }
    }
  },
  outputDir: path.resolve(__dirname, '../backend/public'),
  indexPath: process.env.NODE_ENV === 'production'
    ? `${path.resolve(__dirname, '../backend/resources/views')}/index.blade.php`
    : 'index.html',
  productionSourceMap: false
}