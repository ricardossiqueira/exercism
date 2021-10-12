defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [:nickname, battery_percentage: 100, distance_driven_in_meters: 0]

  def new(nickname \\ "none"), do: %__MODULE__{nickname: nickname}

  def display_distance(%__MODULE__{distance_driven_in_meters: distance_driven_in_meters}),
    do: to_string(distance_driven_in_meters) <> " meters"

  def display_battery(%__MODULE__{battery_percentage: battery_percentage}),
    do:
      if(battery_percentage == 0, do: "Battery empty", else: "Battery at #{battery_percentage}%")

  def drive(remote_control_car = %__MODULE__{battery_percentage: 0}),
    do: remote_control_car

  def drive(
        remote_control_car = %__MODULE__{
          battery_percentage: battery_percentage,
          distance_driven_in_meters: distance_driven_in_meters
        }
      ),
      do: %__MODULE__{
        remote_control_car
        | battery_percentage: battery_percentage - 1,
          distance_driven_in_meters: distance_driven_in_meters + 20
      }
end
