class AppearanceBroadcastJob < ApplicationJob
  queue_as :default

  def perform(users)
    ActionCable.server.broadcast 'appearance_channel', appearances: users
  end
end
