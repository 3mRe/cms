<link rel="stylesheet" href="{$URL}css/cdn/internalPayment.css" />
<script type="text/javascript" src="{$URL}js/page/payment/internalBalanceDomReady.js"></script>

<div id="paymentFrame" class="balancePageBG">
    <div id="navigationFrame">
        <link rel="stylesheet" href="{$URL}css/cdn/navigation.css" />

        <!-- start internal uridum -->

        <div id="navigation">
            <!-- Banking -->
            <div class="button ">
                <a href="{$URL}Internal/Payment/Banking" title="{t("Banking")}">
                    <img src="{$URL}do_img/global/text_tf.esg?l={$locale->code}&s=10&t=nav_sub1_payment_banking&f=eurostyle_tregcon&color=white&bgcolor=grey" />
                </a>
            </div>

            <!-- Balance -->
            <div class="button active">
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

        <div id="wrapper" class="balancePage" style="height:391px">

            <div class="headline">{t("Balance")}</div>

            <ul class="balance_items" style="margin:1px 0 3px 0;">
                <li class="balance_item">
                    <span class="date">{t("Date")}</span>
                    <span class="description">{t("Action")}</span>
                    <span class="amount">{t("Amount")}</span>
                </li>
            </ul>

            <div style="width: 626px;">
                <div id="balanceListContainer" style="height: 264px; overflow: auto; ">
                    <ul class="balance_items">
                        {foreach from=$balance item=$b}
                        <li class="balance_item">
                            <span class="date">{$b->date}</span>
                            <span class="description">{t($b->description)}</span>
                            <span class="amount">{$b->amount}</span>
                        </li>
                        {/foreach}
                    </ul>
                </div>
            </div>


            <div class="pagination">
                <font class='navi_black'><b>[{$page}] </b></font>
                {foreach from=$pages item=$p}
                <a class="navi_normal" href="{$p->link}">{t($p->text)}</a>
                {/foreach}
            </div>
        </div>
        <!-- end: #wrapper -->

        <div style="clear:both">
            <!--  -->
        </div>

    </div>
    <!-- end: #navigationFrame -->
</div>
<!-- end: #paymentFrame -->
