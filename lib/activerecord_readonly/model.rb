# frozen_string_literal: true

require "activerecord_readonly"

module ActiverecordReadonly
  module Model
    extend ActiveSupport::Concern
    READONLY_CLASS_METHODS = %i[decrement_counter delete_all increment_counter
                                update_all update_counters insert_all insert_all! upsert_all].freeze

    READONLY_INSTANCE_METHODS = %i[decrement! delete increment! update_colummn update_columns touch].freeze

    included do
      before_destroy do
        raise ActiveRecord::ReadOnlyRecord if self.class.readonly?
      end

      def readonly?
        self.class.readonly?
      end

      READONLY_INSTANCE_METHODS.each do |m|
        define_method m do |*_|
          raise ActiveRecord::ReadOnlyRecord if self.class.readonly?

          super
        end
      end
    end

    class_methods do
      def readonly?
        ActiverecordReadonly.readonly? &&
          !ActiverecordReadonly.except_class_names.include?(name) &&
          ActiverecordReadonly.only_class_names.include?(name)
      end

      READONLY_CLASS_METHODS.each do |m|
        define_method m do |*_|
          raise ActiveRecord::ReadOnlyRecord if readonly?

          super
        end
      end
    end
  end
end
