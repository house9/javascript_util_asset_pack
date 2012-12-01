# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "javascript_util_asset_pack/version"

Gem::Specification.new do |s|
  s.name        = "javascript_util_asset_pack"
  s.version     = JavascriptUtilAssetPack::VERSION
  s.authors     = ["Jesse House"]
  s.email       = ["jesse.house@gmail.com"]
  s.homepage    = "https://github.com/house9/javascript_util_asset_pack"
  s.summary     = %q{
    Rails 3.1 javascript Util asset pack, show hide spinner, global jquery error handler, etc...
  }
  s.description = File.open('README.rdoc') { |f| f.read }

  s.rubyforge_project = "javascript_util_asset_pack"

  s.add_dependency 'rails', '~> 3.1'
  s.add_dependency 'javascript_safe_logger', '~> 0.0.4'

  s.files         = Dir.glob("lib/**/*") + %w(README.rdoc)
  s.require_paths = ["lib"]
end
