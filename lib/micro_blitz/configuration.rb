module MicroBlitz
  class Configuration

    # Frequency : Int
    # Specifies how frequent MicroBlitz run.
    # Ex: Monthly, Bi-Weekly, Weekly
    # Defaults to 1 (Monthly)
    attr_accessor :frequency

    # Recurrence : Int
    # Specifies how often MicroBlitz runs
    # on every user defined frequency.
    # Defaults to 1 (Runs Once a Month)
    attr_accessor :recurrence

    # Chaoticness : Int
    # Specifies how chaotic MicroBlitz
    # will be in production.
    # Defaults to 1 (Lowest chaotic level)
    attr_accessor :chaoticness

    # Directory : String
    # Specifies the directory to cause chaos in.
    # Defaults to nil
    attr_accessor :directory

    def initialize
      @frequency = 1
      @recurrence = 1
      @chaoticness = 1
      @directory = nil
    end
  end
end
