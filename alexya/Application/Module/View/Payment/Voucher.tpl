<link rel="stylesheet" href="{$URL}css/cdn/internalPayment.css" />

<div id="paymentFrame" class="evoucher">
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
            <div class="button active">
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
            <div class="header">
                <img src="{$URL}do_img/global/text_tf.esg?l={$locale->code}&s=14&t=nav_sub1_evoucher_voucher_code_caps&f=eurostyle_tbla&color=yellow&bgcolor=grey" />
            </div>

            <script type="text/javascript">
                var captchaLang = '{$locale->code}';

                var RecaptchaOptions = {
                    theme: 'blackglass',
                    lang: captchaLang

                };
            </script>

            <form action="{$URL}Internal/Payment/Voucher" method="POST">
                <input type="hidden" name="action" value="redeemVoucher">
                <div class="infotext">
                    {t("Please enter your voucher code here to redeem it:")}
                </div>

                <div class="eVoucher_form">
                    <table>
                        <tbody>
                            <tr>
                                <td>
                                    <div class="voucher_arrow"></div>
                                </td>
                                <td><input class="evoucherInputField fliess11px-grey" type="text" name="evoucher" value="{t("Enter voucher code here")}" size="31" onfocus="Evoucher();" /></td>
                                <td>
                                    <div class="statusIcon"></div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div id="footer">
                    <input id="cashCodeButton" class="cashcodeButton_active cashCodeButton" type="submit" name="redeem" value="Redeem" title="{t("Redeem the voucher code that has been entered.")}" />
                    <input id="cashLogButton" class="cashcodeButton_active cashLogButton" type="submit" name="logbook" value="Logbook" href="{$URL}Internal/Payment/VoucherLog" />
                </div>
            </form>
        </div>
        <!-- end div#wrapper -->
    </div>
</div>
