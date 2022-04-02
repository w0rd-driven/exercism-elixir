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

  @spec display_battery(%__MODULE__{
          :battery_percentage => integer(),
          :distance_driven_in_meters => integer,
          :nickname => String.t()
        }) :: String.t()
  def display_battery(remote_car = %RemoteControlCar{}) do
    # Please implement the display_battery/1 function
    if remote_car.battery_percentage == 0 do
      "Battery empty"
    else
      "Battery at #{remote_car.battery_percentage}%"
    end
  end

  @spec drive(%__MODULE__{
          :battery_percentage => integer(),
          :distance_driven_in_meters => integer,
          :nickname => String.t()
        }) :: %__MODULE__{}
  def drive(remote_car = %RemoteControlCar{}) do
    new_percentage =
      if remote_car.battery_percentage == 0, do: 0, else: remote_car.battery_percentage - 1

    new_distance =
      if remote_car.battery_percentage == 0,
        do: 0,
        else: remote_car.distance_driven_in_meters + 20

    %{remote_car | battery_percentage: new_percentage, distance_driven_in_meters: new_distance}
  end
end
