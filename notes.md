# Notes

## Executed commands

Build a new version of the gem:

1. git add -A
1. gem build gtemplate.gemspec 
1. gem install gtemplate-0.0.0.gem

Run IRB loading gtemplate gem:

* irb -rgtemplate

List installed gems:

* gem list 
* gem list gtemplate
* gem list | grep gtemplate

Uninstall gem:

* gem uninstall -aIx 

## Dudes

* ¿Minitest?

## Testing

rake test

## Gemspec

Gemspec file add .rb files dinamically using `git ls-files` command. 

```
all_files = `git ls-files -z`.split("\x0")
```

That's why you need to add every file to git before building the gem.

## Info

* http://www.alexedwards.net/blog/how-to-make-a-rubygem
* http://www.alexedwards.net/blog/how-to-make-a-rubygem-part-two
* http://jamespmcgrath.com/how-to-uninstall-all-ruby-gems-in-one-line/

## TODO

Issues:

* documentation
* script renombrar gem del estilo de cmd-app-template







