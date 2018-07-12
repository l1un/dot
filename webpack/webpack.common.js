const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const CleanWebpackPlugin = require('clean-webpack-plugin');

// html plugin options
let htmlOptions = {
  template: 'src/index.html',
  minify: {
    collapseWhitespace: true,
    removeAttributeQuotes: true
  }
};

module.exports = {
  entry: './src/app/app.js',
  output: {
    filename: '[name].bundle.js',
    path: path.resolve(__dirname, 'dist')
  },
  plugins: [
    // move / minify html files
    new HtmlWebpackPlugin(htmlOptions),
    // remove / add dist folder on build
    new CleanWebpackPlugin(['dist']),
  ],
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /(node_modules|bower_components)/,
        use:{
          loader: 'babel-loader',
        }
      },
      {
        test: /\.(jpg|png|gif|svg)$/,
        use: [
          {
            loader: 'file-loader',
            options: {
              name: '[name].[ext]'
            }
          }, 'image-webpack-loader'
        ]
      }
    ]
  }
};
