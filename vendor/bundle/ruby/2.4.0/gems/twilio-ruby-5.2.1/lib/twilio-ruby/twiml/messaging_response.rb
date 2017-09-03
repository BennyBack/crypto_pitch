##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module TwiML
    ##
    # <Response> TwiML for Messages
    class MessagingResponse < TwiML
      def initialize(**keyword_args)
        super(**keyword_args)
        @name = 'Response'

        yield(self) if block_given?
      end

      ##
      # Create a new <Message> element
      # message:: Message Body
      # to:: Phone Number to send Message to
      # from:: Phone Number to send Message from
      # action:: Action URL
      # method:: Action URL Method
      # keyword_args:: additional attributes
      def message(message: nil, to: nil, from: nil, action: nil, method: nil, **keyword_args)
        message = Message.new(message: message, to: to, from: from, action: action, method: method, **keyword_args)

        yield(message) if block_given?
        append(message)
      end

      ##
      # Create a new <Redirect> element
      # url:: Redirect URL
      # method:: Redirect URL method
      # keyword_args:: additional attributes
      def redirect(url, method: nil, **keyword_args)
        append(Redirect.new(url, method: method, **keyword_args))
      end
    end

    ##
    # <Redirect> TwiML Verb
    class Redirect < TwiML
      def initialize(url, **keyword_args)
        super(**keyword_args)
        @name = 'Redirect'
        @value = url
        yield(self) if block_given?
      end
    end

    ##
    # <Message> TwiML Verb
    class Message < TwiML
      def initialize(message: nil, **keyword_args)
        super(**keyword_args)
        @name = 'Message'
        @value = message unless message.nil?
        yield(self) if block_given?
      end

      ##
      # Create a new <Body> element
      # message:: Message Body
      # keyword_args:: additional attributes
      def body(message, **keyword_args)
        append(Body.new(message, **keyword_args))
      end

      ##
      # Create a new <Media> element
      # url:: Media URL
      # keyword_args:: additional attributes
      def media(url, **keyword_args)
        append(Media.new(url, **keyword_args))
      end
    end

    ##
    # <Media> TwiML Noun
    class Media < TwiML
      def initialize(url, **keyword_args)
        super(**keyword_args)
        @name = 'Media'
        @value = url
        yield(self) if block_given?
      end
    end

    ##
    # <Body> TwiML Noun
    class Body < TwiML
      def initialize(message, **keyword_args)
        super(**keyword_args)
        @name = 'Body'
        @value = message
        yield(self) if block_given?
      end
    end
  end
end