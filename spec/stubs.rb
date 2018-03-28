module Stubs
  def self.micro_blitz_config(overrides={})
    MicroBlitz.configure do |config|
      config.frequency = overrides.fetch(:frequency)
      config.recurrence = overrides.fetch(:recurrence)
      config.chaoticness = overrides.fetch(:chaoticness)
      config.directory = overrides.fetch(:directory)
    end
  end
end
