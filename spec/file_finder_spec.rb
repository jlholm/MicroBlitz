require 'spec_helper'
require 'fileutils'

RSpec.describe MicroBlitz::FileFinder do
  subject { MicroBlitz::FileFinder.new }

  let(:directory) { subject.directory }
  let!(:micro_blitz_config) do
    {
      frequency: 1,
      recurrence: 1,
      chaoticness: 2,
      directory: "test_dir"
    }
  end

  before do
    configure
  end

  context "#initialize" do
    it "has been instantiated" do
      expect(subject).to be_an(MicroBlitz::FileFinder)
    end

    it "has a directory assigned" do
      expect(subject.directory).to eq(micro_blitz_config.fetch(:directory))
    end
  end

  context "#walk" do
    let(:valid_response) { ["#{directory}/foo.rb", "#{directory}/bar.rb"] }
    let(:invalid_response) { ["#{directory}/foo.rb", "#{directory}/bar.rb", "#{directory}/baz.txt"] }

    it "only returns a list of files with valid extensions" do
      expect(subject.walk).to match_array(valid_response)
    end

    it "excludes files with invalid extensions" do
      expect(subject.walk).to_not match_array(invalid_response)
    end
  end

  def configure
    Stubs.micro_blitz_config(overrides=micro_blitz_config)
    Stubs.setup_directory(directory)
  end
end
