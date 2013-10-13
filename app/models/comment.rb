# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#  code_id    :integer
#

class Comment < ActiveRecord::Base
  include ActionView::Helpers::DateHelper

  belongs_to :user
  belongs_to :code

  def as_json(options={})
    user_json = { user: { exclude: [:name, :email], methods: :gravatar_url} }
    super({ include: user_json, methods: :friendly_created_date }.merge(options))
  end

  def friendly_created_date
    I18n.t 'general.time.before', time: distance_of_time_in_words_to_now(self.created_at)
  end
end
