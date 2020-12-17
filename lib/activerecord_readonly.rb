# frozen_string_literal: true

require_relative "activerecord_readonly/version"
require_relative "activerecord_readonly/model"
require_relative "activerecord_readonly/current"
require_relative "activerecord_readonly/railtie"

module ActiverecordReadonly
  class Error < StandardError; end

  class << self
    def switch!(be_readonly = false, excepts: [], only: [])
      RequestStore[:activerecord_readonly] = ActiverecordReadonly::Current.new(be_readonly,
                                                                               excepts.map(&:to_s),
                                                                               only.map(&:to_s))
    end

    def reset_readonly!
      RequestStore[:activerecord_readonly] = ActiverecordReadonly::Current.new(false,
                                                                               [],
                                                                               [])
    end

    def current
      RequestStore[:activerecord_readonly]
    end

    def readonly?
      current&.be_readonly || false
    end

    def except_class_names
      current&.excepts || []
    end

    def only_class_names
      current&.only || []
    end

    def with(be_readonly)
      old = readonly?

      switch!(be_readonly)
      yield
      switch!(old)
    end
  end
end
