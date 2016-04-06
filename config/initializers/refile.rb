# config/initializers/refile.rb
require 'refile/s3'
require 'refile/simple_form'

aws = {
  access_key_id: ENV['access_key_id'],
  secret_access_key: ENV['secret_access_key'],
  region: 'us-west-2',
  bucket: 'refileadham',
}

Refile.cache = Refile::S3.new(prefix: 'cache', **aws)
Refile.store = Refile::S3.new(prefix: 'store', **aws)

