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
    ignored_paths: %w{ lib bin },
    lib_path: 'lib',
    bin_path: 'bin',
    load_paths: %w{ lib },
  }
```
