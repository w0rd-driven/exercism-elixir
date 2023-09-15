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
    # Please implement the test_picture/0 function
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    # Please implement the prepend_pixel/3 function
  end

  def get_first_pixel(picture, color_count) do
    # Please implement the get_first_pixel/2 function
  end

  def drop_first_pixel(picture, color_count) do
    # Please implement the drop_first_pixel/2 function
  end

  def concat_pictures(picture1, picture2) do
    # Please implement the concat_pictures/2 function
  end
end
