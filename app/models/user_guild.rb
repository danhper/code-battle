# == Schema Information
#
# Table name: user_guilds
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  guild_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class UserGuild < ActiveRecord::Base
end
