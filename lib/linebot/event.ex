defmodule Linebot.Event do
  @callback handle_event(request :: term, source :: term, event :: term) :: :ok

  defmacro __using__(__params) do
    quote do
      @behaviour Linebot.Event
    end
  end

  def exec(handler, %{"type" => "message"} = event), do: handler.handle_event({:message, event["message"]}, event["source"], event)
  def exec(handler, %{"type" => "follow"} = event), do: handler.handle_event(:follow, event["source"], event)
  def exec(handler, %{"type" => "unfollow"} = event), do: handler.handle_event(:unfollow, event["source"], event)
  def exec(handler, %{"type" => "join"} = event), do: handler.handle_event(:join, event["source"], event)
  def exec(handler, %{"type" => "leave"} = event), do: handler.handle_event(:leave, event["source"], event)
  def exec(handler, %{"type" => "memberJoined"} = event), do: handler.handle_event({:member_joined, event["joined"]["members"]}, event["source"], event)
  def exec(handler, %{"type" => "memberLeft"} = event), do: handler.handle_event({:member_left, event["left"]["members"]}, event["source"], event)
  def exec(handler, %{"type" => "postback"} = event), do: handler.handle_event({:postback, event["postback"]}, event["source"], event)
  def exec(handler, %{"type" => "beacon"} = event), do: handler.handle_event({:beacon, event["beacon"]}, event["source"], event)
  def exec(handler, %{"type" => "accountLink"} = event), do: handler.handle_event({:account_link, event["link"]}, event["source"], event)
  def exec(handler, %{"type" => "things"} = event), do: handler.handle_event({:things, event["things"]}, event["source"], event)
  def exec(handler, %{"type" => ""} = event), do: handler.handle_event({:things, event["things"]}, event["source"], event)

  # Common Properties
  def type(%{"type" => type}), do: type
  def source(%{"source" => source}), do: source
  def timestamp(%{"timestamp" => timestamp}), do: timestamp
  def mode(%{"mode" => mode}), do: mode
  def mode(_), do: nil
  def reply_token(%{"replyToken" => token}), do: token
  def reply_token(_), do: nil
end
