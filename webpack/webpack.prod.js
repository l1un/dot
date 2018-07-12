const UglifyJsPlugin = require('uglifyjs-webpack-plugin');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const merge = require('webpack-merge');
const common = require('./webpack.common.js');

module.exports = merge(common, {
  mode: 'production',
  module: {
    rules: [
      // mini-css-extract-plugin
      {
        test: /\.scss$/,
        use: [
          MiniCssExtractPlugin.loader,
          {
            loader: 'css-loader',
            // FIXME: renames css classes - to debug
            // options: {
            // modules: true,
            // sourceMap: true,
            // importLoader: 2
            // }
          }, 'sass-loader'
        ]
      },
    ]
  },
  plugins: [
    // merge / copress js files
    new UglifyJsPlugin(),
    // convert, load, minimize, scss/css
    new MiniCssExtractPlugin({
      filename: 'style.css',
      chunkFilename: '[name].css'
    }),
  ],
});
