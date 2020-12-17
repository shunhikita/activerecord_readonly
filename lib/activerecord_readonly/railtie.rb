# frozen_string_literal: true

require "activerecord_readonly"

module ActiverecordReadonly
  class Railtie < Rails::Railtie
    initializer "activerecord-be_readonly.active_record" do
      ActiveSupport.on_load(:active_record) do
        include ActiverecordReadonly::Model
      end
    end
  end
end
