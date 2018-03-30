module MicroBlitz
  # @abstract Exceptions raise by MicroBlitz inherit from Error
  class Error < StandardError; end

  # Exception raised when there is an error in the configuration
  class ConfigError < Error; end
end
