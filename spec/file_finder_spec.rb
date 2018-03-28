require 'spec_helper'
require 'fileutils'

RSpec.describe MicroBlitz::FileFinder do
  subject { MicroBlitz::FileFinder.new }

  let(:directory) { subject.directory }
  let(:paths_response) { ["test_dir/foo.txt", "test_dir/bar.txt"] }
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
    before do
      setup_directory
    end

    it "returns a list of files" do
      expect(subject.walk).to match_array(paths_response)
    end
  end

  def setup_directory
    scrub_directory
    create_dir
    create_file
  end

  def scrub_directory
    FileUtils.rm_rf directory
  end

  def create_dir
    Dir.mkdir directory
  end

  def seed_dir
    # TODO : Create a bunch of files and extra dirs
  end

  def create_file
    File.write("#{directory}/foo.txt", "hello")
    File.write("#{directory}/bar.txt", "hello")
  end

  def configure
    Stubs.micro_blitz_config(overrides=micro_blitz_config)
  end
end
