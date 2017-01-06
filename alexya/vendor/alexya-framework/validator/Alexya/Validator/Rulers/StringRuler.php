<?php
namespace Alexya\Validator\Rulers;

use \Alexya\Validator\Ruler;

/**
 * String ruler.
 *
 * Contains validation rules for strings.
 *
 * Validation Rules:
 * |      Rule      |      Parameters        |                          Description                          |
 * |----------------|:----------------------:|---------------------------------------------------------------|
 * |    not_empty   |                        | Requires the value to not be empty.                           |
 * |   min_length   |        `int $i`        | Requires the value to be, at least, `$i` length.              |
 * |   max_length   |        `int $i`        | Requires the value to be less than `$i` length.               |
 * | length_between |  `int $min`, `int max` | Requires the value to length to be between `$min` and `$max`. |
 * | contains_chars | `string/array $chars`  | Requires the value to contain any of the specified chars.     |
 * |    matches     |    `string $regex`     | Requires the value to match `$regex`.                         |
 * |    is_email    |                        | Requires the value to be a valid email.                       |
 * |     is_url     |                        | Requires the value to be a valid url.                         |
 * |     is_ip      |                        | Requires the value to be a valid IP.                          |
 * |     is_mac     |                        | Requires the value to be a valid mac.                         |
 * |    is_regex    |                        | Requires the value to be a valid regex.                       |
 * |    is_hash     |                        | Requires the value to be a valid hash.                        |
 * |    is_json     |                        | Requires the value to be a valid json.                        |
 *
 * All the rules can start with `String::`.
 *
 * Example:
 *
 *     $ruler = new \Alexya\Validator\Rulers\StringRuler();
 *     var_dump($ruler->validate("String::not_empty", ""));      // bool(false);
 *     var_dump($ruler->validate("min_length", "test", [4]));    // bool(true);
 *     var_dump($ruler->validate("String::is_ip", "127.0.0.1")); // bool(true);
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class StringRuler extends Ruler
{
    /**
     * Checks if the given rule exists in this ruler.
     *
     * @param string $rule Rule name.
     *
     * @return bool `true` if `$rule` is a valid rule in this ruler, `false` if not.
     */
    public function exists(string $rule) : bool
    {
        $rule = substr($rule, strpos($rule, "String::"));

        return is_callable([$this, $rule]);
    }

    /**
     * Validates input with given rule.
     *
     * @param string $rule       Rule name.
     * @param mixed  $value      Value to validate.
     * @param array  $parameters Parameters to send to the callback.
     *
     * @return bool `true` if `$value` was successfully validated with `$rule`, `false` if not.
     */
    public function validate(string $rule, $value, array $parameters = []) : bool
    {
        $rule = substr($rule, strpos($rule, "String::"));

        if(!$this->exists($rule)) {
            // Maybe throw exception?
            return false;
        }

        return $this->$rule(... $parameters);
    }

    /////////////////
    // Start Rules //
    /////////////////
    /**
     * Checks that string has at least $length chars.
     *
     * @param string  $value  Value to check.
     * @param int     $length Min length.
     *
     * @return bool `true` if `$value` length is, at least, `$length`, `false` if not.
     */
    public function min_length(string $value, int $length) : bool
    {
        return (strlen($value) >= $length);
    }

    /**
     * Checks that string has less than $length chars.
     *
     * @param string  $value  Value to check.
     * @param int     $length Max length.
     *
     * @return bool `true` if `$value` length is less than `$length`, `false` if not.
     */
    public function max_length(string $value, int $length) : bool
    {
        return (strlen($value) <= $length);
    }

    /**
     * Checks that string matches $regex.
     *
     * @param string $value Value to check.
     * @param string $regex Regex to match.
     *
     * @return bool `true` if `$value` matches `$regex`, `false` if not.
     */
    public function matches(string $value, string $regex) : bool
    {
        return preg_match($regex, $value);
    }

    /**
     * Checks that string length is between $min and $max.
     *
     * @param string  $value Value to check.
     * @param int     $min   Min length.
     * @param int     $max   Max length.
     *
     * @return bool `true` if `$value` length is between `$min` and `$max`, `false` if not.
     */
    public function length_between(string $value, int $min, int $max) : bool
    {
        return ($this->min_length($value, $min) && $this->max_length($min, $max));
    }

    /**
     * Checks if string contains any of $chars.
     *
     * @param string       $value Value to check.
     * @param string|array $chars Chars.
     *
     * @return bool `true` if `$value` contains any of `$chars`, `false` if not.
     */
    public function contains_chars(string $value, $chars) : bool
    {
        if(is_string($chars)) {
            $chars = str_split($chars);
        }
        if(!is_array($chars)) {
            return false;
        }

        foreach($chars as $c) {
            $pos = strpos($value, $chars);

            if($pos !== false) {
                return true;
            }
        }

        return false;
    }

    /**
     * Checks whether a string is a valid email.
     *
     * @param string $value Value to check.
     *
     * @return bool `true` if `$value` is a valid email, `false` if not.
     */
    public function is_email(string $value) : bool
    {
        return filter_var($value, FILTER_VALIDATE_EMAIL);
    }

    /**
     * Checks whether a string is a valid URL.
     *
     * @param string $value Value to check.
     *
     * @return bool `true` if `$value` is a valid URL, `false` if not.
     */
    public function is_url(string $value) : bool
    {
        return filter_var($value, FILTER_VALIDATE_URL);
    }

    /**
     * Checks whether a string is a valid IP.
     *
     * @param string $value Value to check.
     *
     * @return bool `true` if `$value` is a valid IP, `false` if not.
     */
    public function is_ip(string $value) : bool
    {
        return filter_var($value, FILTER_VALIDATE_IP);
    }

    /**
     * Checks whether a string is a valid MAC.
     *
     * @param string $value Value to check.
     *
     * @return bool `true` if `$value` is a valid MAC, `false` if not.
     */
    public function is_mac(string $value) : bool
    {
        return filter_var($value, FILTER_VALIDATE_MAC);
    }

    /**
     * Checks whether a string is a valid regular expression.
     *
     * @param string $value Value to check.
     *
     * @return bool `true` if `$value` is a regex, `false` if not.
     */
    public function is_regex(string $value) : bool
    {
        return filter_var($value, FILTER_VALIDATE_REGEXP);
    }

    /**
     * Checks whether a string is a valid hash.
     *
     * @param string $value Value to check.
     *
     * @return bool `true` if `$value` is a valid hash, `false` if not.
     */
    public function is_hash(string $value) : bool
    {
        return preg_match("/^([abcdef0-9]*)$/", $this->_value);
    }

    /**
     * Checks whether a string is a valid JSON.
     *
     * @param string $value Value to check.
     *
     * @return bool `true` if `$value` is a valid json, `false` if not.
     */
    public function is_json(string $value) : bool
    {
        $json = json_decode($value);

        return (json_last_error() == JSON_ERROR_NONE);
    }
    ///////////////
    // End Rules //
    ///////////////
}
