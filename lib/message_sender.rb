class MessageSender
  def self.send_message(alert_id, host, to, message)
    new.send_message(alert_id, host, to, message)
  end

  def initialize
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_message(alert_id, host, to, message)
    @client.messages.create(
    from: "+19179354447",
    to:   "+17187496890",
    body: "Your currency has reached the requested amount!",
    )
  end
end
