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
    File.open!(path, [:write])
  end

  @spec log_sent_email(atom | pid, String.t()) :: :ok
  def log_sent_email(pid, email) do
    IO.puts(pid, email)
  end

  @spec close_log(pid | {:file_descriptor, atom, any}) :: :ok | {:error, atom}
  def close_log(pid) do
    File.close(pid)
  end

  @spec send_newsletter(
          String.t()
          | maybe_improper_list(
              String.t() | maybe_improper_list(any, String.t() | []) | char,
              String.t() | []
            ),
          String.t()
          | maybe_improper_list(
              String.t() | maybe_improper_list(any, String.t() | []) | char,
              String.t() | []
            ),
          any
        ) :: :ok | {:error, atom}
  def send_newsletter(emails_path, log_path, send_fun) do
    device = open_log(log_path)
    emails = read_emails(emails_path)
    for email <- emails do
      case send_fun.(email) do
        :ok -> log_sent_email(device, email)
        _ -> nil
      end
    end
    close_log(device)
  end
end
