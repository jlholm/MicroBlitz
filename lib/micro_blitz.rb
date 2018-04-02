require "micro_blitz/configuration"
require "micro_blitz/file_finder"
require "micro_blitz/exceptions"
require "micro_blitz/attack_vectors"
require "micro_blitz/attacks/homograph"
require "micro_blitz/attacks/eraser"
require "micro_blitz/version"

module MicroBlitz
  # @return [MicroBlitz::Configuration] MicoBlitz current configuration
  def self.configuration
    @configuration ||= Configuration.new
  end

  # Set MicroBlitz configuration
  # @param config [MicroBlitz::Configuration]
  def self.configuration=(config)
    @configuration = config
  end

  # Modify MicroBlitz current configuration
  # @yieldparam [MicroBlitz::Configuration] config current MicroBlitz config
  #
  # @example
  #   MicroBlitz.configure do |config|
  #     config.frequency = 2
  #     ...
  #   end
  def self.configure
    yield configuration
  end

  # Initiates MicroBlitz
  def self.start
    raise ConfigError, "Directory cannot be nil" if configuration.directory.nil?

    @paths ||= FileFinder.new.walk
  end
end
