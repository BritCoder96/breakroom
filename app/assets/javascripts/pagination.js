$(document).on('turbolinks:load', function() {
    if ($('#infinite-scrolling').size() > 0) {
        $(window).on('scroll', function() {
            var more_conversations_url;
            more_conversations_url = "/?conversation_page=" + ($('#conversations-feed').data('page') + 1);
            if (more_conversations_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60) {
                // $('.pagination').html('<img src="/ajax-loader.gif" alt="Loading..." title="Loading..." />');
                $.getScript(more_conversations_url);
            }
        });
    }
});
