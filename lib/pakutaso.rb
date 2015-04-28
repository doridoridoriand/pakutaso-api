require 'active_record'
require 'yaml'
require 'content'

db_config = YAML.load_file(File.expand_path(File.join(__FILE__, '..', '..', 'config', 'database.yml')))
ActiveRecord::Base.establish_connection(db_config['db']['production'])

module Pakutaso
end
