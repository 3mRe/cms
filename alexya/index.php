<?php
/**
 * Alexya Framework - The intelligent Loli Framework
 *
 * This file will act as front controller, will load
 * bootstrap.php and call router.
 *
 * In this file you can add your custom routes (if you don't want
 * to add them through [the configuration file](config/routes.php)),
 * define constants, add global variables to the view and so on.
 *
 * The last statement of the file is the call to the router, it should
 * stay the last since (by default) Alexya will finnish the execution once
 * the router has finnished.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */

/**
 * Load composer.
 */
if(!require_once("vendor/autoload.php")) {
    die("Please, execute `composer update` in order to install dependencies");
}

\Alexya\Container::Logger()->info("Request URI: ". \Alexya\Container::Settings()->get("alexya.router.uri"));

\Alexya\Container::registerSingleton("API", function() {
    /**
     * Settings object.
     *
     * @var \Alexya\Settings $Settings
     */
    $Settings = \Alexya\Container::Settings();

    $template = \Httpful\Request::init()
                                ->method(\Httpful\Http::POST)
                                ->expects(\Httpful\Mime::JSON)
                                ->sendsType(\Httpful\Mime::FORM);

    return new \Application\API($Settings->get("application.api_host"), $template);
});

\Alexya\Container::registerSingleton("Server", function() {
    /**
     * Settings object.
     *
     * @var \Alexya\Settings $Settings
     */
    $Settigns = \Alexya\Container::Settings();

    return new \Alexya\Tools\Collection($Settings->get("application.server"));
});

\Alexya\Foundation\View::global("server", \Alexya\Container::Server());
\Alexya\Foundation\View::global("locale", \Alexya\Container::Translator()->locale);

\Alexya\Container::Router()->route();
