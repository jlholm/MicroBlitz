require 'spec_helper'

RSpec.describe MicroBlitz::Homograph do
  subject { MicroBlitz::Homograph.new(filename) }

  let(:filename) { "foo.rb" }

  context "#attack" do
    # HomographAttacked "foo.rb" in bytes
    let(:homograph_filename_in_bytes) { [102, 208, 190, 208, 190, 46, 114, 98] }

    it "returns a homograph attacked string (bytes compared)" do
      expect(subject.attack.bytes).to eq(homograph_filename_in_bytes)
    end

    it "original filename does not equal the new one" do
      expect(subject.attack).to_not eq(filename)
    end
  end
end
