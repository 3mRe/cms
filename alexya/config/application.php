<?php
/**
 * Alexya Framework - The intelligent Loli Framework
 *
 * Application specific configuration
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */

return [
    /**
     * Server URL.
     */
    "url" => "http://blackeye/",

    /**
     * API server information.
     */
    "api" => [
        /**
         * Whether the API is in debug or not.
         */
        "debug" => true,

        /**
         * Server host.
         */
        "host" => "localhost",

        /**
         * Mocked respones in case API is in debug.
         */
        "mocks" => [
            /**
             * Login response.
             */
            "login" => [
                "result"     => true,
                "session_id" => "0000000000000000"
            ]
        ]
    ],

    /**
     * ORM information.
     */
    "orm" => [
        /**
         * From where are going to be loaded ORM classes.
         *
         * Possible values:
         *  * `database` To load them from the database.
         *  * `debug` To load them from this configuration.
         *  * `default` To load them from API server.
         */
        "load_from" => "debug",

        /**
         * Account ORM debug info.
         */
        "account" => [
            "id"          => 1, // 0 to flag the account as not logged ina
            "session_id"  => "0000000000000000",
            "factions_id" => 0,
            "name"        => "manulaiko",
            "credits"     => 0,
            "uridium"     => 1,
            "experience"  => 2,
            "honor"       => 3,
            "jackpot"     => 4
        ]
    ],

    /**
     * Server information.
     */
    "server" => [
        "title"           => "BlackEye Private Server",
        "tags"            => ["game", "darkorbit", "private server", "blackeye", "spaceshooter"],
        "author"          => "BlackEye DevTeam",
        "reply_to"        => "",
        "company"         => "BlackEye DevTeam",
        "name"            => "BlackEye",
        "description"     => "The best DarkOrbit Private Server",
        "locales"         => [],
        "registeredUsers" => 0
    ]
];
