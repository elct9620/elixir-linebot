defmodule Linebot do
  @moduledoc """
  The API Client Implement for LINE
  """

  @api_endpoint "https://api.line.me/v2/bot"

  def reply_to(token, messages) do
    HTTPoison.post(
      "#{@api_endpoint}/message/reply",
      %{replyToken: token, messages: messages} |> Jason.encode!,
      [
        "Content-Type": "application/json",
        "Authorization": "Bearer #{channel_access_token()}"
      ]
    )
  end

  def channel_secret, do: Application.get_env(:linebot, :channel_secret)
  def channel_access_token, do: Application.get_env(:linebot, :channel_access_token)
end
