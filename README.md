# tinymce-rails-fileupload plugin

Simple plugin for TinyMCE4 that allows for uploading files from your computer and inserting a link to the uploaded document.

It makes no assumption on how you store the files, it simply POSTs data to a URL and expects a JSON response (see the Setup).

This plugin started as a copy of [tinymce-rails-imageupload](https://github.com/PerfectlyNormal/tinymce-rails-imageupload). 

## Requirements

* Rails >= 4.0
* TinyMCE4 using the advanced theme

## Installation

Add this line to your application's Gemfile:

    gem 'tinymce-rails-fileupload'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install tinymce-rails-fileupload

## Setup

### Set up TinyMCE as you would normally, but in the call to `.tinymce()`, add

    plugins: "uploadfile"
    # toolbar option must include "uploadfile" somewhere to have the button appear

and the rest should happen automatically.

### Set up upload URL and handler

The plugin defaults to POSTing to `/tinymce_assets`.

You may modify it by supplying the option `uploadfile_form_url` in the call to `.tinymce()`

Routing to your controller must be done manually.
Set it up using something similar in `routes.rb`:

    post '/tinymce_assets' => 'tinymce_assets#create'

This action gets called with a file parameter creatively called `document[file]`,
and must respond with JSON, containing the URL and title of the document.

The JSON has to be returned with a content type of "text/html" to work.

Example:

    class TinymceAssetsController < ApplicationController
      respond_to :json

      def create
        document = Document.create(document_params)

        render json: {
          document: {
            url: document.file.url,
            title: document.title
          }
        }, layout: false, content_type: "text/html"
      end
      
      private
      
        def document_params
          params.require(:document).permit(:file, :title)
        end
    end


Inserted HTML is just `<a href="..." title="...">Link text</a>`.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/tinymce-rails-fileupload/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
