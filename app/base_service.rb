module BaseService
  attr_reader :result

  class NotImplementedError < ::StandardError; end

  class Errors < Hash
    def add(err_key, err_val, _opts = {})
      self[err_key] ||= []
      self[err_key] << err_val
      self[err_key].uniq!
    end
  end

  module ClassMethods
    def call(*args)
      new(*args).call
    end
  end

  def self.prepended(base)
    base.extend ClassMethods
  end

  def call
    fail NotImplementedError unless defined?(super)

    @called = true
    @result = super

    self
  end

  def success?
    called && !failure?
  end

  def failure?
    called? && errors.any?
  end

  def errors
    @errors ||= Errors.new
  end

  private

  def called?
    @called ||= false
  end

end