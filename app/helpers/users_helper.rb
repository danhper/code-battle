def code_author?(code)
  user_signed_in? && current_user == code.author
end
