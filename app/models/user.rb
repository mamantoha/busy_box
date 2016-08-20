class User < ApplicationRecord
  scope :online_users, -> { where(online: true) }

  def appear
    self.online = true
    self.save

    AppearanceBroadcastJob.perform_later online_users
  end

  def away
    self.online = false
    self.save

    AppearanceBroadcastJob.perform_later online_users
  end

  private

  def online_users
    User.online_users.to_a
  end
end
