# == Schema Information
#
# Table name: codes
#
#  id          :integer          not null, primary key
#  source      :text
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  guild_id    :integer
#  quest_id    :integer
#  likes_count :integer          default(0), not null
#

require 'spec_helper'

describe Code do
end
