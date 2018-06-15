require 'fileutils'

module MicroBlitz
  class Eraser
    # Eraser is exactly what the name implies, it erases things.
    # There are multiple abilities it has such as; deleting a whole file,
    # deleting half a file, etc.
    #
    # This is a relatively easy error to trace down in production. All that is
    # required is a login to the prod server and verify if the file is there or
    # not. Slightly more tricky is if only deleting half the file. Visually, the
    # engineer won't notice anything unless they open the file.

    def initialize(file)
      @file = file
    end

    def delete_whole
      # Simple delete `rm <path_to_file>`, pretty traceable in logs.
      raise ::MissingFileError, "File path unknown" unless @file
      FileUtils.rm(@file)
    end

    def delete_half
      contents ||= file_contents
      # Able to get contents of the file. Have the ability to count # of lines
      # within the file. This would allows us the ability to do n/2 where n is
      # the number of lines in the file. Given the bottom half the file we could
      # then delete it. However, it's not that simple. One option is to do some
      # actual parsing like the complier does but that is significantly more work.
      #
      # Alternatively, we could do some basic binary searching. We'd have to keep
      # a counter for the start of each method `def` and match it to its
      # corresponding `end`. Not sure, coming back to this later. Or we can just
      # delete the `def initialize` function ¯\_(ツ)_/¯
    end

    def file_contents
      File.read(@file)
    end
  end
end
