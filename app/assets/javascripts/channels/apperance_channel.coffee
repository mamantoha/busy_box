App.appearance = App.cable.subscriptions.create "AppearanceChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    @appear()

  disconnected: ->
    # Called when the subscription has been terminated by the server
    @away

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('#active_users_list').html(
      ("<li>#{appearance['id']}</li>" for appearance in data['appearances']).join("")
    )

  appear: ->
    # Call AppearanceChannel#appear
    @perform('appear')

  away: ->
    # Call AppearanceChannel#away
    @perform('away')
