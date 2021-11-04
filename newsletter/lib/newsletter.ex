defmodule Newsletter do
  @spec read_emails(
          String.t()
          | maybe_improper_list(
              String.t() | maybe_improper_list(any, String.t() | []) | char,
              String.t() | []
            )
        ) :: [String.t()]
  def read_emails(path) do
    {:ok, file} = File.read(path)
    file |> String.split(~r{\s}, trim: true)
  end

  @spec open_log(
          String.t()
          | maybe_improper_list(
              String.t() | maybe_improper_list(any, String.t() | []) | char,
              String.t() | []
            )
        ) :: pid | {:file_descriptor, atom, any}
  def open_log(path) do
    {:ok, pid} = File.open(path, [:write])
    pid
  end

  @spec log_sent_email(atom | pid, String.t()) :: :ok
  def log_sent_email(pid, email) do
    IO.write(pid, email <> "\n")
  end

  def close_log(pid) do
    # Please implement the close_log/1 function
  end

  def send_newsletter(emails_path, log_path, send_fun) do
    # Please implement the send_newsletter/3 function
  end
end
