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

    return new \Application\API($Settings->get("application.api.host"), $template);
});

\Alexya\Container::registerSingleton("Server", function() {
    /**
     * Settings object.
     *
     * @var \Alexya\Settings $Settings
     */
    $Settings = \Alexya\Container::Settings();

    return new \Alexya\Tools\Collection($Settings->get("application.server"));
});

\Alexya\Container::registerSingleton("Account", function() {
    /**
     * Settings object.
     *
     * @var \Alexya\Settings $Settings
     */
    $Settings = \Alexya\Container::Settings();

    /**
     * Session object.
     *
     * @var \Alexya\Tools\Session\Session $Session
     */
    $Session = \Alexya\Container::Session();
    $sid     = $Session->id;

    if(empty($sid)) {
        return \Application\ORM\Account::empty();
    }

    if($Settings->get("application.orm.load_from") == "database") {
        return \Application\ORM\Account::find([
            "session_id" => $sid
        ]);
    }

    if($Settings->get("application.orm.load_from") == "debug") {
        return \Application\ORM\Account::debug($Settings->get("application.orm.account"));
    }

    /**
     * API Object.
     *
     * @var \Application\API $API
     */
    $API = \Alexya\Container::API();

    return \Application\ORM\Account::api($API->get("accounts/{$sid}"));
});

\Alexya\Foundation\View::global("server", \Alexya\Container::Server());
\Alexya\Foundation\View::global("locale", \Alexya\Container::Translator()->locale);
\Alexya\Foundation\View::global("URL", \Alexya\Container::Settings()->get("application.url"));

\Alexya\Container::Router()->route(true);
