defmodule DNA do
  @spec encode_nucleotide(pos_integer()) :: binary()
  def encode_nucleotide(code_point) do
    case code_point do
      ?\s -> 0b0000
      ?A -> 0b0001
      ?C -> 0b0010
      ?G -> 0b0100
      ?T -> 0b1000
    end
  end

  @spec decode_nucleotide(binary()) :: pos_integer()
  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0b0000 -> ?\s
      0b0001 -> ?A
      0b0010 -> ?C
      0b0100 -> ?G
      0b1000 -> ?T
    end
  end

  @spec encode(char() | charlist()) :: bitstring()
  def encode(''), do: ''
  def encode([h | []]), do: <<encode_nucleotide(h)::4>>
  def encode([h | t]), do: <<encode_nucleotide(h)::4, encode(t)::bitstring>>

  @spec decode(bitstring()) :: char() | charlist()
  def decode(<<>>), do: ''
  def decode(<<h::4, t::bitstring>>), do: [decode_nucleotide(h) | decode(t)]
end
