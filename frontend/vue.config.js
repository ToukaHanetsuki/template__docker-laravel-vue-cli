module.exports = {
  devServer: {
    proxy: {
      '^/api': {
        target: 'http://nginx'
      }
    }
  },
  outputDir: '../public',
  indexPath: process.env.NODE_ENV === 'production'
    ? '../resources/views/index.blade.php'
    : 'index.html'
}