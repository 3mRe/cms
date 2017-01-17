<div id="gatebuilder_container">
    <div id="gatebuilder"></div>
</div>

<script type="text/javascript">
    function onFailFlashembed() {
        var html = '';

        html += '<div id="flashFail">';
        html += '	<div class="flashFailHead">{t("Get the Adobe Flash Player")}</div>';
        html += '	<div class="flashFailHeadText">';
        html += '		{t("In order to play %SERVER_NAME%, you need the latest version of Flash Player. Just install it to start playing!", $translationVars)}';
        html += '		<div class="flashFailHeadLink">';
        html += '			{t("Download the Flash Player here for free:")} <a href=\"http://www.adobe.com/go/getflashplayer\" style=\"text-decoration: underline; color:#A0A0A0;\">{t("Download Flash Player")}<\/a>';
        html += '		</div>';
        html += '	</div>';
        html += '</div>';

        jQuery('#gatebuilder').html(html);
    }

    function isVideoAvailable() {
        return (window.BrandCinema && BrandCinema.isVideoAvailable());
    }

    function showVideo() {
        if (!window.BrandCinema) {
            return false;
        }

        BrandCinema.showVideo('galaxyGates_spin');
    }

    jQuery(document).ready(function() {
        flashembed("gatebuilder", {
            "src": "{$URL}swf_global/gatebuilder.swf?__cv=f77f1b35e9e498b2f31a069a9c64c700",
            "version": [10, 0],
            "expressInstall": "{$URL}swf_global/expressInstall.swf?__cv=93c5ee756f6d00a09159ecadd5e61c00",
            "onFail": function() {
                onFailFlashembed();
            },
            "width": 786,
            "height": 395,
            "id": "flashGG",
            "wmode": "transparent"
        }, {
            "cdn": "{$URL}",
            "nosid": "1",
            "eventItemEnabled": "",
            "supporturl": "Internal/Support/Start",
            "serverdesc": "{$server->name}",
            "server_code": "1",
            "jackpot": "{$account->jackpot} EUR",
            "uridium_highlighted": "",
            "lang": "{$locale->code}",
            "uid": "{$account->id}",
            "assetsConfigCV": "571284a4a4053c0ce8a0165e395d9300",
            "sid": "{$account->session_id}",
            "useDeviceFonts": "0",
            "languageXmlHash": "d4d539d9732ffac8bb6792ce3de8a600",
            "videoAvailable": "1"
        });
    });

</script>
<input type="hidden" id="videoAvailable" value="1" />
<input type="hidden" id="videoURL" value="{$URL}?req=YToxMzp7czo3OiJ4YWN0aW9uIjtzOjY6ImNpbmVtYSI7czo2OiJkZXNpZ24iO3M6NDoibWF5YSI7czoxMzoiZXhjZXB0TWV0aG9kcyI7czowOiIiO3M6MTA6ImNpbmVtYVR5cGUiO2k6MDtzOjk6InByb2plY3RJRCI7czoyOiIyMiI7czo0OiJsYW5nIjtzOjI6ImVuIjtzOjg6InVzZXJuYW1lIjtzOjA6IiI7czo2OiJ1c2VySUQiO3M6OToiMTY3NzcwMDI0IjtzOjQ6InRpbWUiO2k6MTQ4MzQzNzE0NjtzOjc6InVzZXJBZ2UiO2k6MDtzOjM6ImFpZCI7czoxOiIwIjtzOjY6ImFjdGlvbiI7czo2OiJjaW5lbWEiO3M6MTc6InJlcXVlc3RUcmFja2luZ0lkIjtzOjIzOiJhdXRvLjE0ODM0MzcxNDYuNjUyNTE2OCI7fQ%3D%3D&aid=0&aip=&bptid=&hash=83e212ecaa43a903c812d07997fe4420"
/>
<input type="hidden" id="videoSize" value="900x480" />

<style type="text/css">
    #brand_cinema_layer {
        position: fixed;
        top: 0;
        left: 0;
        background: #000000;
        color: #FFFFFF;
        z-index: 30;
        display: none;
    }

    #brand_cinema_hint {
        text-align: center;
        font-size: 10px;
        margin: 0 40px 10px;
        padding-top: 10px;
    }

    #brand_cinema_layer iframe {
        border: 1px solid #FFFFFF;
        margin: 10px auto 15px;
        display: block;
        border-left: 15px solid #000000;
        border-right: 15px solid #000000;
    }

    #brand_cinema_layer .close_button {
        position: absolute;
        top: 5px;
        right: 5px;
        cursor: pointer;
        width: 24px;
        height: 24px;
        background: url({$URL}do_img/global/skylab/modules_large/close_button_sprite.png?__cv=fa1f7ef0f89ab04212dbf02f3424d700) no-repeat center -24px;
    }

    #brand_cinema_layer .close_button:hover {
        background-position: center 0;
    }

</style>

<div id="brand_cinema_layer">
    <div class="close_button" onclick="BrandCinema.closeVideoLayer()"></div>
    <div id="brand_cinema_hint">{t("You have to watch the full video to get an incentive. Please disable your adblocker!")}</div>

    <iframe src="" height="300" width="300" scrolling="no" frameborder="0">
        {t("Your browser does not support embedded frames.")}
    </iframe>
</div>

<script type="text/javascript" language="javascript">
    var BrandCinema = {
        iFrameWidth: 100,
        iFrameHeight: 100,
        iFrameUrl: '',

        isVideoAvailable: function() {
            return ('1' == jQuery('#videoAvailable').val())
        },

        openVideoLayer: function() {
            showBusyLayer();

            var layerElm = jQuery('#brand_cinema_layer');

            layerElm.show();

            // set up the iFrame
            var videoContent = jQuery('#brand_cinema_layer iframe');
            videoContent.attr('src', this.iFrameUrl);
            videoContent.attr('width', this.iFrameWidth);
            videoContent.attr('height', this.iFrameHeight);

            // center the layer relative to it's parent element
            bodyOffsetWidth = document.documentElement.offsetWidth,
                objectWidth = layerElm.width(),
                // Take the banner (and it's margin) on the right hand side into account
                widthWithBanner = objectWidth + 120,
                objectLeft = (bodyOffsetWidth / 2) - (widthWithBanner / 2),
                bodyOffsetHeight = document.documentElement.offsetHeight,
                objectHeight = layerElm.height(),
                objectTop = (bodyOffsetHeight / 2) - (objectHeight / 2);

            layerElm.css({
                top: objectTop + 'px',
                left: objectLeft + 'px'
            });
        },

        closeVideoLayer: function() {
            //            hideBusyLayer();
            //            jQuery('#brand_cinema_layer').hide();
            do_redirect('{$URL}Internal/GalaxyGates');
        },

        showVideo: function(incentiveKey) {
            // get video properties
            var iFrameURL = jQuery('#videoURL').val();
            var tmpSize = jQuery('#videoSize').val().split('x');
            var iFrameWidth = tmpSize[0];
            var iFrameHeight = tmpSize[1];

            Tools.Popup.Initialize();

            // do some magic
            jQuery.ajax({
                type: 'POST',
                url: '/ajax/cinema.php',
                dataType: 'json',
                data: {
                    action: 'videoRequested',
                    category: incentiveKey
                },
                beforeSend: function() {
                    Tools.Popup.showLoadingDialog();
                },
                success: function(data, status, jqXHR) {
                    Tools.Popup.hideLoadingDialog();

                    if (1 == data.isError) {
                        Tools.Popup.Presets.showErrorDialog(data.message);
                    } else {
                        BrandCinema.iFrameWidth = iFrameWidth;
                        BrandCinema.iFrameHeight = iFrameHeight;
                        BrandCinema.iFrameUrl = iFrameURL;

                        BrandCinema.openVideoLayer();
                    }
                },
                error: function() {
                    Tools.Popup.hideLoadingDialog();
                }
            });

            this.resetCurrentVideo();
        },

        resetCurrentVideo: function() {
            jQuery('#videoAvailable').val('0');
            jQuery('#videoURL').val('');
        }
    };
</script>
