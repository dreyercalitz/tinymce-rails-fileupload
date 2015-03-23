module Tinymce
  module Rails
    module Fileupload
      class Engine < ::Rails::Engine
        initializer 'TinymceRailsFileupload.assets_pipeline' do |app|
          app.config.assets.precompile << "tinymce/plugins/uploadfile/*"
        end
      end
    end
  end
end
