# Thbrk

Gem of Thai Word Break plugin for use with Thinking Sphinx.

## Install libthai & libthai4r

Can do follow this https://github.com/neokain/libthai4r

### Bundler

	gem 'thbrk'  	

### Quick Start

In your model:

    class Article < ActiveRecord::Base
        thbrk # include when use plugin
        
        define_thai_columns :title, :body # include when use plugin
        
        define_index do
            indexes :title
            indexes :body
            ...
            indexes :thbrk # include when use plugin
        end
    end
  
In your migrations:

      class AddThbrkColumnToArticle < ActiveRecord::Migration
        def self.up
            add_column :articles, :thbrk, :text
        end
        
        def self.down
            remove_column :articles, :thbrk, :text
        end
      end

In your 'config/sphinx.yml'

    development:
	    charset_table: "0..9, A..Z->a..z, _, a..z, U+E00..U+E7F"

## Usage

    # params[:q] is parameter from view
    @articles = Article.search(params[:q].to_s.to_thbrk)


## License

Copyright (c) 2010 Phuwanart Larpmark, released under the MIT license
