module MicroBlitz
  class FileFinder
    attr_reader :directory

    def initialize
      @directory = MicroBlitz.configuration.directory
    end

    def walk
      paths = []

      Dir.foreach(@directory) do |file|
        path = File.join(@directory, file)

        next if file == "." || file == ".."

        if File.directory?(path)
          walk(path)
        else
          paths.push(path) if valid_extension?(file)
        end
      end

      paths
    end

    def valid_extension?(file)
      WHITELISTED_EXTENSIONS.include? File.extname(file)
    end

    WHITELISTED_EXTENSIONS = [
      ".rb"
    ].freeze
  end
end
