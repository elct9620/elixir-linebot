defmodule Linebot.Signature do
  def verify(body, signature), do: sign(Linebot.channel_secret, body) == signature
  def http_header(), do: "x-line-signature"
  def sign(key, body), do: :crypto.hmac(:sha256, key, body) |> Base.encode64
end
