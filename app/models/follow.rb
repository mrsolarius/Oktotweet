# frozen_string_literal: true
class Follow < ApplicationRecord
  belongs_to :follower, class_name: 'User', foreign_key: 'follower_user_id'
  belongs_to :followed_user, class_name: 'User', foreign_key: 'followed_user_id'
  validate :cant_self_follow

  private

  def cant_self_follow
    errors.add(%i[follower followed_user], 'Imposible de vous auto follow') if follower == followed_user
  end
end
