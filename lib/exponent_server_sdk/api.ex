defmodule ExponentServerSdk.PushNotification do
  alias ExponentServerSdk.Parser
  alias ExponentServerSdk.PushNotification.Client

  @callback push(map(), keyword()) ::
              Parser.success() | Parser.error()

  def push(message, opts \\ []), do: impl().push(message, opts)

  @callback push_list(list(map()), keyword()) :: Parser.success() | Parser.error()
  def push_list(messages, opts \\ []), do: impl().push_list(messages, opts)

  @callback get_receipts(list()) :: Parser.success() | Parser.error()
  def get_receipts(ids), do: impl().get_receipts(ids)

  defp impl do
    Application.get_env(:exponent_server_sdk, :client, Client)
  end
end
