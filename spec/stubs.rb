require 'fileutils'

module Stubs
  def self.micro_blitz_config(overrides={})
    MicroBlitz.configure do |config|
      config.frequency = overrides.fetch(:frequency)
      config.recurrence = overrides.fetch(:recurrence)
      config.chaoticness = overrides.fetch(:chaoticness)
      config.directory = overrides.fetch(:directory)
    end
  end

  def self.setup_directory(directory, overrides={})
    scrub_directory directory
    create_dir directory
    create_file directory, overrides
  end

  def self.scrub_directory(directory)
    FileUtils.rm_rf directory
  end

  def self.create_dir(directory)
    Dir.mkdir directory
  end

  def seed_dir
    # TODO : Create a bunch of files and extra dirs
  end

  def self.create_file(directory, overrides)
    # overrides = {
    #   filenames: [""]
    # }

    if overrides.key?(:filenames)
      overrides.fetch(:filenames).each do |filename|
        File.write("#{directory}/#{filename}", "")
      end
    end

    File.write("#{directory}/foo.rb", "hello")
    File.write("#{directory}/bar.rb", "hello")
    File.write("#{directory}/baz.txt", "hello")
  end
end
