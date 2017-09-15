# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tinymce/rails/fileupload/version'

Gem::Specification.new do |spec|
  spec.name          = "tinymce-rails-fileupload"
  spec.version       = Tinymce::Rails::Fileupload::VERSION
  spec.authors       = ["Dreyer Calitz"]
  spec.email         = ["fdcalitz@gmail.com"]
  spec.homepage      = "https://github.com/dreyercalitz/tinymce-rails-fileupload"
  spec.summary       = %q{TinyMCE plugin for file uploads in Rails >= 4.0}
  spec.description   = %q{TinyMCE plugin for file uploads in Rails >= 4.0. Document storage is handled manually, so works with everything.}
  spec.files         = [
                         Dir["app/assets/javascripts/tinymce/plugins/uploadfile/**/*.js"],
                         Dir["lib/**/*.rb"],
                         "lib/tasks/tinymce-uploadfile-assets.rake",
                         "CHANGELOG.md",
                         "LICENSE.txt",
                         "README.md",
                       ].flatten
  spec.test_files    = []
  spec.require_paths = ["lib"]
  spec.license       = "MIT"

  spec.add_runtime_dependency     "railties",      ">= 4.0"
  spec.add_runtime_dependency     "tinymce-rails", "~> 4.0"
  spec.add_development_dependency "bundler",       "~> 1.6"
  spec.add_development_dependency "rails",         ">= 4.0"
end
