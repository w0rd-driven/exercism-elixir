defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    # Split our codons by 3 characters
    codon_list = Stream.unfold(rna, fn item ->
      String.split_at(item, 3)
    end)

    codons = Enum.take_while(codon_list, fn item -> item != "" end)
    parsed = Enum.map(codons, fn item -> of_codon(to_string(item)) end)
    cond do
      # If all proteins are correct, output {:ok, [list]}
      # If stop protein is found, output {:ok, [list to stop value]}
      Enum.all?(parsed, &match?({:ok, _value}, &1)) -> {:ok, Enum.map(parsed, fn {:ok, value} -> value end) |> Enum.take_while(&(&1 != "STOP"))}
      # If any protein is an error, output {:error, "invalid RNA"}
      Enum.any?(parsed, &match?({:error, _value}, &1)) -> {:error, "invalid RNA"}
    end
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    case codon do
      "UGU" -> {:ok, "Cysteine"}
      "UGC" -> {:ok, "Cysteine"}
      "UUA" -> {:ok, "Leucine"}
      "UUG" -> {:ok, "Leucine"}
      "AUG" -> {:ok, "Methionine"}
      "UUU" -> {:ok, "Phenylalanine"}
      "UUC" -> {:ok, "Phenylalanine"}
      "UCU" -> {:ok, "Serine"}
      "UCC" -> {:ok, "Serine"}
      "UCA" -> {:ok, "Serine"}
      "UCG" -> {:ok, "Serine"}
      "UGG" -> {:ok, "Tryptophan"}
      "UAU" -> {:ok, "Tyrosine"}
      "UAC" -> {:ok, "Tyrosine"}
      "UAA" -> {:ok, "STOP"}
      "UAG" -> {:ok, "STOP"}
      "UGA" -> {:ok, "STOP"}
      _ -> {:error, "invalid codon"}
    end
  end
end
