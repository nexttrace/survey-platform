class InvitationTexter < ApplicationTexter

  def test_result(invitation)
    @invitation = invitation
    @survey_url = code_url(@invitation.token)
    text to: @invitation.sent_to
  end

end
