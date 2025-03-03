# frozen_string_literal: true

# Packs/Unpacks a String to and from an Integer
module ShortStringPacker
  ## Packs a short string into a Integer
  # Arguments:
  #   str - String object
  # Returns: a Integer object
  def self.pack(str)
    # IMPLEMENT THIS METHOD
    str.chars.reduce(0) do |packed, char|
      char_value = char.ord - 'a'.ord + 1

      (packed << 5) | char_value
    end
  end

  ## Unpacks a Integer from pack() method into a short string
  # Arguments:
  #   packed - a Integer object
  # Returns: a String object
  def self.unpack(packed)
    # IMPLEMENT THIS METHOD
    result = []

    until packed.zero?
      char_value = packed & 0x1F
      char = (char_value + 'a'.ord - 1).chr

      result.unshift(char)
      packed >>= 5
    end
    result.join
  end
end
