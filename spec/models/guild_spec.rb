# == Schema Information
#
# Table name: guilds
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  url_safe_name :string(255)
#  users_count   :integer          default(0), not null
#

require 'spec_helper'

describe Guild do
end
