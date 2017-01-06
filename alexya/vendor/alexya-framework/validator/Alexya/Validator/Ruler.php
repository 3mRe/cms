<?php
namespace Alexya\Validator;

/**
 * Ruler class.
 *
 * This class is the base for all rulers.
 *
 * Each child class should decide how the rules will be stored.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
abstract class Ruler
{
    /**
     * Checks if the given rule exists in this ruler.
     *
     * @param string $rule Rule name.
     *
     * @return bool `true` if `$rule` is a valid rule in this ruler, `false` if not.
     */
    public abstract function exists(string $rule) : bool;

    /**
     * Validates input with given rule.
     *
     * @param string $rule       Rule name.
     * @param mixed  $value      Value to validate.
     * @param array  $parameters Parameters to send to the callback.
     *
     * @return bool `true` if `$value` was successfully validated with `$rule`, `false` if not.
     */
    public abstract function validate(string $rule, $value, array $parameters = []) : bool;
}
