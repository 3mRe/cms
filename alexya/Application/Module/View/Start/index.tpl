<script type="text/javascript">
    // server time setup
    var serverTime = '{$serverTime}';
    var serverDate = '{$serverDate}';
    var meridiem_am = 'A.M.';
    var meridiem_pm = 'P.M.';

    var tmp = serverTime.split(':');
    var tmp2 = tmp[1].split(' ');

    var hour = tmp[0];
    var minute = tmp2[0];
    var meridiem = tmp2[1];
</script>
<script type="text/javascript" language="javascript" src="{$URL}js/internalStart.js"></script>

<div id="mainContainer">
    <div id="mainContainerContent">
        <div id="homeUserContent">
            <img src="{$URL}do_img/global/avatar.png" alt="{$account->name}" id="pilotAvatar" />

            <div id="companyLogo" class="companyLogoSmall_{$account->Faction->tag}"></div>

            <div class="infoContainerHeadline">{t("PILOT LICENSE")}</div>
            <div id="userInfoSheet">
                <div class="userInfoLine">
                    <label>{t("Username:")}</label> {$account->name}
                </div>
                <div class="userInfoLine clan_name_qtip" title="{$account->Clan->name}">
                    <label>{t("Clan:")}</label> {$account->Clan->name}
                </div>
                <div class="userInfoLine">
                    <label>{t("Rank:")}</label>
                    <img id="userRankIcon" src="{$URL}do_img/global/ranks/rank_{$account->Rank->id}.gif"> {t($account->Rank->name)}
                </div>
            </div>
            <div id="userContentLevel">
                <label>{t("Level:")}</label> {$account->Level->id}
            </div>

            <a id="userButtonLeft" class="userHomeButton" href="{$URL}Profile/{$account->id}" target="_blank">
                {t("Pilot")}
            </a>
            <a id="userButtonMiddle" class="userHomeButton" href="{$URL}Internal/HallOfFame/dailyRank">
                {t("Ranking")}
            </a>
            <a id="userButtonRight" class="userHomeButton" href="{$URL}Internal/History">
                {t("Logbook")}
            </a>
        </div>

        <div id="homeRankingContent">
            <div class="infoContainerHeadline">{t("CORPORATE RECORDS")}</div>

            <div id="rankingTabLeft" class="rankingTab homeTabActive">
                {t("BEST PILOTS")}
            </div>
            <div id="rankingTabRight" class="rankingTab">
                {t("BEST CLANS")}
            </div>

            <table class="homeRankingTable" id="ranking_Users" border="0" cellpadding="0" cellspacing="0">
                <tr class="rankingHeadline">
                    <td>{t("Name")}</td>
                    <td>{t("Company")}</td>
                    <td>{t("Rank")}</td>
                    <td>{t("Value")}</td>
                </tr>
                {foreach from=$accountsRanking item=a name=accountsRanking}
                {$class = "rankingOdd"}
                {if $smarty.foreach.accountsRanking.iteration % 2 == 0}
                    {$class = "none"}
                {/if}
                <tr class="{$class}">
                    <td showUser="{$a->id}" title="{$a->name} - {t("click for details")}" style="cursor: pointer">
                        {$a->name}
                    </td>
                    <td>
                        <img src="{$URL}do_img/global/logos/logo_{$a->Faction->tag}_mini.png" alt="{$a->Faction->tag}" width="7" height="8" />
                    </td>
                    <td title="{$a->Rank->position}" style="cursor: pointer">{$a->Rank->position}</td>
                    <td>{$a->Rank->points}</td>
                </tr>
                {/foreach}
            </table>

            <table class="homeRankingTable" id="ranking_Clans" border="0" cellpadding="0" cellspacing="0" style="display: none">
                <tr class="rankingHeadline">
                    <td>{t("Name")}</td>
                    <td>{t("Rank")}</td>
                    <td>{t("Value")}</td>
                </tr>
                {foreach from=$clansRanking item=a name=clansRanking}
                {$class = "rankingOdd"}
                {if $smarty.foreach.clansRanking.iteration % 2 == 0}
                    {$class = "none"}
                {/if}
                <tr class="{$class}">
                    <td class="clan_name_qtip" title="{$c->name}">
                        <a href="{$URL}Clan/details/{$c->id}">
                            [{$c->tag}]
                        </a>
                    </td>
                    <td>{$c->Rank->position}</td>
                    <td>{$c->Rank->points}</td>
                </tr>
                {/foreach}
            </table>
            <a id="hallOfFame" class="userHomeButton" href="{$URL}Internal/HallOfFame">
                {t("Hall of Fame")}
            </a>
        </div>

        <script type="text/javascript">
            jQuery(".clan_name_qtip").qtip({
                style: 'dohdr',
                position: {
                    target: 'mouse'
                }
            })
        </script>

        <div id="homeNewsContent">
            <script type="text/javascript" language="javascript">
                var newsItemIds = new Array();
                var uploadedNewsIds = new Array();

                {foreach from=$news item=n}
                newsItemIds.push('{$n->id}');
                uploadedNewsIds.push('{$n->id}');
                {/foreach}
            </script>

            <div id="breakingNewsHeadline">
                <span class="bnHead_{$account->Faction->tag}">{$account->Faction->tag|strtoupper}</span> {t("NEWSLETTER")}
            </div>


            <div id="breakingNewsTop">
                <div class="empty"></div>
                <div id="newsImageOverlay" style="display: none"></div>

                {foreach from=$news item=n}
                <img id="newsImage_{$n->id}" src="{$n->image}" class="newsImage " />
                {/foreach}
            </div>
            <div id="breakingNewsLeftArrow" class="breakingNewsArrow arrowInactive"></div>
            <div id="breakingNewsRightArrow" class="breakingNewsArrow"></div>
            <div id="breakingNewsIconWrapper">
                {foreach from=$news item=n}
                <img id="newsIcon_{$n->id}" class="breakingNewsIcon" src="{$n->icon}" width="21" height="21" />
                {/foreach}

                <div id="newsIconHighlight"></div>
            </div>

            <div id="breakingNewsTopGradiant"></div>
            <div id="breakingNewsBottomGradiant"></div>
            <div id="breakingNewsText" class="scroll-pane">
                {foreach from=$news item=n}
                <div id="newsText_{$n->id}" class="newsTextContainer">
                    <h3>{t($n->title)}</h3>
                    {t($n->teaser)}
                    <br />
                    <br />
                    {t($n->text)}
                    <br />

                    {t("Your %SERVER_NAME team", $translationVars)}
                </div>
                {/foreach}
            </div>
        </div>
    </div>
    <div id="sidebarHome">
        <div id="serverTimeContainer">
            <span id="serverTime">00:00</span>
            <span id="meridiem"></span>
        </div>

        <div id="sidebarLights" class="sidebarNoEvent">
        </div>

        <div id="sidebarStatus">
            {t("UPCOMING")}
        </div>

        <div id="sidebarEvent">

            <div id="eventDisplay_upcoming" class="eventDisplay">
                {foreach from=$upcomingEvents item=e}
                <div class="upcomingEvent">
                    <div class="eventDate">{$e->date}</div>
                    <div class="eventTitle">{$e->name}</div>
                    <div class="eventTime">
                        {$e->time}
                    </div>
                </div>
                {/foreach}
            </div>
        </div>
        <a class="sidebarBottomLink" href="{$URL}Internal/HallOfFame/TDMCompanyOverallRanking">
            {t("Ranking")}
        </a>
    </div>
</div>
