<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:og="http://opengraphprotocol.org/schema/" xmlns:fb="http://www.facebook.com/2008/fbml">

<head>
    <title>{$server->title}</title>

    <meta name="description" content="{$server->description}" />
    <meta http-equiv="X-UA-Compatible" content="IE=9" />

    <meta name="keywords" content="{implode($server->tags, " , ")}" />
    <meta name="robots" content="" />

    <meta http-equiv="Content-Language" content="at, de, ch" />
    <meta name="language" content="deutsch, de, at, ch" />
    <meta name="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="author" content="{$server->author}" />
    <meta name="publisher" content="{$server->publisher}" />
    <meta name="revisit-after" content="10 days" />
    <meta name="page-topic" content="Leisure, Entertainment" />
    <meta name="reply-to" content="{$server->reply_to}" />
    <meta name="distribution" content="global" />
    <meta name="company" content="{$server->company}" />

    <meta property="og:title" content="{$server->name}" />
    <meta property="og:type" content="game" />
    <meta property="og:url" content="{$URL}" />
    <meta property="og:image" content="{$URL}do_img/global/fb_icon.jpg" />
    <meta property="og:site_name" content="{$server->name}" />
    <meta property="og:description" content="{t($server->description)}" />
    <meta property="og:locale" content="{$locale->code}" />
    {foreach from=$server->locales item=$l}
    <meta property="og:locale:alternate" content="{$l->code}" />
    {/foreach}

    <meta name="SKYPE_TOOLBAR" content="SKYPE_TOOLBAR_PARSER_COMPATIBLE" />
    <style type="text/css" media="screen">
        @import "{$URL}css/cdn/darkorbit.css";
    </style>

    <!--[if lt IE 8]>
    <style type="text/css" media="screen">    @import "{$URL}css/cdn/darkorbit_ie.css"; </style>
    <![endif]-->
    <style type="text/css" media="screen">
        @import "{$URL}css/cdn/includeSkinNavbar.css";
    </style>
    <style type="text/css" media="screen">
        @import "{$URL}css/cdn/includeInfoStyles.css";
    </style>

    <link href='http://fonts.googleapis.com/css?family=Ubuntu+Condensed&subset=latin,greek,cyrillic' rel='stylesheet' type='text/css'>

    <link href='http://fonts.googleapis.com/css?family=Ubuntu:400,700,500italic&subset=latin,greek,cyrillic' rel='stylesheet' type='text/css'>

    <link href='http://fonts.googleapis.com/css?family=Roboto:900' rel='stylesheet' type='text/css'>

    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed' rel='stylesheet' type='text/css'>

    <link type="text/css" href="{$URL}css/cdn/jQuery/jquery.jscrollpane.css" rel="stylesheet" media="all" />
    <link type="text/css" href="{$URL}css/cdn/scrollbar_dark.css" rel="stylesheet" media="all" />
    <link rel="stylesheet" media="all" href="{$URL}css/cdn/internalStart.css" />
    <link rel="stylesheet" media="all" href="{$URL}css/cdn/window.css" />
    <link rel="stylesheet" media="all" href="{$URL}css/cdn/window_alert.css" />

    <link rel="SHORTCUT ICON" href="{$URL}favicon.ico" type="image/x-icon">

    <script language="javascript">
        var CDN = "{$URL}";
    </script>

    <script type="text/javascript" src="{$URL}js/scriptaculous/prototype.js"></script>
    <script type="text/javascript" src="{$URL}js/scriptaculous/scriptaculous.js"></script>
    <script type="text/javascript" src="{$URL}js/scriptaculous/do_extensions.js"></script>
    <script type="text/javascript" src="{$URL}js/scriptaculous/window.js"></script>
    <script type="text/javascript" src="{$URL}js/scriptaculous/tooltip.js"></script>
    <script type="text/javascript" src="{$URL}js/tooltipPilotSheet.js"></script>
    <script type="text/javascript" src="{$URL}js/livepipe.js"></script>
    <script type="text/javascript" src="{$URL}js/scroller.js"></script>
    <script type="text/javascript" src="{$URL}js/customSelect.js"></script>
    <script type="text/javascript" src="{$URL}js/jQuery/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="{$URL}js/jQuery/jquery.mousewheel.js"></script>
    <script type="text/javascript" src="{$URL}js/jQuery/jquery.jscrollpane.min.js"></script>
    <script type="text/javascript" src="{$URL}js/jQuery/custom-form-elements.js"></script>
    <script type="text/javascript" src="{$URL}js/jQuery/jquery.flashembed.js"></script>
    <script type="text/javascript" src="{$URL}js/jQuery/doExtensions.js"></script>
    <script type="text/javascript" src="{$URL}js/jQuery/jquery.qtip-1.0.0-rc3.min.js"></script>
    <script type="text/javascript" src="{$URL}js/jQuery/jquery.livequery.js" id="liveQuery"></script>
    <script type="text/javascript" src="{$URL}js/hangarSlots.js"></script>
    <script type="text/javascript">
        jQuery.noConflict();
    </script>
    <script type="text/javascript" src="{$URL}resources/js/tools.js"></script>
    <script type="text/javascript" src="{$URL}resources/js/tools/text.js"></script>
    <script type="text/javascript" src="{$URL}resources/js/user.js"></script>
    <!-- Darkorbit Javascript tools -->
    <script type="text/javascript">
        var textResourcesTitle = {
            "seo_title_client": "{$server->name}",
            "seo_title_client_blinking": "{$server->title} | {t("Game Client")}",
            "seo_title_no_aid": "{$server->name} | {t("MMO & space shooter")}",
            "seo_tittle_clans": "{$server->name} | {t("Clans")}",
            "seo_tittle_pet": "{$server->name} | {t("PET")}",
            "seo_tittle_ships": "{$server->name} | {t("Ships")}",
            "seo_tittle_uridium": "{$server->name} | {t("Uridium")}",
            "seo_tittle_techfactory": "{$server->name} | {t("Tech Factory")}",
            "seo_tittle_hangar": "{$server->name} | {t("Hangar")}",
            "seo_title_standard": "{$server->name}| {t("MMO & space shooter")}",
            "seo_title_achievements": "{$server->name} | {t("Achievements")}",
            "seo_title_shop": "{$server->name} | {t("Shop")}",
            "seo_title_skylab": "{$server->name} | {t("Skylab")}"
        };

        jQuery.each(textResourcesTitle, function(i, n) {
            Tools.Text.setResource(i, n)
        });

        Tools.Text.setResource('message_contact_block_user', '{t("This pilot has been added to your blacklist.")}');
        Tools.Text.setResource('message_contact_unblock_user', '{t("The pilot has been removed from your blacklist.")}');
        Tools.Text.setResource('message_contact_user_is_blocking_contacts', '{t("This pilot does not accept contact requests.")}');
        Tools.Text.setResource('message_contact_invite_sended', '{t("Your friendship request has been sent!")}');
    </script>
    <script type="text/javascript" src="{$URL}resources/js/tools/popup.js"></script>
    <script type="text/javascript" src="{$URL}resources/js/tools/errorHandler.js"></script>
    <script type="text/javascript" src="{$URL}resources/js/library.js"></script>
    <script type="text/javascript" src="{$URL}resources/js/main.js" type="text/javascript"></script>
    <script language="javascript">
        Main.Initialize('1', 'dosid={$account->session_id}');
    </script>

    <script src="{$URL}js/function.js" type="text/javascript"></script>
    <script src="{$URL}js/base.js" type="text/javascript"></script>
    <script type="text/javascript">
        jQuery.fn.qtip.styles.dohdr = {
            background: '#000000',
            'font-size': '11px',
            width: 'auto',
            color: '#666666',
            border: {
                width: 1,
                radius: 1,
                color: '#303030'
            },
            tip: 'topLeft',
            name: 'dark'
        };
        jQuery.fn.qtip.styles.dohdr300 = {
            background: '#000000',
            'font-size': '11px',
            width: 'auto',
            color: '#666666',
            border: {
                width: 1,
                radius: 1,
                color: '#303030'
            },
            tip: 'topLeft',
            width: 300,
            name: 'dark'
        };
        jQuery.fn.qtip.styles.doauc300 = {
            background: '#000000',
            'font-size': '11px',
            width: 'auto',
            color: '#666666',
            border: {
                width: 1,
                radius: 1,
                color: '#303030'
            },
            tip: 'topLeft',
            width: 300,
            name: 'dark'
        };

        var header_ttips = new Object;
        header_ttips['uid'] = '{t("User ID")}';
        header_ttips['lvl'] = '{t("Level")}';
        header_ttips['exp'] = '{t("Still %EXP_FOR_NEXT_LEVEL% up to the next level", $translationVars)}';
        header_ttips['hnr'] = '{t("Honor")}';
        header_ttips['fri'] = '';
        header_ttips['nms'] = '{t("You have %UNREAD_MESSAGES_COUNT% new messages", $translationVars)}';
        header_ttips['jpt'] = '{t("Jackpot")}';
        header_ttips['uri'] = '{t("Uridium")}';
        header_ttips['cdt'] = '{t("Credits")}';

        header_ttips['userInfo_addFriend'] = '{t("Add as friend")}';
        header_ttips['userInfo_sendMessage'] = '{t("Create message")}';
        header_ttips['userInfo_showProfile'] = '{t("Display player profile")}';
        header_ttips['userInfo_blacklistUser'] = '{t("Add pilots to your blacklist")}';
        header_ttips['userInfo_blacklistUserListed'] = '{t("This pilot is on your blacklist.")}';

        header_ttips['pilot'] = '{t("Here you will find:<br />- Profile<br />- Achievements<br />- Skill tree<br />- Friends & Bonuses")}';
        header_ttips['skylab'] = '{t("Here you will find:<br />- Skylab<br />- Tech factory<br />- Item upgrades")}';

        header_ttips['hangarSlot_arrow_tooltip_expand'] = '{t("Expand")}';
        header_ttips['hangarSlot_arrow_tooltip_collapse'] = '{t("Collapse")}';

        header_ttips['tp_expand_hangar'] = '{t("Purchase an additional hangar hall.")}';
        header_ttips['head_multiplier'] = '{t("The next time you purchase Uridium you\'ll receive 0 times the amount of total Uridium you bought.")}';
        header_ttips['clanInfo_contactClan'] = '{t("Contact clan")}';

        header_ttips['header_home'] = '{t("Home")}';
        header_ttips['header_server'] = '{t("Server")}';
        header_ttips['header_help'] = '{t("Help")}';
        header_ttips['header_logout'] = '{t("Logout")}';
        header_ttips['header_account'] = '{t("Account Center")}';

        User.Parameters = {
            "balance": {
                "uridium": {$account->uridium},
                "credits": {$account->credits}
            },
            "language": "{$locale->code}",
            "isActiveHangarEmpty": false
        };
    </script>
</head>

<body onLoad="">
    <!-- affiliateStartTag -->
    <!-- Login Tag (58) -->

    <script type="text/javascript">
        window.name = "do_webpage";
    </script>

    <!-- user context info layer -->
    <div id="userInfoLayer" style="display:none;position:absolute;z-index:100;"></div>
    <!-- hangar context info layer -->
    <div id="hangarInfoLayer" style="display:none;position:absolute;z-index:100;"></div>
    <!-- clan info layer -->
    <div id="clanInfoLayer" style="display:none;position:absolute;z-index:100;"></div>
    <!-- seitenabdecker -->

    <div id="generalInfoPopup" class="fliess13px-grey">
        <div class="popup_headcontainer">
            <a id="general_popup_close" class="popup_close" href="javascript:void(0)" onclick="Main.hideGeneralInfoLayer()"></a>
        </div>
        <div id="general_popup_question" class="question">
            <img src="{$URL}do_img/global/popups/general/success_icon.png" id="general_popup_success" class="success" />
            <img src="{$URL}do_img/global/popups/general/error_icon.png" id="general_popup_error" class="error" />
            <p id="general_popup_question_text">this text will be replace on ajax call</p>
        </div>
        <div class="popup_contentcontainer">
            <div class="popup_footcontainer">
                <div id="general_popup_close_button" class="popup_close_button" onclick="Main.hideGeneralInfoLayer()">
                    <img src="{$URL}do_img/global/text_tf.esg?l={$locale->code}&s=12&t=ok&f=eurostyle_thea&color=white&bgcolor=grey" />
                </div>
            </div>
        </div>
    </div>

    <div id="busy_layer"></div>
    <div id="busy_layer_hh"></div>
    <div id="instanceList"></div>
    <div id="spinner" class="hidden"></div>

    <!-- seitenabdecker -->

    <style type="text/css" media="screen">
        @import "{$URL}css/cdn/includeInfoLayer.css";
    </style>
    <script type="text/javascript">
        infoText = '';
        icon = '';
    </script>
    <script type="text/javascript" src="{$URL}js/infoLayer.js"></script>

    <div id="infoLayer" class="confirmInfoLayer fliess13px-grey">
        <div class="popup_shop_headcontainer">
            <a class="popup_shop_close" href="javascript: void(0);" onclick="closeInfoLayer()"></a>
        </div>
        <div class="popup_shop_contentcontainer">
            <br>
            <div class="question"></div>
            <div class="popup_shop_footcontainer">
                <div id="infoLayerConfirm">
                    <div class="popup_shop_confirm_button">
                        <div id="infoLayer_link_confirm" class="popup_shop_confirm_text" style="background-image: url('{$URL}do_img/global/text_tf.esg?l={$locale->code}&s=12&t=ok&f=eurostyle_thea&color=white&bgcolor=grey');"></div>
                    </div>
                    <div class="popup_shop_abort_button">
                        <div class="popup_shop_abort_text" style="background-image: url('{$URL}do_img/global/text_tf.esg?l={$locale->code}&s=12&t=confirmBox_cancel&f=eurostyle_thea&color=white&bgcolor=grey');" onclick="closeInfoLayer();"></div>
                    </div>
                </div>

                <div id="infoLayerInfo">
                    <div class="popup_shop_close_button">
                        <div class="popup_shop_close_text" style='background-image: url("{$URL}do_img/global/text_tf.esg?l={$locale->code}&s=12&t=ok&f=eurostyle_thea&color=white&bgcolor=grey");' onclick="closeInfoLayer();"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function showHelp() {
            showBusyLayer();
            width_x = document.body.offsetWidth;
            container_x = jQuery("#helpLayer").width();
            jQuery("#helpLayer").css('left', ((width_x / 2) - (container_x / 2)) + 'px');
            jQuery("#helpLayer").css('top', '150px');
            jQuery("#helpLayer").css('display', 'block');
        }
    </script>

    <div id="helpLayer" style="position:absolute;width:480px;display:none;z-index:10;" class="fliess11px-grey">
        <div id="popup_standard_headcontainer">
            <div id="popup_standard_headline"><img src="{$URL}do_img/global/text.esg?l={$locale->code}&s=9&t=Help&f=eurostyle_clan"></div>
            <div id="popup_standard_close">
                <a href="javascript:void(0);" onclick="closeLayer('helpLayer');" onfocus="this.blur();"><img src="{$URL}do_img/global/popups/popup_middle_close.jpg"></a>
            </div>
        </div>
        <div id="popup_standard_content">
            <div id="popup_info_sign_bg" style="background-image:url({$URL}do_img/global/popups/infopopup_bg_help.png);">
                <p>
                    <strong>{t("Greetings Space Pilot,")}</strong>
                    <br />
                    <br /> {t("Your %SERVER_NAME% journey will lead you to far-off galaxies fraught with danger and mystery. Your first rule of thumb is not to panic!", $translationVars)}<br />
                    <br /> {t("You can always get help here:")}
                    <ul style="margin:20px 0px;">
                        <li style="margin-left:20px;list-style-type:disc;">{t("Visit our")} <a href="{$URL}Forum" target="_blank" onfocus="this.blur()" style="text-decoration:underline">{t("Forum")}</a>.</li>
                    </ul>
                    {t("If you can't find any answers to your questions contact")} <a href="{$URL}Internal/Support/Start" target="_blank" onfocus="this.blur()" style="text-decoration:underline">{t("Support")}</a>.<br />
                    <br /> {t("Godspeed, captain!")}
                    <br style="margin-bottom: 30px;" />
                </p>
            </div>
        </div>
        <div id="popup_standard_content_additionalInfo">

        </div>
        <div id="popup_standard_footercontainer">
            <div id="popup_standard_singleButton">
                <table border="0" cellpadding="0" cellspacing="0" align="center" onclick="closeLayer('helpLayer');">
                    <tr>
                        <td class="button_resizable_1"></td>
                        <td class="button_resizable_2"><img src="{$URL}do_img/global/text.esg?l={$locale->code}&s=9&t=ok&f=eurostyle_clan"></td>
                        <td class="button_resizable_3"></td>
                    </tr>
                </table>
            </div>
        </div>
        <br class="clearMe" />
    </div>

    <style>
        #news {
            position: absolute;
            left: 50%;
            top: 85px;
            margin-left: -400px;
            background-position: 0 0px;
            text-align: left;
            z-index: 10000;
            border: 2px solid white;
        }

        #news_head {
            width: 680px;
            height: 40px;
            background-image: url({$URL}do_img/global/popups/popup2_top_bg.jpg);
            text-align: right;
        }

        #news_head_date {
            float: left;
            margin: 6px 0 0 10px;
        }

        #news_content {
            background-image: url({$URL}do_img/global/popups/popup2_mid_bg.jpg);
            padding: 20px 35px;
            width: 610px;
            background-repeat: repeat-y;
            height: 460px;
            overflow: auto;
        }

        #news_content li {
            list-style-type: disc;
            margin-left: 15px;
        }

        * html #news_content {
            width: 610px;
        }

        #news_bottom {
            width: 680px;
            height: 49px;
            background-image: url({$URL}do_img/global/popups/popup2_bottom_bg.jpg);
            padding-top: 15px;
            vertical-align: top;
        }

        #news_but_close {
            width: 160px;
            height: 19px;
            margin: auto;
            text-align: center;
            line-height: 19px;
            background-image: url({$URL}do_img/global/popups/popup2_button_bg.png);
        }
    </style>

    <div id="news" style="width:680px;display:none;">
        {foreach from=$news item=$n}
        <div id="news_{$n->id}" class="news_container" style="display: none;">
            <div id="news_head">
                {$translationVars["NEWS_DATE"] = $n->date}
                <div id="news_head_date" class="fliess11px-weiss">{t("News from %NEWS_DATE%", $translationVars)}</div>
                <a id="closeButton" href="javascript:void(0);" onclick="closeNews('{$n->id}');" onfocus="this.blur()"><img src="{$URL}do_img/global/popups/popup2_closebutton.jpg" width="30" height="29"></a>
            </div>

            <div id="news_content" class="fliess11px-weiss">
                <h3 class="bn_headline">{t($n->title)}</h3>
                <br />
                <div class="bn_teaser"><b>{t($n->teaser)}</b></div>
                <br/>
                <div class="bn_content">
                    {t($n->content)}
                </div>
                <br/>
                <br/>
                <div class="bn_footer">{t("Your %SERVER_NAME Team", $translationVars)}</div>
                <br />
            </div>

            <div id="news_bottom" class="fliess11px">
                <div style="float:left;margin-left:16px;">
                    <a href="javascript: showNews('{$n->id}');">
                        <img src="{$URL}do_img/global/popups/popup2_but_backward.jpg" width="42" height="20" />
                    </a>
                </div>
                <div id="news_but_close">
                    <a href="javascript:void(0);" onclick="closeNews('{$n->id}');" style="display:block;" onfocus="this.blur();">
                        <strong>{t("Close")}</strong>
                    </a>
                </div>
            </div>
        </div>
        {/foreach}
    </div>

    <script>
        var SID = 'dosid={$account->session_id}';

        //var win = window;
        //width_x = win.innerWidth ? win.innerWidth : win.document.body.clientWidth;
        //container_x = jQuery("#news").width();
        //jQuery("#news").css('left', ((width_x/2) - (container_x/2)) - 100 +'px');
        //jQuery("#news").css('top', '50px');

        function showNews(newsID) {
            jQuery('.news_container').hide();
            jQuery('#news').show();
            jQuery("#news_" + newsID).show();
            showBusyLayer();
        }

        function closeNews(newsID) {
            jQuery("#news").hide();
            hideBusyLayer();
        }
    </script>

    <div class="backgroundImageContainer" style="background-image: url({$URL}do_img/global/bg_standard_{$account->Faction->tag}.jpg)">
        <div class="overallContainer">
            <div class="outerContainer fliess11px-gelb">
                <div class="header_standard" id="header_intern">
                    <div id="header_branding">
                        <img id="PartnerCobrandLogo" src="{$URL}published/cobrands/0_22_2.png" />
                    </div>

                    <div id="header_ship" style="background-image: url({$URL}do_img/global/header/ships/model{$account->Ship->id}.png)"></div>
                    <a id="header_logo" href="{$URL}Internal/Start"></a>
                    <div id="header_top_bar">
                        <div id="header_top_id" class="header_top_item">
                            <div class="header_item_wrapper">
                                <img src="{$URL}do_img/global/header/buttons/icon_stats_ID.png" width="16" height="13" alt="" />
                                <span>{$account->id}</span>
                            </div>
                        </div>
                        <div id="header_top_level" class="header_top_item">
                            <div class="header_item_wrapper">
                                <img src="{$URL}do_img/global/header/buttons/icon_stats_lvl.png" width="16" height="13" alt="" />
                                <span>{$account->Level->id}</span>
                            </div>
                        </div>
                        <div id="header_top_hnr" class="header_top_item">
                            <div class="header_item_wrapper">
                                <img src="{$URL}do_img/global/header/buttons/icon_stats_hon.png" width="16" height="13" alt="" />
                                <span>{$account->honor}</span>
                            </div>
                        </div>
                        <div id="header_top_exp" class="header_top_item">
                            <div class="header_item_wrapper">
                                <img src="{$URL}do_img/global/header/buttons/icon_stats_exp.png" width="16" height="13" alt="" />
                                <span>{$account->experience}</span>
                            </div>
                        </div>
                    </div>
                    <div id="header_second_bar">
                        <script type="text/javascript" src="{$URL}js/externalDefault/lpInstances.js"></script>
                        <div id="header_button_home" onclick="do_redirect('{$URL}Internal/Start')"></div>
                        <div id="header_button_server" onclick="Main.getInstanceList()"></div>
                        <div id="header_button_logout" onclick="do_redirect('{$URL}Logout')"></div>
                        <div id="header_button_help" onclick="showHelp()"></div>
                        <div id="header_button_account" onclick="do_redirect('{$URL}Settings/Newsletter')"></div>
                    </div>

                    <div id="header_main">
                        <div id="header_hangar_slots">
                            {foreach from=[] item=h name=hangars}
                            {$activated = ""}
                            {$href = "`$URL`Internal/Dock/changeHangar/`$h->id`"} <!-- tfw smarty can't concatenate strings the dot way -->

                            {if $account->hangars_id == $h->id}
                                {$activated = "current_slot"}
                                {$href = "`$URL`Internal/Dock"}
                            {/if}

                            <a showHangarInfo="{$h->id}" class="header_hangar_slot {$activated}" href="{$href}">
                                {$smarty.foreach.hangars.iteration}
                            </a>
                            {/foreach}
                            <div id="header_hangar_arrow"></div>
                        </div>

                        <div id="hangar_slot_current"></div>
                        <div id="hangar_slot_arrow"></div>

                        <div id="header_main_left">
                            <a class="header_std_btn header_lft_std" id="hangar_btn" href="{$URL}Internal/Dock">
                                <img src="http://darkorbit-22.ah.bpcdn.net/do_img/global/text_tf.esg?l={$locale->code}&s=8&t=header_hangar&f=eurostyle_tbla&color=lightestBlue&bgcolor=blue" alt="" />
                            </a>

                            <a class="header_std_btn header_lft_std" id="clan_btn" href="{$URL}Internal/NewClan">
                                <img src="http://darkorbit-22.ah.bpcdn.net/do_img/global/text_tf.esg?l={$locale->code}&s=8&t=header_clan&f=eurostyle_tbla&color=lightestBlue&bgcolor=blue" alt="" />
                            </a>
                            <a class="header_std_btn header_lft_std" id="upgrades_btn" href="{$URL}Internal/ItemUpgradeSystem">
                                <img src="http://darkorbit-22.ah.bpcdn.net/do_img/global/text_tf.esg?l={$locale->code}&s=8&t=header_upgrades&f=eurostyle_tbla&color=lightestBlue&bgcolor=blue" alt="" />
                            </a>

                            <a class="header_std_btn header_lft_email" id="mail_btn" href="{$URL}Internal/Evoucher">
                                <img src="http://darkorbit-22.ah.bpcdn.net/do_img/global/text_tf.esg?l={$locale->code}&s=8&t=nav_sub1_evoucher_voucher_long&f=eurostyle_tbla&color=lightestBlue&bgcolor=blue" />
                            </a>

                            <a class="header_big_btn header_lft_big" id="profile_btn" href="{$URL}Internal/PilotSheet">
                                <img src="http://darkorbit-22.ah.bpcdn.net/do_img/global/text_tf.esg?l={$locale->code}&s=8&t=header_pilotsheet&f=eurostyle_tbla&color=lightestBlue&bgcolor=blue&h=21" />
                            </a>
                        </div>

                        <div id="header_main_middle">
                            <div id="ip_placeholder"></div>

                            <div id="header_start_btn">
                                <img src="http://darkorbit-22.ah.bpcdn.net/do_img/global/text_tf.esg?l={$locale->code}&s=16&t=header_start&f=eurostyle_tbla&color=white&bgcolor=green&h=18" />
                            </div>
                        </div>

                        <div id="header_main_right">
                            <a class="header_std_btn header_rgt_std" id="shop_btn" href="{$URL}Internal/Shop/Ships" alt="">
                                <img src="http://darkorbit-22.ah.bpcdn.net/do_img/global/header/buttons/event_icon.png" width="21" height="21" id="header_event_icon" />
                                <img src="http://darkorbit-22.ah.bpcdn.net/do_img/global/text_tf.esg?l={$locale->code}&s=8&t=header_shop&f=eurostyle_tbla&color=lightestBlue&bgcolor=blue" alt="" />
                            </a>

                            <a class="header_std_btn header_rgt_std" id="trade_btn" href="{$URL}Internal/Auction">
                                <img src="http://darkorbit-22.ah.bpcdn.net/do_img/global/text_tf.esg?l={$locale->code}&s=8&t=header_auction&f=eurostyle_tbla&color=lightestBlue&bgcolor=blue" />
                            </a>
                            <a class="header_std_btn header_rgt_std" id="uri_btn" href="{$URL}Internal/Payment">
                                <img src="http://darkorbit-22.ah.bpcdn.net/do_img/global/text_tf.esg?l={$locale->code}&s=8&t=header_payment&f=eurostyle_tbla&color=lightestBlue&bgcolor=blue" />
                            </a>

                            <a class="header_std_btn header_rgt_std" id="lab_btn" href="{$URL}Internal/Skylab">
                                <img src="http://darkorbit-22.ah.bpcdn.net/do_img/global/text_tf.esg?l={$locale->code}&s=8&t=header_skylab&f=eurostyle_tbla&color=lightestBlue&bgcolor=blue" />
                            </a>
                            <a class="header_big_btn header_rgt_big" id="gg_btn" href="{$URL}Internal/GalaxyGates">
                                <img src="http://darkorbit-22.ah.bpcdn.net/do_img/global/text_tf.esg?l={$locale->code}&s=8&t=header_galaxygates&f=eurostyle_tbla&color=lightestBlue&bgcolor=blue&h=21" />
                            </a>

                            <div id="header_my_jackpot">
                                <img src="{$URL}do_img/global/header/buttons/jackpot_display_left.png" width="20" height="15" />
                                <div>{$account->jackpot} EUR</div>
                                <img src="{$URL}do_img/global/header/buttons/jackpot_display_right.png" width="20" height="15" />
                            </div>
                        </div>


                        <a id="header_new_mail" href="{$URL}Internal/Messaging">
                            ({$translationVars["UNREAD_MESSAGES_COUNT"]})
                        </a>

                        <div id="header_emailInvite" class="header_emailInvite header_emailInvite_normal" onclick="SLAYER.renderInviteDialog();">
                            <div id="header_emailInvite_glow"></div>
                        </div>
                    </div>
                    <div id="header_bottom">
                        <img id="news_overlay_left" src="{$URL}do_img/global/header/buttons/newsticker_gradient_left.png" width="123" height="26" />
                        <img id="news_overlay_right" src="{$URL}do_img/global/header/buttons/newsticker_gradient_right.png" width="123" height="26" />
                        <div id="header_news_wrapper">
                            <ul id="header_news_ticker">
                                {foreach from=$news item=n}
                                <li id="header_news_item_{$n->id}" onclick="HeaderFunc.showNews('{$n->id}')">
                                    {t($n->title)}
                                </li>
                                {/foreach}
                            </ul>
                        </div>
                        <div id="header_credits" class="header_money">
                            {$account->credits}
                        </div>
                        <a id="header_uri" class="header_money" href="{$URL}Internal/Payment" onclick="openExternal('{$URL}Payment');">
                            {$account->uridium}
                        </a>
                    </div>
                </div>

                <script type='text/javascript'>
                    function onFailFlashembed() {
                        var inner_html =
                            '<div class="flashFailHead">{t("Get the Adobe Flash Player")}</div>\n\
                            <div class="flashFailHeadText">{t("In order to play %SERVER_NAME%, you need the latest version of Flash Player. Just install it to start playing!", $translationVars)}\n\
                            <div class="flashFailHeadLink" style="cursor: pointer">{t("Download the Flash Player here for free:")} <a href=\"http://www.adobe.com/go/getflashplayer\" style=\"text-decoration: underline; color:#A0A0A0;\">{t("Download Flash Player")}<\/a></div></div>';

                        if (!document.getElementById('flashHeader')) {
                            document.getElementById('header_container').innerHTML = inner_html;
                            document.getElementById('equipment_container').innerHTML = "";
                            document.getElementById('materialiser').innerHTML = "";
                        }

                        if (document.getElementById('inventory')) {
                            document.getElementById('equipment_container').innerHTML = inner_html;
                        }

                        if (document.getElementById('flashGG')) {
                            document.getElementById('materialiser').innerHTML = inner_html;

                            jQuery('#materialiser').css('margin-left', 110);
                            jQuery('#materialiser').css('margin-top', 40);
                        }
                    }

                    function expressInstallCallback(info) {
                        // possible values for info: loadTimeOut|Cancelled|Failed
                        onFailFlashembed();
                    }


                    jQuery(document).ready(function() {
                        jQuery(".header_hangar_slot").mouseover(function() {
                            jQuery("#hangarInfoLayer").show();

                        });

                        jQuery(".header_hangar_slot").mouseout(function() {
                            jQuery("#hangarInfoLayer").hide();
                        });

                        /**
                         * Apply jScrollpane to history log table
                         * if the element is available.
                         */
                        var tableHistory = jQuery('#table_history'),
                            isTableHistoryPresent = 0 < tableHistory.length,
                            historyContainer;

                        if (isTableHistoryPresent) {
                            historyContainer = tableHistory.find('#text_history');
                            historyContainer.jScrollPane({
                                showArrows: true
                            });
                        };

                        // Initial parameter for SLAYER
                        var parameter = {
                            // BASIC SETTINGS
                            gameId: 22,
                            gameTitle: '{$server->name}',
                            dispatcherUrl: '/socialAPI/mailInvite.php', // The path where you call the dispatcher

                            instanceId: '22',
                            affiliateId: '0',
                            userId: '{$account->id}', // globalID
                            userKeyId: '{$account->id}', // userID (of your game)

                            invite: {
                                currentUsername: '{$account->name}', // After initiating the invite dialog, this functions gets called with information wether it was successful or not
                                hideButton: true, // Default: True \| Wether to show an invite dialog button or not (Set to false if You want to call the dialog directly)
                                /*onComplete       : inviteIncentives.mailInviteCallback(),*/ // This function gets called after the user closes the Invite Dialog
                                editableUsername: true,
                                showTooltip: true,
                                /*onReady          : inviteIncentives.mailInviteCallback(),     */ // After initiating the invite dialog, this functions gets called with information wether it was successful or not*/
                                inviteUrl: '{$URL}', // Define Your invite url

                                // Tabs
                                defaultTab: 'Mail', // Defines which tab is shown initially. Can be: 'Mail' (default if facebookTab is false), 'Facebook' (default if facebookTab is true) or 'Buddy'
                                facebookTab: true, // Defines wether to show the Facebook tab or not
                                buddyList: false, // Defines wether to show the Buddylist and Friendsearch or not
                                friendSearch: {
                                    enable: false, // Default: False
                                    url: '/socialAPI/friendSearch.php' // Url to Your search engine
                                }
                            },

                            // GAME EVENT SERVICE
                            events: {} // You just need to place this empty object inside the initParameter to tell SLAYER it should initiate the GES
                        }

                        SLAYER.init(parameter);
                    });
                </script>
                <div class="bodyContainer">
                    {if $hasFrames}
                    <div class="frameTop"></div>
                    <div class="frameLeft_top"></div>
                    <div class="frameRight_top"></div>
                    <div class="contentFrame">
                        <div class="realContainer">
                    {/if}
                    {$module nofilter}
                    {if $hasFrames}
                        </div>
                    </div>
                    {/if}

                    <div class="footerContainer">
                        {if $hasFrames}
                        <div class="frameLeft_bottom"></div>
                        <div class="frameRight_bottom"></div>
                        <div class="frameBottom"></div>
                        {/if}

                        <div id="teamCreditsBox" style="height:600px;" class="fliesstext">
                            <div id="teamCredits_close">
                                <a href="javascript:void(0);" onclick="closeInfo('teamCreditsBox');"><img src="{$URL}do_img/global/intro/but_close.png" alt="" /></a>
                            </div>
                            <div id="container_teamcredits" style="height: 528px;">
                                <div id="teamCredits_text">

                                    <ul id="main">
                                        <li style="height: 1px;"></li>
                                        <li id="head"></li>
                                        <li id="description">{$server->description}</li>
                                        <li id="dev">
                                            <ul>
                                                <li id="dev title">{t("Development")}</li>
                                                <li>
                                                    <ul id="table1">
                                                        <li id="table1_col1">
                                                            <ul id="dev1">
                                                                <li><a href="https://github.com/manulaiko/" target="_blank">Manulaiko</a></li>
                                                            </ul>
                                                        </li>
                                                        <li id="table1_col2">
                                                            <ul id="dev2">
                                                            </ul>
                                                        </li>
                                                        <li id="table1_col3">
                                                            <ul id="dev3">
                                                                <li><a href="https://github.com/BabaElmo/" target="_blank">BabaElmo</a></li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </li>

                                        <li id="thanks">
                                            <ul>
                                                <li id="thanks title">{t("Special thanks to")}</li>
                                                <li>
                                                    <ul id="table2">
                                                        <li id="table2_col1">
                                                            <ul id="thanks1">
                                                                <li><a href="https://elitepvpers.com/" target="_blank">ElitePVPers</a></li>
                                                            </ul>
                                                        </li>
                                                        <li id="table2_col2">
                                                            <ul id="thanks2">
                                                                <li><a href="https://bigpoint.net/" target="_blank">BugPoint</a></li>
                                                            </ul>
                                                        </li>
                                                        <li id="table3_col3">
                                                            <ul id="thanks3">
                                                                <li><a href="https://github.com/BorjaSanchidrian" target="_blank">Yuu-chan</a></li>
                                                            </ul>
                                                        </li>
                                                        <br class="clearMe" />
                                                    </ul>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                                <!--text -->
                            </div>
                            <!-- container -->
                        </div>

                        <script type="text/javascript" id="sourcecode">
                            jQuery(function() {
                                jQuery('#teamCredits_text').jScrollPane({
                                    autoReinitialise: true,
                                    showArrows: true
                                });
                            });
                        </script>

                        <div id="imprint_ingame" class="fliesstext">
                            <a href="{$URL}Legal" target="_blank">{t("Legal information")}</a> |
                            <a href="javascript:void(0);" onclick="showFooterLayer('teamCreditsBox')">{t("Credits")}</a> |
                            <a href="{$URL}Forum" target="_blank">{t("Forum")}</a>
                        </div>

                        <div class="socialBar">
                            {foreach from=$server->social key=k item=i}
                            <a href="{$i}" target="_blank">
                                <div class="{$k}"></div>
                            </a>
                            {/foreach}

                            <div class="left"></div>
                            <div class="content">
                                <div>{t("FOLLOW US ON")}</div>
                            </div>
                            <div class="right"></div>
                        </div>

                    </div>
                    <!-- End footerContainer -->
                </div>
                <!-- End bodyContainer -->
            </div>
            <!-- End outerContainer -->
        </div>
        <!-- End overallContainer -->
    </div>

    <script type="text/javascript">
        if (jQuery('#toolbar').length > 0) {
            jQuery('#toolbar').css('float', 'none');
            jQuery('body').css('background-position', 'center 30px');
        }
    </script>
    <!-- LayertoolService JavaScript Injection start -->
    <script type="text/javascript">
        //<![CDATA[
        // add fancybox css to the head
        var cssLink = document.createElement('link');
        cssLink.type = 'text/css';
        cssLink.rel = 'stylesheet';
        cssLink.href = '{$URL}application/fancybox/jquery.fancybox-1.3.4.css';
        document.getElementsByTagName('head')[0].appendChild(cssLink);
        //]]>
    </script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
    <script type="text/javascript" src="{$URL}application/fancybox/jquery.fancybox-1.3.4.js"></script>
    <script type="text/javascript" src="{$URL}application/client/client.js"></script>
    <script type="text/javascript" src="{$URL}application/cookie/jquery.cookie.js"></script>
    <script type="text/javascript">
        var jQueryLts = jQuery.noConflict(true);
    </script>
    <script type="text/javascript">
        //<![CDATA[
        jQueryLts('document').ready(function() {
            try {
                var serviceLinks = ['{$URL}Payment/Service'];
                var paymentURL = '{$URL}Payment';
                BPLayertool2.Helper.setPaymentLink(paymentURL);
                BPLayertool2.Helper.setUserId();
                BPLayertool2.Helper.setRequestTime(1483436667);
                BPLayertool2.Helper.setServices(serviceLinks);
                BPLayertool2.JSONPRequest.setRequestURL(serviceLinks[0]);
                BPLayertool2.JSONPRequest.doRequest(BPLayertool2.LayerView.prepareView);
            } catch (Exception) {
                if (true === Boolean(console.log)) {
                    console.log(Exception);
                } else {
                    throw Exception;
                };
            }
        });
        //]]>
    </script>
    <!-- LayertoolService JavaScript Injection end -->
</body>
</html>
