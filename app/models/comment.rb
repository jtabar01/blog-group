# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :post_id, presence: true
  validates :body, presence: true
  resourcify
end
