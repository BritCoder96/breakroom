jQuery(document).on('turbolinks:load', function() {
    var messages, messages_to_bottom;
    messages = $('#messages');
    if ($('#messages').length > 0) {
        messages_to_bottom = function() {
            return messages.scrollTop(messages.prop("scrollHeight"));
          };
        messages_to_bottom();
        App.global_chat = App.cable.subscriptions.create({
            channel: "TopicsChannel",
            topic_id: messages.data('topic-id')
        }, {
            connected: function() {},
            disconnected: function() {},
            received: function(data) {
              messages.append(data['message']).find(".message:last").slideDown("fast");
              return messages_to_bottom();
            },
            send_message: function(message, topic_id) {
              return this.perform('send_message', {
                message: message,
                topic_id: topic_id
              });
            }
        });
        return $('#new_message').submit(function(e) {
            var $this, textarea;
            $this = $(this);
            textarea = $this.find('#message_body');
            if ($.trim(textarea.val()).length > 1) {
              App.global_chat.send_message(textarea.val(), messages.data('topics-id'));
              textarea.val('');
            }
            e.preventDefault();
            return false;
        });
    }
});