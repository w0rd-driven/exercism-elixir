defmodule DNA do
  @spec encode_nucleotide(integer()) :: integer()
  def encode_nucleotide(code_point) do
    case code_point do
      ?\s -> 0b0000
      ?A -> 0b0001
      ?C -> 0b0010
      ?G -> 0b0100
      ?T -> 0b1000
    end
  end

  @spec decode_nucleotide(integer) :: integer()
  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0b0000 -> ?\s
      0b0001 -> ?A
      0b0010 -> ?C
      0b0100 -> ?G
      0b1000 -> ?T
    end
  end

  @spec encode(charlist()) :: bitstring()
  def encode(dna) do
    do_encode(dna, <<0::size(0)>>)
  end

  defp do_encode([], encoded), do: encoded
  defp do_encode([code_point | tail] = _dna, encoded) do
    do_encode(tail, <<encoded::bitstring, encode_nucleotide(code_point)::4>>)
  end

  @spec decode(bitstring()) :: charlist()
  def decode(dna) do
    do_decode(dna, '')
  end

  defp do_decode(<<0::0>>, decoded), do: decoded
  defp do_decode(<<head::4, tail::bitstring>> = _dna, decoded) do
    do_decode(tail, decoded ++ [decode_nucleotide(head)])
  end
end
