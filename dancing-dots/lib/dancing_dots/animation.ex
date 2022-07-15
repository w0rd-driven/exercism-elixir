defmodule DancingDots.Animation do
  @type dot :: DancingDots.Dot.t()
  @type opts :: keyword
  @type error :: any
  @type frame_number :: pos_integer

  # Please implement the module
  @callback init(opts) :: {:ok, opts} | {:error, error}
  @callback handle_frame(dot, frame_number, opts) :: dot
end

defmodule DancingDots.Flicker do
  # Please implement the module
end

defmodule DancingDots.Zoom do
  # Please implement the module
end
