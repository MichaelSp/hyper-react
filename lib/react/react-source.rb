if RUBY_ENGINE == 'opal'
  %x{
    var ms = [
      "Warning: `react/react-source` is deprecated, ",
      "use `react/react-source-browser` or `react/react-source-server` instead."
    ]
    console.error(ms.join(""));
  }
  require 'react.js'
  require "react-server.js"
else
  require "react/config"
  require "react/rails/asset_variant"
  react_directory = React::Rails::AssetVariant.new(
    addons: true,
    variant: React::Config.config[:environment].to_sym
  ).react_directory
  Opal.append_path react_directory.untaint
  Opal.append_path File.expand_path('../../react-sources/', __FILE__).untaint
end
