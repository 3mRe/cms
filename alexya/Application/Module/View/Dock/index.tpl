<script src="{$URL}resources/js/dock.js"></script>
<script>
    // Parameters for Tools.Popup
    Tools.Popup.Parameters = {
        "showOnLoad": false,
        "type": "success",
        "content": ""
    };
    // User parameters
    User.Parameters = {
        "balance": {
            "uridium": {$account->uridium},
            "credits": {$account->credits}
        },
        "discountFactor": 1,
        "language": "{$locale->code}",
        "ship": {
            "laserAmmunitionSpace": 0,
            "rocketSpace": 0
        },
        "isActiveHangarEmpty": false,
        "isShipDumpEmpty": true,
        "pet": {$pet}
    };
    // Initialize Tools.Popup
    Tools.Popup.Initialize();
    // Initialize dock
    Dock.Initialize();

    if (window.addEventListener) {
        /** DOMMouseScroll is for mozilla. */
        window.addEventListener('DOMMouseScroll', handleWheelEvent, false);
    }

    /** IE/Opera. */
    window.onmousewheel = document.onmousewheel = handleWheelEvent;

    function handleWheelEvent(e) {
        e.preventDefault();
    }

</script>

<div id="dock_content">
    <div id="dock_container">
        <div id="equipment_container"></div>
    </div>
</div>

<script>
    function onFailFlashembed() {
        var html = '';

        html += '<div id="flashFail">';
        html += '<div class="flashFailHead">{t("Get the Adobe Flash Player")}</div>';
        html += '<div class="flashFailHeadText">';
        html += '{t("In order to play %SERVER_NAME%, you need the latest version of Flash Player. Just install it to start playing!", $translationVars)}';
        html += '<div class="flashFailHeadLink">';
        html += '{t("Download the Flash Player here for free:")} <a href=\"http://www.adobe.com/go/getflashplayer\" style=\"text-decoration: underline; color:#A0A0A0;\">{t("Download Flash Player")}<\/a>';
        html += '</div>';
        html += '</div>';
        html += '</div>';

        jQuery('#equipment_container').html(html);
    }

    function expressInstallCallback(info) {
        // possible values for info: loadTimeOut|Cancelled|Failed
        onFailFlashembed();
    }
    jQuery(document).ready(
        function() {

            flashembed("equipment_container", {
                "onFail": onFailFlashembed,
                "src": "{$URL}swf_global/inventory/inventory.swf",
                "version": [10, 0],
                "expressInstall": "{$URL}swf_global/expressInstall.swf",
                "onFail": function() {
                    onFailFlashembed();
                },
                "width": 770,
                "height": 395,
                "id": "inventory",
                "wmode": "transparent"
            }, {
                "cdn": "{$URL}",
                "nosid": "1",
                "navPoint": "2",
                "eventItemEnabled": "",
                "supporturl": "Internal/Support/Start",
                "serverdesc": "{$server->name}",
                "server_code": "1",
                "jackpot": "{$account->jackpot} EUR",
                "uridium_highlighted": "",
                "lang": "{$locale->code}",
                "sid": "{$account->session_id}",
                "locale_hash": "",
                "dynamicHost": "{$server->host}",
                "menu_layout_config_hash": "dcabf46f2c5aa8e6ffb5d36419de8000",
                "assets_config_hash": "d49d07d425b63d68ee5ff0674719ca00",
                "items_config_hash": "62fc5db82213609eb99dd5acd0115700",
                "useDeviceFonts": "0",
                "languageXmlHash": "d4d539d9732ffac8bb6792ce3de8a600"
            });
        }
    );
</script>
