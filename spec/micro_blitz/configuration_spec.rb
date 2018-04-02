require 'spec_helper'

RSpec.describe MicroBlitz::Configuration do
  let!(:micro_blitz_config) do
    {
      frequency: 2,
      recurrence: 1,
      chaoticness: 4,
      directory: "testing"
    }
  end

  before do
    configure
  end

  it "sets the frequency" do
    expect(MicroBlitz.configuration.frequency).to eq(micro_blitz_config.fetch(:frequency))
  end

  it "sets the recurrence" do
    expect(MicroBlitz.configuration.recurrence).to eq(micro_blitz_config.fetch(:recurrence))
  end

  it "sets the chaoticness" do
    expect(MicroBlitz.configuration.chaoticness).to eq(micro_blitz_config.fetch(:chaoticness))
  end

  it "sets the directory" do
    expect(MicroBlitz.configuration.directory).to eq(micro_blitz_config.fetch(:directory))
  end

  def configure
    Stubs.micro_blitz_config(overrides=micro_blitz_config)
  end
end
