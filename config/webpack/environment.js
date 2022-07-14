const { environment } = require('@rails/webpacker')

const webpack = require('webpack')

environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'admin-lte/plugins/jquery/jquery',
    jQuery: 'admin-lte/plugins/jquery/jquery',
  })
)

module.exports = environment

environment.toWebpackConfig().merge({
  resolve: {
  alias: {
    'jquery': 'admin-lte/plugins/jquery/jquery',
    }
  }
});