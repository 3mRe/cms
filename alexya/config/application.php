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
