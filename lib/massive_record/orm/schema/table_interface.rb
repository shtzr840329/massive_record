module MassiveRecord
  module ORM
    module Schema
      module TableInterface
        extend ActiveSupport::Concern

        included do
          class_attribute :column_families, :instance_writer => false
          self.column_families = nil
        end

        module ClassMethods
          def column_family(name, &block)
            self.column_families = ColumnFamilies.new if column_families.nil?
            column_families.family_or_new(name).instance_eval(&block)
          end

          def known_attribute_names
            column_families.attribute_names
          end

          def attributes_schema
            column_families.to_hash
          end
        end
      end
    end
  end
end
