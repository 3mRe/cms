<link rel="stylesheet" media="all" href="{$URL}css/cdn/window_alert.css" />
<!-- start payment template -->

<div id="paymentContent"></div>
<div id="internalPaymentCloseButton" onclick="closePaymentWindow(this)"></div>
<div id="paymentFrame">
    <div id="navigationFrame">
        <link rel="stylesheet" href="{$URL}css/cdn/navigation.css" />

        <!-- start internal uridum -->

        <div id="navigation">
            <!-- Banking -->
            <div class="button active">
                <a href="{$URL}Internal/Payment/Banking" title="{t("Banking")}">
                    <img src="{$URL}do_img/global/text_tf.esg?l={$locale->code}&s=10&t=nav_sub1_payment_banking&f=eurostyle_tregcon&color=white&bgcolor=grey" />
                </a>
            </div>

            <!-- Balance -->
            <div class="button ">
                <a href="{$URL}Internal/Payment/Balance" title="{t("Balance")}">
                    <img src="{$URL}do_img/global/text_tf.esg?l={$locale->code}&s=10&t=nav_sub1_payment_balance&f=eurostyle_tregcon&color=black&bgcolor=grey1" />
                </a>
            </div>


            <!-- Subscriptions -->
            <div class="button">
                <a href="{$URL}Payment" class="open_external" target="_blank" title="{t("Manage subscriptions")}">
                    <img src="{$URL}do_img/global/text_tf.esg?l={$locale->code}&s=10&t=nav_sub1_payment_sms_subscription&f=eurostyle_tregcon&color=white&bgcolor=grey" />
                </a>
            </div>

            <!-- Vouchers -->
            <div class="button ">
                <a href="{$URL}Payment/Vouchers" title="{t("VOUCHERS")}">
                    <img src="{$URL}do_img/global/text_tf.esg?l={$locale->code}&s=10&t=nav_sub1_evoucher_voucher_caps&f=eurostyle_tregcon&color=white&bgcolor=grey" />
                </a>
            </div>

            <!-- internalPaymentPartnerPromotion -->

            <!-- internalPaymentPartnerVoucher -->

        </div>

        <script type="text/javascript">
            var openExternal = function(address, scroll) {
                var external = window.open(
                    address.replace(/\+/g, "%2B"), "paymentglobal", "width=1000,height=535,left=100,top=200,scrollbars=" + scroll
                );
                external.focus();
            };

            jQuery('document').ready(function() {
                jQuery('.open_external').bind('click', function(evt) {
                    evt.preventDefault();

                    var href = jQuery(this).attr('href');
                    openExternal(href, 'no')
                });

                jQuery('.open_confirm').bind('click', function(evt) {
                    evt.preventDefault();

                    var href = jQuery(this).attr('href');
                    confirmPackage(href)
                });
            });

        </script>

        <!-- end internal uridium -->

        <div id="wrapper">
            <div class="payment_box multiplier_box">
                <a href="{$randomPackage->link}" class="open_external">
                    <span class="headline">{t($randomPackage->title)}</span>
                    <span class="text">{t($randomPackage->text)}</span>
                    <span class="logo package{$randomPackage->id}"><!--  --></span>
                </a>
            </div>

            <div class="packages">
                {foreach from=$packages item=p}
                <div class="package">
                    <a href="{$p->link}" target="_blank" class="open_external">
                        <span class="headline">
                            {t($p->title)}
                        </span>
                        <span class="text">
                            {t($p->text)}
                        </span>
                    </a>
                </div>
                {/foreach}

                <div style="clear:both;">
                    <!--  -->
                </div>
            </div>

            <div class="get_uridium">
                <a href="{$URL}Payment" target="_blank" class="open_external">
                    {t("Get Uridium")}
                </a>
            </div>

            <div>
                <div style="float:left;">
                </div>

                <div style="float:right;">
                    <div class="earn_uridium">
                        <a href="{$URL}Payment/CashForAction" class="open_external">
                            {t("Cash for action")}
                        </a>
                    </div>
                </div>

                <div style="clear:both">
                    <!--  -->
                </div>
            </div>
        </div>
        <!-- end div#wrapper -->

        <div style="clear:both;">
            <!--  -->
        </div>

    </div>
    <!-- end div#navigationWrapper -->
</div>
<!-- end payment template -->
