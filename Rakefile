require 'newgem'
require File.dirname(__FILE__) + "/lib/haml_scaffold/version"
$hoe = Hoe.new("haml_scaffold", HamlScaffold::Version::STRING) do |p|
  p.rubyforge_name = "haml-scaffold"
  p.author = ['Norman Clarke']
  p.email = ['norman@njclarke.com']
  p.summary = "Rails scaffolding with Haml rather than ERB"
  p.description = "Rails scaffolding with Haml rather than ERB, and various other improvements."
  p.url = 'http://haml-scaffold.rubyforge.org/'
  p.extra_deps << ['haml', '>= 2.0.6']
  p.extra_deps << ['will_paginate', '>= 2.2.2']
  p.extra_deps << ['mocha', '>= 0.9.0']
  p.extra_dev_deps << ['newgem', ">= #{::Newgem::VERSION}"]
  p.remote_rdoc_dir = "/"
end
require 'newgem/tasks'

desc 'Publish RDoc to RubyForge.'
task :publish_docs => [:clean, :docs] do
  host = "compay@rubyforge.org"
  remote_dir = "/var/www/gforge-projects/haml-scaffold"
  local_dir = 'doc'
  sh %{rsync -av --delete #{local_dir}/ #{host}:#{remote_dir}}
end
