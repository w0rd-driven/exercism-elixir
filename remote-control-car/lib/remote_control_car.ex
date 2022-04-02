defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [:nickname, battery_percentage: 100, distance_driven_in_meters: 0]

  @spec new :: %__MODULE__{
          battery_percentage: integer(),
          distance_driven_in_meters: integer(),
          nickname: String.t()
        }
  def new() do
    %__MODULE__{nickname: "none"}
  end

  @spec new(any) :: %__MODULE__{
          battery_percentage: integer(),
          distance_driven_in_meters: integer(),
          nickname: String.t()
        }
  def new(nickname) do
    %__MODULE__{nickname: nickname}
  end

  @spec display_distance(%__MODULE__{
          :battery_percentage => integer(),
          :distance_driven_in_meters => integer,
          :nickname => String.t()
        }) :: String.t()
  def display_distance(remote_car = %RemoteControlCar{}) do
    "#{remote_car.distance_driven_in_meters} meters"
  end

  def display_battery(remote_car) do
    # Please implement the display_battery/1 function
  end

  def drive(remote_car) do
    # Please implement the drive/1 function
  end
end
