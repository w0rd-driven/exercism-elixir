defmodule PaintByNumber do
  defp palette_bit_size(color_count, bit_count) do
    case Integer.pow(2, bit_count) do
      number when number >= color_count -> bit_count
      _ -> palette_bit_size(color_count, 1 + bit_count)
    end
  end

  def palette_bit_size(color_count), do: palette_bit_size(color_count, 1)

  def empty_picture() do
    <<>>
  end

  def test_picture() do
    <<0::2, 1::2, 2::2, 3::2>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    <<pixel_color_index::size(palette_bit_size(color_count)), picture::bitstring>>
  end

  def get_first_pixel(picture, _) when picture == <<>>, do: nil
  def get_first_pixel(picture, color_count) do
    number = palette_bit_size(color_count)
    <<color::size(number), _::bitstring>> = picture
    color
  end

  def drop_first_pixel(picture, _) when picture == <<>>, do: ""
  def drop_first_pixel(picture, color_count) do
    number = palette_bit_size(color_count)
    <<_::size(number), rest::bitstring>> = picture
    rest
  end

  def concat_pictures(picture1, picture2) do
    # Please implement the concat_pictures/2 function
  end
end
