require 'yaml'
require 'massive_record/wrapper/connection'
require 'massive_record/wrapper/tables_collection'
require 'massive_record/wrapper/table'
require 'massive_record/wrapper/row'
require 'massive_record/wrapper/column_families_collection'
require 'massive_record/wrapper/column_family'
require 'massive_record/wrapper/cell'
require 'massive_record/wrapper/scanner'

module MassiveRecord
  module Wrapper
    class Base
    
      def self.config
        config = YAML.load_file(Rails.root.join('config', 'hbase.yml'))[Rails.env]
        { :host => config['host'], :port => config['port'] }        
      end

      def self.connection
        conn = Connection.new(config)
        conn.open
        conn
      end
    
      def self.table
        # TODO
      end
    
      def self.column
        # TODO
      end
  
    end  
  end
end