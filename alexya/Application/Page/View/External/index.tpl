<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:og="http://opengraphprotocol.org/schema/" xmlns:fb="http://www.facebook.com/2008/fbml">
<head>
    <title>{$server->title}</title>

    <meta name="description" content="{$server->description}" />
    <meta http-equiv="X-UA-Compatible" content="IE=9" />

    <meta name="keywords" content="{implode($server->tags, ", ")}" />
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
    <meta property="fb:app_id" content="364160817714" />
    <meta property="og:description" content="{t($server->description)}" />
    <meta property="og:locale" content="{$locale->code}" />
    {foreach from=$server->locales item=$l}
    <meta property="og:locale:alternate" content="{$l->code}" />
    {/foreach}

    <link rel="SHORTCUT ICON" href="{$URL}favicon.ico" type="image/x-icon">

    <link href="{$URL}bgc/css/bgc-0.10.10.min.css?0001" rel="stylesheet" type="text/css" media="screen" />
    <script type="text/javascript" src="{$URL}ajax/libs/jquery/1.8.3/jquery.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="{$URL}bgc/js/bgc-0.10.10.min.js?0001" charset="UTF-8"></script>
    <script type="text/javascript" src="{$URL}api/js/recaptcha_ajax.js" charset="UTF-8"></script>

    <link rel="stylesheet" media="all" href="{$URL}css/cdn/bgc.css" />
    <link rel="stylesheet" media="all" href="{$URL}css/cdn/externalHomeNew.css" />
    <link rel="stylesheet" media="all" href="{$URL}css/cdn/jQuery/colorbox-1.3.15.css" />
    <script type="text/javascript" src="{$URL}js/jQuery/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="{$URL}js/jQuery/colorbox-1.3.15.js"></script>
    <script type="text/javascript" src="{$URL}sharedpages/static/plugin/social/slayer/js/v1/slayer-min.js"></script>
    <script language="javascript">
        var CDN = "{$URL}";
    </script>

    <script type="text/javascript" src="{$URL}js/externalHomeNew.js"></script>
    <style>
        .bgc_signup_container_form input.bgc_signup_form_register
        {
            background: url("{$URL}do_img/{$locale->code}/externalDefault/cta.png") no-repeat;
        }
    </style>
</head>

<body>
    <script>
        function checkMyCookies()
        {
            var cookieLeMess = '{t("Please activate cookies for your browser.")}';
            var cookieEnabled = (navigator.cookieEnabled) ? '' : cookieLeMess;

            //if not IE4+ nor NS6+
            if(typeof navigator.cookieEnabled == "undefined" && !cookieEnabled) {
                cookieEnabled = (document.cookie.indexOf("testcookie") != -1) ? '' : cookieLeMess;
            }

            return cookieEnabled;
        }
    </script>
    <noscript><div id="noScript">{t("Please activate Java Script for your browser.")}</div></noscript>
    <script type="text/javascript">
        var cookieMessage = checkMyCookies();
        if("" != cookieMessage) {
            document.write('<div id="noCookie">' + cookieMessage + '</div>');
        }
    </script>
    <div id="busy_layer"></div>

    <script type="text/javascript">
        /* open ID */
        function showOpenId()
        {
            jQuery('#loginForm_openId_container').show();
        }

        function hideOpenId()
        {
            jQuery('#loginForm_openId_container').hide();
        }
    </script>
    <style>
        /* smarty fix for lang placeholder */
        .signup_submit
        {
            background: url("{$URL}do_img/{$locale->code}/externalDefault/cta.png") center center no-repeat;
        }

        .bgcdw_login_form_buttons .bgcdw_login_form_login
        {
            background: url("{$URL}do_img/{$locale->code}/externalDefault/button_login.png") center center no-repeat;
        }

        #loginForm_openId_container #loginForm_openId_loginButton
        {
            background: url("{$URL}do_img/{$locale->code}/externalDefault/button_login.png") no-repeat scroll center center transparent;
        }
    </style>
    <input type="hidden" id="tucReplacementTxt" value="{t("The game is subject to the following:")}" />

    <div id="eh_main_wrapper">
        <div id="eh_head_wrapper">
            <div id="eh_head_info">
                <div id="eh_lang_selection_wrapper" class="fontStyle">
                    <div id="selectedLanguageBox" onclick="jQuery('#languageBox').slideToggle(300);">
                        <img src="{$URL}do_img/global/flaggen/plain/{$locale->code}.png" alt="{$locale->name}" id="currentLanguageFlag" />
                        <div id="currentLanguageText">{$locale->name}</div>
                        <div id="languageArrow"></div>
                    </div>

                    <div id="languageBox" style="display: none">
                        {foreach from=$server->locales item=$l}
                        <div class="languageList" onclick="location.href = '{$URL}External/lang/{$l->code}';">
                            <div class="languageFlag" style="background-image: url({$URL}do_img/global/flaggen/plain/{$l->code}.png);"></div>
                            <div class="languageName">{$l->name}</div>
                        </div>
                        {/foreach}
                    </div>
                </div>
                <div id="eh_reg_display" class="fontStyle">
                    {$vars = []}
                    {$vars["REGISTERED"] = $server->registeredUsers}
                    {t("Registered: %REGISTERED%", $vars)}
                </div>
            </div>
            <div style="clear: both;"></div>

            <div id="do_cobrand_container">
                <img id="PartnerCobrandLogo" src="{$URL}published/cobrands/0_22_2.png" />
            </div>
        </div>

        <div id="eh_top_overlay">
            <div id="eh_top_wrapper">
                <div id="eh_login_container">
                    <input type="hidden" id="autoFocus" value="loginForm" />
                    <!-- contains login -->
                    <div class="bgcdw_login_container bgc">
                        <div class="bgcdw_login_container_form">
                            <form name="bgcdw_login_form" method="post" class="bgcdw_login_form" action="/External">
                                <input type="hidden" name="action" value="login" / />
                                <div class="bgc_error_translations" style="display:none">
                                    <div data-error-key="gl.error.username_1">{t("This username is too short. Please choose a new username which has between 4 and 20 characters.")}</div>
                                    <div data-error-key="gl.error.username_2">{t("This username is too long. Please choose a new username which has between 4 and 20 characters.")}</div>
                                    <div data-error-key="gl.error.username_6">{t("Please enter your username.")}</div>
                                    <div data-error-key="gl.error.password_1">{t("The password is too short. Please choose a new password which has between 4 and 45 characters.")}</div>
                                    <div data-error-key="gl.error.password_2">{t("The password is too long. Please choose a new password which has between 4 and 45 characters.")}</div>
                                    <div data-error-key="gl.error.password_8">{t("Please enter your password.")}</div>
                                    <div data-error-key="gl.error.email_1">{t("Your e-mail address doesn't seem to be correct. Please enter a valid e-mail address.")}</div>
                                    <div data-error-key="gl.error.checkbox_tick">{t("Please tick the checkbox.")}</div>
                                </div>
                                <fieldset class="bgcdw_login_form_login">
                                    <div class="bgcdw_input_text bgcdw_login_form_username">
                                        <label for="bgcdw_login_form_username">{t("Username")}</label>
                                        <input id="bgcdw_login_form_username" name="username" type="text" maxlength="20">
                                    </div>
                                    <div class="bgcdw_input_password bgcdw_login_form_password">
                                        <label for="bgcdw_login_form_password">{t("Password")}</label>
                                        <input id="bgcdw_login_form_password" name="password" type="password" maxlength="45">
                                    </div>
                                </fieldset>
                                <div class="bgcdw_login_container_remindpassword">
                                    <a class="bgcdw_remindpassword" target="_self" href="{$URL}PasswordReminder">{t("Forgot your password?")}</a>
                                </div>
                                <fieldset class="bgcdw_login_form_buttons">
                                    <input class="bgcdw_button bgcdw_login_form_login" type="submit" value="{t("Login")}">
                                    <input class="bgcdw_button bgcdw_login_form_register" type="button" onclick="window.location='/';return false;" value="{t("Register")}">
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>

                <div id="eh_reg_container">
                    <br />
                    <img id="do_registration_container_titel" src="{$URL}do_img/{$locale->code}/externalDefault/txt_form.png" alt="Regform title" />
                    <img id="do_registration_container_splitter" src="{$URL}do_img/global/externalHome/assets/blue_splitter.png" />

                    <div id="bgc_signup_short_container" class="bgc_signup_container bgc">
                        <div class="bgc_signup_container_form">
                            <form method="post" name="bgc_signup_form" class="bgc_signup_form" autocomplete="off" action="/External">
                                <div class="bgc_error_translations" style="display:none">
                                    <div data-error-key="gl.error.username_1">{t("This username is too short. Please choose a new username which has between 4 and 20 characters.")}</div>
                                    <div data-error-key="gl.error.username_2">{t("This username is too long. Please choose a new username which has between 4 and 20 characters.")}</div>
                                    <div data-error-key="gl.error.username_3">{t("This username contains invalid characters. Please do not use any spaces or special characters, for example, @.")}</div>
                                    <div data-error-key="gl.error.password_1">{t("The password is too short. Please choose a new password which has between 4 and 45 characters.")}</div>
                                    <div data-error-key="gl.error.password_2">{t("The password is too long. Please choose a new password which has between 4 and 45 characters.")}</div>
                                    <div data-error-key="gl.error.password_3">{t("The password you entered contains invalid characters.")}</div>
                                    <div data-error-key="gl.error.password_6">{t("The passwords you entered do not match.")}</div>
                                    <div data-error-key="gl.error.password_7">{t("Your password must be different than your username.")}</div>
                                    <div data-error-key="gl.error.login_1">{t("No account with this combination of username and password was found.")}</div>
                                    <div data-error-key="gl.error.email_1">{t("Your e-mail address doesn't seem to be correct. Please enter a valid e-mail address.")}</div>
                                    <div data-error-key="gl.error.captcha_1">{t("That didn't work. Please enter the characters from the image.")}</div>
                                </div>
                                <input type="hidden" name="action" value="register" / />
                                <fieldset class="bgc_signup_form_signup">
                                    <div class="bgc_input_text bgc_signup_form_username">
                                        <label for="bgc_signup_form_username">{t("Username")}</label>
                                        <input maxlength="20" minlength="4" id="bgc_signup_form_username" name="username" type="text">
                                    </div>
                                    <div class="bgc_input_password bgc_signup_form_password">
                                        <label for="bgc_signup_form_password">{t("Password")}</label>
                                        <input maxlength="45" minlength="4" id="bgc_signup_form_password" name="password" type="password">
                                    </div>
                                    <div class="bgc_input_email bgc_signup_form_email">
                                        <label for="bgc_signup_form_email">{t("E-mail")}</label>
                                        <input maxlength="260" id="bgc_signup_form_email" name="email" type="email">
                                    </div>
                                </fieldset>

                                <fieldset class="bgc_signup_form_legal">
                                    <div class="bgc_signup_form_policies">
                                        <span>{t("The game is subject to the following:")}</span><br><a class="link_tac" target="_blank" href="{$URL}terms-and-conditions/en">{t("Terms & Conditions")}</a>
                                        <a class="link_dataPrivacy" target="_blank" href="{$URL}privacy-policy/en">{t("Data Privacy Policy")}</a>

                                    </div>
                                </fieldset>
                                <fieldset class="bgc_signup_form_buttons">
                                    <input class="bgc_button bgc_signup_form_back" type="button" onclick="window.location='/';return false;" value="{t("Back")}">
                                    <input class="bgc_button bgc_signup_form_register" type="submit" value="{t("Register")}">
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>

                <div id="eh_trailer_container">
                    <div id="eh_trailer">
                        <object width="475" height="297" id="_5634699166" name="_5634699166" data="{$URL}do_img/global/externalHome/assets/trailer.swf" type="application/x-shockwave-flash" style="display: block; margin: 0 auto;">
                        <param name="allowfullscreen" value="true">
                        <param name="allowscriptaccess" value="always">
                        <param name="quality" value="high">
                        <param name="wmode" value="transparent">
                        <param name="flashVars" value="ordner={$URL}do_img/global/externalHome/assets/trailer_do_3d.flv">
                    </object>
                    </div>
                </div>

                <div id="eh_screenshot_container_left">
                    <a class="eh_screen_trigger" href="{$URL}do_img/global/externalHome/assets/screenshots/screen_1.jpg" rel="screenshots"></a>
                    <a class="eh_screen_trigger" href="{$URL}do_img/global/externalHome/assets/screenshots/screen_2.jpg" rel="screenshots"></a>
                </div>
                <div id="eh_screenshot_container_right">
                    <a class="eh_screen_trigger" href="{$URL}do_img/global/externalHome/assets/screenshots/screen_3.jpg" rel="screenshots"></a>
                    <a class="eh_screen_trigger" href="{$URL}do_img/global/externalHome/assets/screenshots/screen_4.jpg" rel="screenshots"></a>
                </div>
            </div>
        </div>

        <div id="eh_bg_v3" class="eh_company_bg"></div>

        <div id="footerContainer">
            <div id="eh_description_txt">
                {t("<h1>DarkOrbit – Join the intergalactic struggle for control of the galaxy<h1>
                <h2>Engage the thrusters and prepare for battle in the free space MMO. Team up with millions of space pilots for a bitter fight to the end<h2>Listen up space pilot! The vast expanse of DarkOrbit awaits! Choose your spacecraft and make for your battle station poste-haste to lend a fighting hand to the efforts of mankind and vanquish the alien vermin threatening the existence of man. Take up the fight as you range the galaxy at the helm of your very own space ship. Sign up today in DarkOrbit, become a space pilot, place your allegiances in one of three factions, while joining forces with fellow pilots or forming clans in an effort to round up valuable resources and lead your faction to victory, while dispatching scores of galactic garbage in the free-to-play space game for your computer’s browser!

                <h3>Whatever the Company you keep, it’s yours in the Galaxy<h3>
However, evil aliens are not the only danger lurking about in Bigpoint’s action-packed space MMO! Begin your journey through space in DarkOrbit by selecting one of three rival factions - each replete with their own philosophy of achieving victory in this interstellar fight. Use force, might and aggression in the Mars Mining Organization to emerge victorious, achieve your goals with monetary might in the Earth Industries Corporation or wield cunning and grace to defeat your enemies in the Venus Resources Unlimited. No matter your decision, your mission remains the same: compile valuable resources and turn the tide of the galactic struggle to claim victory in this shooter full of fulminant space action.

                <h3>Command the Ship of your Choice<h3>
Faction affiliations notwithstanding, Bigpoint’s smash space browser game gives you a plethora of unique options of putting your own personal touch on your individual struggle throughout space. DarkOrbit puts you in command – find your spacecraft from a host of specialized ships: from ships specialized in laying quick waste to enemy hordes and swift space ships fleet of foot designed to gather invaluable intel to bulky contraptions of high-tech brawn that lay down vital cover to your allies, while meting out heavy damage to targets.

                <h3>Join the Epitome of an Online Community<h3>
What truly makes DarkOrbit unique, setting it apart from the competition is one thing: You! While other browser games claim to be multiplayer, they simply cannot hold a flame to DarkOrbit’s massive community: over 80 million active players blast off each and every day. Thanks to You and yours, DarkOrbit is the premiere cult online space games. Join the skirmish today alongside millions of space pilots or stand against floes of imposing enemies determined to see out your destruction. Arm your weapons and remain ready – with danger lurking at every turn, a moment’s hesitation can be the difference between success or failure.

                <h3>Fight with Friends, or Against<h3>
Roam the myriad of galaxies of one of the all-time favorite space shooters. Fraught with danger at seemingly every turn, players must be on their guard and remain alert while scouring for resources, discovering new maps or completing a host of new missions. Form a clan with your friends and respected fellow pilots to boost your chances of victory and survival against hordes of imposing intergalactic beasts, or take on the most intimidating missions as you and your crew attempt to level up at the speed of light.")}
        </div>

        <div id="eh_footer">
        <!--gl footer-->
            <div id="gl_footer">
                <span id="gl_footer_element_copyright" class="gl_footer_element">&copy; {$server->company}</span>

                <span class="gl_footer_element_separator">&nbsp;·&nbsp;</span>
                <span id="gl_footer_element_allrights" class="gl_footer_element">{t("All rights reserved")}</span>

                <span class="gl_footer_element_separator">&nbsp;·&nbsp;</span>
                <span id="gl_footer_element_terms" class="gl_footer_element"><a class="gl_footer_element_link" id="gl_footer_element_link_terms" href="{$URL}terms-and-conditions/{$locale->code}" target="_blank">{t("Terms & Conditions")}</a></span>

                <span class="gl_footer_element_separator">&nbsp;·&nbsp;</span>
                <span id="gl_footer_element_logo" class="gl_footer_element"><a class="gl_footer_element_link" id="gl_footer_element_link_logo" href="http://en.bigpoint.com/" target="_blank"><img class="gl_footer_element_image" id="gl_footer_element_image_logo" src="{$URL}shared/img/footer/bigpoint_logo_h_web_rgb_neg_com_full.MINI.png" alt=""/></a></span>

                <span class="gl_footer_element_separator">&nbsp;·&nbsp;</span>
                <span id="gl_footer_element_privacy" class="gl_footer_element"><a class="gl_footer_element_link" id="gl_footer_element_link_privacy" href="{$URL}privacy-policy/{$locale->code}" target="_blank">{t("Data Privacy Policy")}</a></span>

                <span class="gl_footer_element_separator">&nbsp;·&nbsp;</span>
                <span id="gl_footer_element_imprint" class="gl_footer_element"><a class="gl_footer_element_link" id="gl_footer_element_link_imprint" href="{$URL}imprint/{$locale->code}" target="_blank">{t("Legal information")}</a></span>

                <span class="gl_footer_element_separator">&nbsp;·&nbsp;</span>
                <span id="gl_footer_element_support" class="gl_footer_element"><a class="gl_footer_element_link" id="gl_footer_element_link_support" href="{$URL}Support" target="_blank">{t("Support")}</a></span>

                <span class="gl_footer_element_separator">&nbsp;·&nbsp;</span>
                <span id="gl_footer_element_forum" class="gl_footer_element"><a class="gl_footer_element_link" id="gl_footer_element_link_forum" href="{$URL}Forum" target="_blank">{t("Forum")}</a></span>
            </div>
        </div>
    </div>
</div>
    </body>
</html>
