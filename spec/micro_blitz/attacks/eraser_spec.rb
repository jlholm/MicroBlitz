require 'spec_helper'

RSpec.describe MicroBlitz::Eraser do
  subject { MicroBlitz::Eraser.new(file) }

  let(:directory) { "test_dir" }
  let(:filename) { "test.rb" }
  let(:file) { "#{directory}/#{filename}" }
  let!(:overrides) do
    {
      files: {
        "test.rb": sample_file
      }
    }
  end
  let!(:sample_file) {
    %Q{
      class Hello
        def initialize(this)
          @this = this
        end

        def say
          puts @this
        end
      end
    }
  }

  before do
    configure
  end

  context "#delete_whole" do
    it "deletes the whole file" do
      subject.delete_whole
      expect(File.file?(file)).to eq(false)
    end
  end

  # Coming back to this at a later time.
  #context "#delete_half" do
    #it "deletes half the file" do
      #subject.delete_half
      #expect(bytes_of_original_file).to_not eq(bytes_of_new_file)
    #end
  #end

  def configure
    Stubs.setup_directory(directory, overrides)
  end
end
