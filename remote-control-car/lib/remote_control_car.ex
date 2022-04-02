defmodule RemoteControlCar do
  defstruct [:battery_percentage, :distance_driven_in_meters, :nickname]

  @spec new :: %RemoteControlCar{
          battery_percentage: integer(),
          distance_driven_in_meters: integer(),
          nickname: String.t()
        }
  def new() do
    %RemoteControlCar{
      battery_percentage: 100,
      distance_driven_in_meters: 0,
      nickname: "none"
    }
  end

  def new(nickname) do
    # Please implement the new/1 function
  end

  def display_distance(remote_car) do
    # Please implement the display_distance/1 function
  end

  def display_battery(remote_car) do
    # Please implement the display_battery/1 function
  end

  def drive(remote_car) do
    # Please implement the drive/1 function
  end
end
