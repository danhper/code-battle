module CodesHelper
  def can_like?(code)
    user_signed_in? && current_user != code.author && current_user.in_guild?(code.guild)
  end
end
