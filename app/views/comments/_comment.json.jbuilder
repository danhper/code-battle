json.(comment, :id, :content, :friendly_created_date)
json.user do
  json.partial! 'users/user.json', user: comment.user
end

json.can_edit can?(:update, comment)
