<?php
namespace Alexya\Localization;

/**
 * Locale class.
 *
 * Represents a locale option.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class Locale
{
    /**
     * Locale name.
     *
     * @var string
     */
    public $name = "";

    /**
     * Locale code.
     *
     * @var string
     */
    public $code = "";

    /**
     * Locale large code.
     *
     * @var string
     */
    public $largeCode = "";

    /**
     * Constructor.
     *
     * @param string $name Locale name.
     * @param string $code Locale code.
     * @param string $largeCode Locale large code.
     */
}
