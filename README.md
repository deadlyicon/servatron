# Servatron

The simplist way to build a ruby web app



```sh
.
├── index.rb
└── lib

```



- we never serve `.rb` files
- we never serve files that start with `_`





# Default Configuration

```ruby
  {
    ignored_extensions: %w{ rb },
    ignored_paths: %w{ lib bin Gemfile Gemfile.lock },
    lib_path: 'lib',
    bin_path: 'bin',
    load_paths: %w{ lib },
  }
```



```
file path                                              url path
----------------------------------------------------------------------------
/root.html.rb                                          /
/posts.html.rb                                         /posts(.html)
/posts/new.html.rb                                     /posts/new(.html)
/posts/:post_id.html.rb                                /posts/:post_id(.html)
/posts/:post_id/edit.html.rb                           /posts/:post_id/edit(.html)
/posts/:post_id/comments.html.rb                       /posts/:post_id/comments(.html)
/posts/:post_id/comments/new.html.rb                   /posts/:post_id/comments/new(.html)
/posts/:post_id/comments/:comment_id.html.rb           /posts/:post_id/comments/:comment_id(.html)
/posts/:post_id/comments/:comment_id/edit.html.rb      /posts/:post_id/comments/:comment_id/edit(.html)
```



### thoughts

any url missing an extension searches for files matching extensions we know how to process (.rb|.haml|.sass) etc


# TODO

make Servatron::Application#routes scan the filesystem and build a routes
make `bundle exec servatron routes` print out said routes
