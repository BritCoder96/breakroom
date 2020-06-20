$(document).on('turbolinks:load', function() {
    if ($('#infinite-scrolling').size() > 0) {
        $(window).on('scroll', function() {
            var more_conversations_url;
            more_conversations_url = $('.pagination .next_page').attr('href');
            if (more_conversations_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60) {
                // $('.pagination').html('<img src="/ajax-loader.gif" alt="Loading..." title="Loading..." />');
                $.getScript(more_conversations_url);
            }
        });
    }
});
