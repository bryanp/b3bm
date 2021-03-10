# frozen_string_literal: true

module B3bm
  # [public] Raised when the value cannot be encoded or decoded.
  #
  class Invalid < StandardError
  end

  ALPHABET = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"

  CHARACTER_TO_INTEGER = ALPHABET.each_char.with_index.with_object({}) { |(character, index), hash|
    hash[character] = index
  }.freeze

  INTEGER_TO_CHARACTER = CHARACTER_TO_INTEGER.invert.freeze

  # [public] Encode a string or integer as Base62.
  #
  def self.encode(value)
    result = +""

    if value.size > 0
      zeroes = 0

      case value
      when Integer
        integer = value
      else
        integer = 0
        leading = true

        value.to_s.each_byte do |byte|
          if leading
            if byte == 0
              zeroes += 1
            else
              leading = false
            end
          end

          integer *= 256
          integer += byte
        end
      end

      while integer > 0
        result.prepend(INTEGER_TO_CHARACTER[integer % 62])
        integer /= 62
      end

      while zeroes > 0
        result.prepend("0")
        zeroes -= 1
      end
    end

    result
  end

  # [public] Decode a Base62 string to a string or integer result.
  #
  def self.decode(value, string: true)
    if value.size > 0
      result = []
      integer = 0
      zeroes = 0
      leading = true

      value.to_s.each_char do |character|
        if leading
          if character == "0"
            zeroes += 1
          else
            leading = false
          end
        end

        integer *= 62
        integer += (CHARACTER_TO_INTEGER[character] || raise(Invalid, "`#{character}' is not in the alphabet"))
      end

      if string == true
        while integer > 0
          result.unshift(integer % 256)
          integer /= 256
        end

        while zeroes > 0
          result.unshift(0)
          zeroes -= 1
        end

        result.pack("c*")
      else
        integer
      end
    elsif string == true
      ""
    else
      0
    end
  end

  require_relative "b3bm/version"
end
