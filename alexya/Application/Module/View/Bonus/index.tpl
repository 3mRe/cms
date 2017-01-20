<style type="text/css">
    .tabLabel1Active {
        background-image: url({$URL}do_img/global/text_tf.esg?l={$locale->code}&s=10&t=pilot_invite_incentive_page_invite&f=eurostyle_thea&color=black&bgcolor=grey1);
        background-repeat: no-repeat;
        background-position: center;
    }

    .tabLabel1InActive {
        background-image: url({$URL}do_img/global/text_tf.esg?l={$locale->code}&s=10&t=pilot_invite_incentive_page_invite&f=eurostyle_thea&color=white&bgcolor=grey);
        background-repeat: no-repeat;
        background-position: center;
    }

    .tabLabel2Active {
        background-image: url({$URL}do_img/global/text_tf.esg?l={$locale->code}&s=10&t=pilot_invite_incentive_page_login_bonus&f=eurostyle_thea&color=black&bgcolor=grey1);
        background-repeat: no-repeat;
        background-position: center;
    }

    .tabLabel2InActive {
        background-image: url({$URL}do_img/global/text_tf.esg?l={$locale->code}&s=10&t=pilot_invite_incentive_page_login_bonus&f=eurostyle_thea&color=white&bgcolor=grey);
        background-repeat: no-repeat;
        background-position: center;
    }

    .scroll-pane {
        height: 214px;
        overflow: auto;
        position: relative;
    }
</style>

<script type="text/javascript">
    var BonusPage = {
        switchTo: function(subPage) {
            jQuery('.bonusPageContent').hide();
            jQuery('#' + subPage + 'PageContent').show();
        }
    };
</script>

<div id="bonusPage">
    <div id="bonusPageNav">
        <div id="tabButton1" class="tabButtonActive" onmouseover="buttonHandler.toggleButtons('tabButton1', 'tabButton', 'tabLabel1')" onmouseout="buttonHandler.toggleButtons('tabButton1', 'tabButton', 'tabLabel1', 'tabLabel')" onclick="buttonHandler.clickedTabButton('tabButton1', 4, 'tabButton', 'tabLabel1', 'tabLabel', 'tabLabelInvite');BonusPage.switchTo('invite')">
            <div id="tabLabel1" class="tabLabel tabLabel1Active"></div>
        </div>
        <div id="tabButton2" class="tabButtonInActive" onmouseover="buttonHandler.toggleButtons('tabButton2', 'tabButton', 'tabLabel2')" onmouseout="buttonHandler.toggleButtons('tabButton2', 'tabButton', 'tabLabel2', 'tabLabel')" onclick="buttonHandler.clickedTabButton('tabButton2', 4, 'tabButton', 'tabLabel2', 'tabLabel', 'tabLabelDailyLogin');BonusPage.switchTo('dailyLogin')">
            <div id="tabLabel2" class="tabLabel tabLabel2InActive"></div>
        </div>
    </div>
    <div id="invitePageContent" class="bonusPageContent">
        <div id="triggerInviteButton" onclick="SLAYER.renderInviteDialog();">
            {t("Invite friends")}
        </div>

        <div id="incentive2Hint" class="hintFont">{t("Your friend registered and has now reached level 10.")}</div>

        <div id="incentive3Hint" class="hintFont">{t("Collect reward")}</div>

        <div id="incentiveLeftBox" class="incentiveColumn">
            <div id="invitedTopLeft" class="subHeadline">{t("Invite info")}</div>
            <div id="invitedTopRight" class="invitedRight"></div>

            <div id="bonusInfoDiv" class="bonusInfoDiv">
                <div class="bonusInfoDivHead bonusInfoDivText">{t("Your bonus for recruiting a player who has reached level 10:")}</div>
                <ul class="bonusInfoDivList bonusInfoDivText">
                    <li class="middleRight2">{t("5 log-disks")}</li>
                    <li class="middleRight2">{t("1 CLO4K CPU")}</li>
                </ul>
            </div>

            <div id="invitedInfo" class="invitedLeft invitedLeftTop">
                <table cellpadding="0" cellspacing="0" border="0" style="width: 90%">
                    <tr>
                        <td class="inviteInfo">{t("E-mail invites sent:")}</td>
                        <td class="inviteInfoSpan">{$invites->totalSent}</td>
                    </tr>
                    <tr>
                        <td class="inviteInfo">{t("Open e-mail invites:")}</td>
                        <td class="inviteInfoSpan">{$invites->totalOpened}</td>
                    </tr>
                    <tr>
                        <td class="inviteInfo">{t("Remaining invites today:")}</td>
                        <td class="inviteInfoSpan">{$invites->availableToday}/{$invites->maxPerDay}</td>
                    </tr>
                </table>
            </div>
        </div>

        <div id="incentiveMiddleBox" class="incentiveColumn">
            <div id="middleTopLeft" class="invitedLeft subHeadline">
                {t("Accepted:")}
                <span class="middleRight2 acceptedHeadText">{$invites->accepted}</span>
            </div>
            <div id="middleTopRight" class="invitedRight"></div>

            <div id="middleRest">
                <div class="scroll-pane" style="height: 212px; width: 215px;">

                </div>
            </div>
        </div>

        <div id="incentiveRightBox" class="incentiveColumn">
            <div id="completedHead" class="invitedLeft subHeadline">
                {t("Bonuses received:")}
                <span class="middleRight2 acceptedHeadText">{$invites->receivedBonus}</span>
            </div>

            <div class="incentiveDisplay" onmouseover="showIncentiveTT('1')" onmouseout="hideIncentiveTT('1')">
                <img class="incentiveStatus" src="{$URL}do_img/global/pilotSheet/invitePage/5friends.png" width="57" />
                <img class="incentiveImage" src="{$URL}do_img/global/pilotSheet/invitePage/incentives1.png" width="200" alt="bonus 1" />
                <div class="customTooltip type_inviteIncentives loadType_normal id_incentiveTip1 inner_completedRight outer_profilePage top_30 left_300"></div>
            </div>
            <div class="incentiveDisplay" onmouseover="showIncentiveTT('2')" onmouseout="hideIncentiveTT('2')">
                <img class="incentiveStatus" src="{$URL}do_img/global/pilotSheet/invitePage/10friends.png" width="57" />
                <img class="incentiveImage" src="{$URL}do_img/global/pilotSheet/invitePage/incentives2.png" width="205" alt="bonus 2" />
            </div>
            <div class="incentiveDisplay" onmouseover="showIncentiveTT('3')" onmouseout="hideIncentiveTT('3')">
                <img class="incentiveStatus" src="{$URL}do_img/global/pilotSheet/invitePage/25friends.png" width="57" />
                <img class="incentiveImage" src="{$URL}do_img/global/pilotSheet/invitePage/incentives3.png" width="210" alt="bonus 3" />
            </div>
        </div>

        <div id="middleArrow1" class="middleArrow"></div>
        <div id="middleArrow2" class="middleArrow"></div>
    </div>
    <div id="dailyLoginPageContent" class="bonusPageContent" style="display: none;">
        <div id="dailyLoginContainer">
            <div id="introLeft">
                <div id="boniDesTitle" class="boniDesTitle">{t("Daily Login Bonus")}</div>
                <div id="boniDesText">
                    <p>{t("For every day that you continue to log into %SERVER_NAME% you will be rewarded with a login bonus.", $translationVars)}</p>
                    <p>{t("The value of this bonus will increase daily until you reach the highest bonus level. However, if you don't log in for one day, you will not receive a bonus and the bonus will begin again at the lowest level.")}</p>
                </div>
            </div>
            <div id="introRight" class="introRight">
                <div class="nextReward1 boniDesTitle">{t("Next bonus")}</div>
                {$translationVars["CURRENT_BONUS"] = $currentBonus}
                <div class="nextReward2">"{t("You got the bonus for logging in %CURRENT_BONUS days in a row!", $translationVars)}<br />{t("Log back in tomorrow to get the next one.")}"</div>
            </div>
            <div id="boniProgress"></div>
            <div id="boniBoxHead" class="boniBoxHead">
                {foreach from=$dailyBonus item=b name=headBox}
                {$i = $smarty.foreach.headBox.iteration}
                {$translationVars["I"] = $i}

                <span id="boniHead_{$i}" class="boniHead_{$i} boniHead">{t("Bonus %I%", $translationVars)}</span>
                {/foreach}
            </div>
            <div id="middleSec">
                <div id="boniBoxIcon" class="boniBoxIcon">
                    {foreach from=$dailyBonus item=b name=icon}
                    {$i = $smarty.foreach.icon.iteration}

                    <div id="boniIcon_{$i}" class="boniIcon_{$i} boniIcon"></div>
                    {/foreach}
                </div>

                <div id="boniBox" class="boniBox">
                    {foreach from=$dailyBonus item=b name=box}
                    {$i = $smarty.foreach.box.iteration}

                    <div id="boni_{$i}">
                        <div class="boni_{$i}"></div>
                    </div>
                    {/foreach}
                </div>
                <div id="boniBoxText" class="boniBoxText">
                    {foreach from=$dailyBonus item=b name=text}
                    {$i = $smarty.foreach.text.iteration}

                    <div id="boniText_{$i}" class="boniText_{$i} boniText">
                        <span>
                            {implode(array_map($b, "t"), "<br />")}
                    </div>
                    {/foreach}
                </div>
            </div>
        </div>
    </div>
    <div id="invitePopup">
        <div id="invitePopup_top"></div>
        <div id="invitePopup_middle">
            <div class="invitePopup_headline">{t("Invite your friends to %SERVER_NAME% and receive rewards", $translationVars)}</div>
            <img class="invitePopup_devider" src="{$URL}do_img/global/pilotSheet/invitePage/popup/popup_devider_yellow.png" />
            <div class="invitePopup_subHeadline">{t("Here's how it works:")}</div>
            <img src="{$URL}do_img/global/pilotSheet/invitePage/popup/popup_numbers.png" />
            <div id="invitePopup_textWrapper">
                <div id="invitePopup_number1Text" class="invitePopup_text invitePopup_numberText">
                    {t("Invite your friends to %SERVER_NAME%", $translationVars)}
                </div>
                <div id="invitePopup_number2Text" class="invitePopup_text invitePopup_numberText">
                    {t("For every friend who registers and reaches at least level 10, your Company will give you a reward.")}
                </div>
                <div id="invitePopup_number3Text" class="invitePopup_text invitePopup_numberText">
                    {t("Invite 5, 10, or even 25 friends to receive special Nostromo ships in acknowledgement of your loyalty.")}
                </div>
            </div>
            <img class="invitePopup_devider" src="{$URL}do_img/global/pilotSheet/invitePage/popup/popup_devider_blue.png" />
            <div class="invitePopup_subHeadline">{t("Your bonus for recruiting 25 friends")}</div>
            <img src="{$URL}do_img/global/pilotSheet/invitePage/popup/popup_incentives.png" style="margin-bottom: 10px;" />
            <div class="invitePopup_text">
                {t("The Nostromo Ambassador is the most powerful ship of the Nostromo class. A classic reward for a sassy pilot!<br /> Please enjoy 1 month of Premium access, two LF-4 lasers, 1 Havoc drone design, 200 extra energy, 10 Booty Keys, 10,000 RSB-75
                ammunition, 200 EMP-01 Charges, and 10 hours of Damage, Shield and Honor boosters!")}
            </div>

            <div id="invitePopup_disableWrapper" class="invitePopup_text">
                <div id="invitePopup_checkbox" class=""></div>
                {t("Do not show again")}
            </div>
        </div>
        <div id="invitePopup_bottom"></div>
        <div id="invitePopup_close"></div>
    </div>
</div>

<div id="skill_tooltip_container">
    <div id="incentiveTip1" class="skill_tooltip obstrusive" style="display: none;">
        <div class="tooltip_header"></div>
        <div class="tooltip_content skilltree_font">
            <strong class="skilltree_font_info">{t("Reward for recruiting 5 players who have reached at least level 10")}</strong>
            <div class="tooltip_seperator"></div>
            <div class="verticalSpace1 obstrusive"></div>
            {t("Nostromo Diplomat Ship")}
            <ul class="rewardList1">
                <li class="rewardList">{t("140,000 HP and 900 cargo space")}</li>
            </ul>

            <br /> {t("Items:")}
            <ul class="rewardList1">
                {foreach from=$invites->bonus->low item=$r}
                <li class="rewardList">{t($r)}</li>
                {/foreach}
                <li class="verticalSpace1"></li>
            </ul>
        </div>
        <div class="tooltip_footer skilltree_font"></div>
    </div>

    <div id="incentiveTip2" class="skill_tooltip obstrusive" style="display: none;">
        <div class="tooltip_header"></div>
        <div class="tooltip_content skilltree_font">
            <strong class="skilltree_font_info">{t("Reward for recruiting 10 players who have reached at least level 11")}</strong>
            <div class="tooltip_seperator"></div>
            <div class="verticalSpace1"></div>

            {t("Nostromo Envoy Ship")}
            <ul class="rewardList1">
                <li class="rewardList">{t("10 laser slots, 160,000 HP, and 1,000 cargo space")}</li>
            </ul>

            <br /> {t("Items:")}
            <ul class="rewardList1">
                {foreach from=$invites->bonus->mid item=$r}
                <li class="rewardList">{t($r)}</li>
                {/foreach}
                <li class="verticalSpace1"></li>
            </ul>
        </div>
        <div class="tooltip_footer skilltree_font"></div>
    </div>

    <div id="incentiveTip3" class="skill_tooltip obstrusive" style="display: none;">
        <div class="tooltip_header"></div>
        <div class="tooltip_content skilltree_font">
            <strong class="skilltree_font_info">{t("Reward for recruiting 25 players who have reached at least level 12")}</strong>
            <div class="tooltip_seperator"></div>
            <div class="verticalSpace1"></div>

            {t("Nostromo Ambassador Ship")}
            <ul class="rewardList1">
                <li class="rewardList">{t("12 laser slots, 12 generator slots, 220,000 HP, and 1,500 cargo space")}</li>
            </ul>

            <br /> {t("Items:")}
            <ul class="rewardList1">
                {foreach from=$invites->bonus->high item=$r}
                <li class="rewardList">{t($r)}</li>
                {/foreach}
                <li class="verticalSpace1"></li>
            </ul>
        </div>
        <div class="tooltip_footer skilltree_font"></div>
    </div>
</div>

<script type="text/javascript">
    showBusyLayer();
    jQuery('#invitePopup').show();

    jQuery(document).ready(function() {
        jQuery('#invitePopup_close').click(function() {
            hideBusyLayer();
            jQuery('#invitePopup').hide();
        });

        var chkBox = jQuery('#invitePopup_checkbox');
        chkBox.click(function() {
            if (chkBox.hasClass('checkbox_active')) {
                chkBox.removeClass('checkbox_active');
            } else {
                chkBox.addClass('checkbox_active');
                var formValues = new Array();
                formValues['type'] = 'hideInviteInfo';
                inviteIncentives.handleAjax(formValues);
            }
        });
    });

    var val = 3;

    jQuery(document).ready(function() {
        jQuery('#tabLabel2').click(function() {
            LoginBonus.renderProgressBar(val);
        });
        LoginBonus.renderProgressBar(val);
    })

    function showIncentiveTT(tipId) {
        jQuery('#incentiveTip' + tipId).show();
    }

    function hideIncentiveTT(tipId) {
        jQuery('#incentiveTip' + tipId).hide();
    }

    jQuery('.scroll-pane').jScrollPane({
        showArrows: true
    });
</script>
