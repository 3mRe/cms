<!DOCTYPE html>
<head>
    <title>{$server->name}| {t("MMO & space shooter")}</title>
    <link rel="SHORTCUT ICON" href="{$URL}favicon.ico" type="image/x-icon">

    <meta charset="utf-8" />

    <link rel="stylesheet" media="all" href="{$URL}css/cdn/internalCompanyChoose.css" />
    <script type="text/javascript" src="{$URL}js/jQuery/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="{$URL}js/jQuery/jquery.mousewheel.js"></script>
    <script type="text/javascript">
        jQuery.noConflict();
    </script>
    <script type="text/javascript" src="{$URL}resources/js/tools.js"></script>
    <script type="text/javascript" src="{$URL}resources/js/tools/text.js"></script>
    <script>
        var textResourcesTitle = {
            "seo_title_client": "{$server->name}",
            "seo_title_client_blinking": "{$server->name} | Game Client",
            "seo_title_no_aid": "{$server->name} | {t("MMO & space shooter")}",
            "seo_tittle_clans": "{$server->name} | {t("Clans")}",
            "seo_tittle_pet": "{$server->name} | {t("PET")}",
            "seo_tittle_ships": "{$server->name} | {t("Ships")}",
            "seo_tittle_uridium": "{$server->name} | {t("Uridium")}",
            "seo_tittle_techfactory": "{$server->name} | {t("Tech Factory")}",
            "seo_tittle_hangar": "{$server->name} | {t("Hangar")}",
            "seo_title_standard": "{$server->name} | {t("MMO & space shooter")}",
            "seo_title_achievements": "{$server->name} | {t("Achievements")}",
            "seo_title_shop": "{$server->name} | {t("Shop")}",
            "seo_title_skylab": "{$server->name} | {t("Skylab")}"
        };

        jQuery.each(textResourcesTitle, function(i, n) {
            Tools.Text.setResource(i, n)
        });
    </script>
    <script src="{$URL}resources/js/main.js" type="text/javascript"></script>
    <script language="javascript">
        Main.Initialize('1', 'dosid={$account->session_id}');
    </script>
</head>
<body>
    <!-- affiliateStartTag -->
    <!-- Login Tag (-1) -->
    <script type="text/javascript" language="javascript">
        var SemTmLoginCount = "-1";
    </script>

    <div id="companySelection">
        <input type="hidden" id="preselection" value="0" />
        <!-- header section -->
        <div id="header">
            <div id="gamelogo"></div>

            <div class="default">
                <img src="{$URL}do_img/{$locale->code}/companyChoose/Choose-your-company.png" alt="Choose-your-company" />
            </div>

            <div class="mmo">
                <img src="{$URL}do_img/{$locale->code}/companyChoose/Join-the-Colonial-Juggernaut.png" alt="Join-the-Colonial-Juggernaut" />
            </div>

            <div class="eic">
                <img src="{$URL}do_img/{$locale->code}/companyChoose/For-Glory-and-Privilege.png" alt="For-Glory-and-Privilege" />
            </div>

            <div class="vru">
                <img src="{$URL}do_img/{$locale->code}/companyChoose/Progress-Through-Knowledge.png" alt="Progress-Through-Knowledge" />
            </div>

        </div>

        <div id="speach_arrows">
            <div class="arrow mmo">
                <!--  -->
            </div>
            <div class="arrow eic">
                <!--  -->
            </div>
            <div class="arrow vru">
                <!--  -->
            </div>
        </div>

        <!-- content section -->
        <div id="content" class="templateB">

            <div class="faction_outer">
                <div class="faction_outer_border">
                    <!--  -->
                </div>

                <div class="faction_charactar faction_mmo">
                    <!--  -->
                </div>

                <div class="faction_charactar_logo faction_mmo">
                    <!--  -->
                </div>
                <div class="faction_charactar_shade">
                    <!--  -->
                </div>

                <div class="faction_outer_highlight">
                    <!--  -->
                </div>

                <div class="faction_hover faction-hover clickable" index="0">
                    <div class="confirm" id="confirm_mmo">
                        <div class="confirm_glow"></div>
                        <a href="{$URL}Internal/CompanyChoose/choose/1">
                            <img class="inactive" src="{$URL}do_img/{$locale->code}/companyChoose/Click-to-confirm.png" alt="Click-to-confirm" />
                            <img class="active" src="{$URL}do_img/{$locale->code}/companyChoose/Confirm.png" alt="Confirm" />
                        </a>
                    </div>
                </div>
            </div>

            <div class="faction_outer">
                <div class="faction_outer_border">
                    <!--  -->
                </div>

                <div class="faction_charactar faction_eic">
                    <!--  -->
                </div>

                <div class="faction_charactar_logo faction_eic">
                    <!--  -->
                </div>
                <div class="faction_charactar_shade">
                    <!--  -->
                </div>

                <div class="faction_outer_highlight">
                    <!--  -->
                </div>

                <div class="faction_hover faction-hover clickable" index="1">
                    <div class="confirm" id="confirm_eic">
                        <div class="confirm_glow"></div>
                        <a href="{$URL}Internal/CompanyChoose/choose/2">
                            <img class="inactive" src="{$URL}do_img/{$locale->code}/companyChoose/Click-to-confirm.png" alt="Click-to-confirm" />
                            <img class="active" src="{$URL}do_img/{$locale->code}/companyChoose/Confirm.png" alt="Confirm" />
                        </a>
                    </div>
                </div>
            </div>

            <div class="faction_outer">
                <div class="faction_outer_border">
                    <!--  -->
                </div>

                <div class="faction_charactar faction_vru">
                    <!--  -->
                </div>

                <div class="faction_charactar_logo faction_vru">
                    <!--  -->
                </div>
                <div class="faction_charactar_shade">
                    <!--  -->
                </div>

                <div class="faction_outer_highlight">
                    <!--  -->
                </div>

                <div class="faction_hover faction-hover clickable" index="2">
                    <div class="confirm" id="confirm_vru">
                        <div class="confirm-glow confirm_glow"></div>
                        <a href="{$URL}Internal/CompanyChoose/choose/3">
                            <img class="inactive" src="{$URL}do_img/{$locale->code}/companyChoose/Click-to-confirm.png" alt="Click-to-confirm" />
                            <img class="active" src="{$URL}do_img/{$locale->code}/companyChoose/Confirm.png" alt="Confirm" />
                        </a>
                    </div>
                </div>
            </div>

            <div class="clearfix">
                <!-- -->
            </div>

            <div id="factionDescription">
                <div class="default">
                    <img src="{$URL}do_img/{$locale->code}/companyChoose/Click-on-a-character.png" alt="Click-on-a-character" />
                </div>

                <div class="mmo">
                    <div class="headline">
                        Mars Mining Operations
                    </div>
                    <div class="devider">
                        <!--  -->
                    </div>
                    <div class="message">
                        {t("I'm not going to blow smoke up your tush, so I'll just get straight to the point. We at Mars Mining Operations want you for two reasons: to mine ore and to eradicate all alien scum infecting our galactic sector. Do this successfully and you'll soon be popping rival pilots for thrills and honor!")}</div>
                </div>

                <div class="eic">
                    <div class="headline">
                        Earth Industries Corporations
                    </div>
                    <div class="devider">
                        <!--  -->
                    </div>
                    <div class="message">
                        {t("Pilot, these are trying times during which only those made of the purest inner steel can prevail! How tough is your mettle? We reward loyalty and impeccable manners with the best lasers Uridium can buy. Join us in the fight to cleanse our sector of all those cretins that stand in our way. For glory and privilege!")}</div>
                </div>

                <div class="vru">
                    <div class="headline">
                        Venus Resources Unlimited
                    </div>
                    <div class="devider">
                        <!--  -->
                    </div>
                    <div class="message">
                        {t("We pride ourselves in our ability to push the envelope of technological advancement, while retaining a communal atmosphere. Some call us a cult desiring galactic domination, but they simply misunderstand our brilliant recruitment methods. We are always looking for talented pilots to help us destroy our enemies and shape humanity's future!")}</div>
                </div>
            </div>
        </div>
    </div>

    <!-- affiliateEndTag -->
    <script type="text/javascript" src="{$URL}js/jQuery/jquery-1.4.4.min.js"></script>

    <script type="text/javascript">
        var factions = [];
        var animateDefaultHeadline = null;

        factions.push({
            identifier: 'mmo',
            charactarBackgroundPosition: {
                normal: '-20px 0',
                zoom: '-150px -10px'
            },
            charactarBackgroundSize: {
                normal: '115%',
                zoom: '220%'
            },
            headerHeadlineBackgroundPosition: 'center top'
        });

        factions.push({
            identifier: 'eic',
            charactarBackgroundPosition: {
                normal: '-44px 0',
                zoom: '-141px 0'
            },
            charactarBackgroundSize: {
                normal: '135%',
                zoom: '220%'
            },
            headerHeadlineBackgroundPosition: 'center center'
        });

        factions.push({
            identifier: 'vru',
            charactarBackgroundPosition: {
                normal: '-20px 0',
                zoom: '-129px -19px'
            },
            charactarBackgroundSize: {
                normal: '115%',
                zoom: '220%'
            },
            headerHeadlineBackgroundPosition: 'center bottom'
        });

        var showDefaultHeadlines = function() {
            var headerDefaultHeadline = jQuery('#header .default');
            var description = jQuery('#factionDescription');
            var descriptionDefaulftHeadline = description.find('.default');
            var factionDescription = description.find('.mmo, .eic, .vru');
            var visible = false;

            // checking one of the faction description is visible if not the default headline will fade in again.
            factionDescription.each(function(index, value) {
                if (false === jQuery(value).is(':hidden')) {
                    visible = true;
                };
            });

            if (false === visible) {
                headerDefaultHeadline.fadeIn(200, 'linear', function() {
                    descriptionDefaulftHeadline.fadeIn(200);
                });
            };
        };

        /**
         * Open game client if open social is not active.
         */
        var doOpenClient = function() {
            Main.openFlashClient();

            return true;
        };

        var buttonGlowInterval;
        jQuery(document).ready(function() {
            var ieLower9 = (true === jQuery.browser.msie && 9 > jQuery.browser.version) ? true : false;

            jQuery(window).bind('resize', function(e) {
                window.resizeEvt;
                jQuery(window).resize(function() {
                    clearTimeout(window.resizeEvt);
                    window.resizeEvt = setTimeout(function() {
                        moveButtonToViewport();
                    }, 250);
                });
            });

            jQuery('.confirm').hover(function() {
                window.clearInterval(buttonGlowInterval);
            }, function() {
                buttonGlowInterval = window.setInterval("buttonGlow()", 1000);
            })

            jQuery(window).bind('scroll', function() {
                moveButtonToViewport();
            })

            // initial buttonGlow
            buttonGlowInterval = window.setInterval("buttonGlow()", 1000);
            // initial button move to viewport
            moveButtonToViewport();


            jQuery('.faction-hover').bind('mouseenter', function() {
                var element = jQuery(this);
                var parent = element.parent();
                var highlight = parent.find('.faction_outer_highlight');
                var confirm = parent.find('.confirm');
                var inactiveImage = confirm.find('.inactive');

                if (false === element.hasClass('active')) {
                    highlight.show();
                };
            });

            jQuery('.faction-hover').bind('mouseleave', function() {
                var element = jQuery(this);
                var parent = element.parent();
                var highlight = parent.find('.faction_outer_highlight');
                var confirm = parent.find('.confirm');
                var inactiveImage = confirm.find('.inactive');
                var activeImage = confirm.find('.active');

                if (false === element.hasClass('active')) {
                    highlight.hide();
                };
            });

            jQuery('.faction-hover').bind('click', function(evt) {
                evt.preventDefault();

                var element = jQuery(this);
                var parent = element.parent();
                var index = element.attr('index');
                var character = parent.find('.faction_charactar');
                var confirm = element.find('.confirm');
                var highlight = element.find('.faction_outer_highlight');
                var inactiveImage = confirm.find('.inactive');
                var activeImage = confirm.find('.active');
                var headerHeadline = jQuery('#header').find('.default');
                var headerHeadline = jQuery('#header').find('.default');
                var headerFactionHeadline = jQuery('#header').find('.' + factions[index].identifier);
                var charactarArrow = jQuery('#speach_arrows .' + factions[index].identifier);
                var description = jQuery('#factionDescription').find('.' + factions[index].identifier)
                var descriptions = jQuery('#factionDescription').find('.default, .mmo, .eic, .vru');
                var logo = parent.find('.faction_charactar_logo');

                if (false === element.hasClass('active')) {

                    jQuery('.faction-hover').find('img.active').hide();
                    jQuery('.faction-hover').find('.confirm').hide();

                    jQuery('.faction-hover.active').each(function(index, value) {
                        var element = jQuery(value);
                        var index = element.attr('index');
                        var parent = element.parent();
                        var character = parent.find('.faction_charactar');
                        var confirm = element.find('.confirm');
                        var highlight = parent.find('.faction_outer_highlight');
                        var charactarArrows = jQuery('#speach_arrows .arrow');
                        var headerHeadlines = jQuery('#header').find('.mmo, .eic, .vru');
                        var logo = parent.find('.faction_charactar_logo');

                        confirm.hide();
                        logo.show();
                        highlight.hide();
                        charactarArrows.hide();
                        headerHeadlines.hide();

                        if (false === ieLower9) {
                            character.animate({
                                    backgroundSize: factions[index].charactarBackgroundSize.normal,
                                    backgroundPosition: factions[index].charactarBackgroundPosition.normal
                                },
                                175
                            );
                        };

                        element.removeClass('active');
                    });

                    element.addClass('active');
                    if (false === ieLower9) {
                        character.animate({
                                backgroundSize: factions[index].charactarBackgroundSize.zoom,
                                backgroundPosition: factions[index].charactarBackgroundPosition.zoom
                            },
                            250
                        );
                    };

                    logo.fadeOut(75, 'linear', function() {
                        confirm.show();
                    });
                    inactiveImage.hide();
                    activeImage.show();
                    highlight.show();

                    headerHeadline.hide();
                    headerFactionHeadline.show();
                    charactarArrow.show();

                    descriptions.hide();
                    description.show();
                };
            });

            jQuery('.confirm').bind('click', function(evt) {
                evt.preventDefault();

                var element = jQuery(this);
                var href = element.find('a').attr('href');

                jQuery.ajax({
                    type: "GET",
                    url: href,
                    async: false,
                    success: function(data) {
                        data = jQuery.parseJSON(data);
                        if (data.result) {
                            //doOpenClient(href);
                            doOpenClient();
                            // timeout is needed because on using without the redirect is faster then the eventstream tracking
                            window.setTimeout('redirectAfterSuccess()', 0);
                            //redirectAfterSuccess();
                        } else {
                            // timeout is needed because on using without the redirect is faster then the eventstream tracking
                            window.setTimeout('reloadAfterError()', 0);
                        }
                    },
                    error: function() {
                        // timeout is needed because on using without the redirect is faster then the eventstream tracking
                        window.setTimeout('reloadAfterError()', 0);
                    },
                    dataType: "text"
                });
            });

            jQuery('.confirm a').bind('click', function(evt) {
                evt.preventDefault();
            });

            // preselect faction with lowest member count
            var preSelected = jQuery('#preselection').val();
            jQuery('div.faction-hover[index=' + preSelected + ']').click();

        });

        function buttonGlow() {
            jQuery('.confirm_glow').fadeIn(400).delay(400).fadeOut(400);
        }

        function moveButtonToViewport() {
            var height = jQuery(window).height() + jQuery(document).scrollTop();
            if (height < 460) {
                jQuery('.confirm').animate({
                    top: 220
                }, 0);
            } else if (height <= 660) {
                jQuery('.confirm').animate({
                    top: height - 240
                }, 0);
            } else {
                jQuery('.confirm').animate({
                    top: 415
                }, 0);
            }
        }

        function redirectAfterSuccess() {
            location.href = '{$URL}Internal/Start';
        }

        function reloadAfterError() {
            location.reload();
        }
    </script>
</body>
</html>
