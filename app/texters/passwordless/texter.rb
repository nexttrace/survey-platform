module Passwordless
  class Texter < ApplicationTexter

    # Sends a magic link (secret token) text.
    # @param session [Session] A Passwordless Session
    def magic_link(session)
      @magic_link = send(Passwordless.mounted_as)
        .token_sign_in_url(session.token)

      text to: session.authenticatable.phone
    end
  end
end

