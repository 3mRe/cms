jQuery(document).ready(function() {
    externalHomeNew.init();
});

var externalHomeNew = {
    init: function() {
        this.showErrorMessage();
        this.enableScreenshots();
        this.setAutoFocus();
    },

    showErrorMessage: function() {
        var errorContent = jQuery('#loginErrorWrapper').html();

        if (!errorContent) {
            return null;
        }

        jQuery.colorbox({
            open: true,
            html: errorContent,
            width: '500px'
        });
    },

    setAutoFocus: function() {
        jQuery('#bgcdw_login_form_username').focus();
    },

    enableScreenshots: function() {
        jQuery('a.eh_screen_trigger').colorbox({
            rel: 'screenshots'
        });
    }
}
