module MicroBlitz
  class FileFinder
    attr_reader :directory

    def initialize
      @directory = MicroBlitz.configuration.directory
    end

    def walk
      paths = []

      Dir.foreach(@directory) do |x|
        path = File.join(@directory, x)

        next if x == "." || x == ".."

        if File.directory?(path)
          walk(path)
        else
          paths << path
        end
      end

      paths
    end
  end
end
