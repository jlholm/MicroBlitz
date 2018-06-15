module MicroBlitz
  class Corrupter
    # Corrupter is exactly what the name implies, it corrupts things.
    #
    # This is a relatively easy error to trace down in production. This will
    # surely throw errors in the prod logs. All that is required is a login
    # to the prod server and open the trouble file. Visually, the engineer
    # won't notice anything unless they open the file.

    def initialize(file)
      @file = file
    end

    def attack
      raise ::MissingFileError, "File path unknown" unless @file
      corrupt
    end

    def corrupt
      copy = contents_in_bytes
      length_to_corrupt = (copy.size.to_f / 2).ceil

      length_to_corrupt.times do |x|
        copy[x] = [RANDOM_BYTES.sample, ""].sample
      end

      File.write(@file, copy.pack('H2' * copy.size))
    end

    def contents_in_bytes
      contents = File.read(@file)
      contents.unpack('H2' * contents.size)
    end

    RANDOM_BYTES = [
      "f8",
      "6e",
      "0d",
      "ff",
      "23",
      "1n",
      "1e",
      "6b",
      "2a",
      "3d",
      "b8",
      "c0",
      "6f"
    ].freeze

  end
end
