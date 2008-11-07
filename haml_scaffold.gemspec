Gem::Specification.new do |s|
  s.name = "haml_scaffold"
  s.version = "0.1.0"
  s.date = "2008-09-02"
  s.add_dependency('will_paginate', '>= 2.2.2')
  s.add_dependency('mocha', '>= 0.9.0')
  s.summary = "An improved Rails scaffold that uses HAML."
  s.email = 'norman@randomba.org'
  s.homepage = 'http://randomba.org'
  s.description = "An improved Rails scaffold that uses HAML."
  s.has_rdoc = false
  s.authors = ['Norman Clarke']
  s.files = [
    "MIT-LICENSE",
    "README.textile",
    "init.rb",
    "generators/haml_scaffold/haml_scaffold_generator.rb",
    "generators/haml_scaffold/templates/_form.html.erb",
    "generators/haml_scaffold/templates/_object.html.erb",
    "generators/haml_scaffold/templates/controller.rb",
    "generators/haml_scaffold/templates/functional_test.rb",
    "generators/haml_scaffold/templates/helper.rb",
    "generators/haml_scaffold/templates/view_edit.html.erb",
    "generators/haml_scaffold/templates/view_index.html.erb",
    "generators/haml_scaffold/templates/view_new.html.erb",
    "generators/haml_scaffold/templates/view_show.html.erb",
    "samples/posts_controller.rb",
    "samples/posts_controller_test.rb",
    "samples/views/_form.html.haml",
    "samples/views/_post.html.haml",
    "samples/views/edit.html.haml",
    "samples/views/index.html.haml",
    "samples/views/new.html.haml",
    "samples/views/show.html.haml"
    ]
end
