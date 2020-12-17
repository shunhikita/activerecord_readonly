# frozen_string_literal: true

module ActiverecordReadonly
  class Current
    attr_reader :be_readonly
    attr_reader :excepts
    attr_reader :only

    def initialize(be_readonly, excepts = [], only = [])
      @be_readonly = be_readonly
      @excepts = excepts
      @only = only
    end
  end
end
