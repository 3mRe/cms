<?php
namespace Alexya\Validator\Rulers;

use \Alexya\Validator\Ruler;

/**
 * Integer ruler.
 *
 * Contains validation rules for ints.
 *
 * Validation Rules:
 *
 * |   Rule    |       Parameters       |                     Description                       |
 * |-----------|:----------------------:|-------------------------------------------------------|
 * | less_than |       `int $min`       | Checks if `$value` is less than `$min`.               |
 * | more_than |       `int $min`       | Checks if `$value` is more than `$min`.               |
 * |  between  | `int $min`, `int $max` | Checks if `$value` is between than `$min` and `$max`. |
 *
 * All the rules can start with `Integer::`.
 *
 * Example:
 *
 *     $ruler = new \Alexya\Validator\Rulers\IntegerRuler();
 *     var_dump($ruler->validate("Integer::less_than", 20, [40]));   // bool(false);
 *     var_dump($ruler->validate("more_than", 30, [4]));             // bool(true);
 *     var_dump($ruler->validate("Integer::between", 40, [4, 400])); // bool(true);
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class IntegerRuler extends Ruler
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
        $rule = substr($rule, strpos($rule, "Integer::"));

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
        $rule = substr($rule, strpos($rule, "Integer::"));

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
     * Checks if `$value` is less than `$min`.
     *
     * @param int $value Value to check.
     * @param int $min   Min length.
     *
     * @return bool `true` if `$value` is less than `$min`, `false` if not.
     */
    public function less_than(int $value, int $min) : bool
    {
        return $value < $min;
    }

    /**
     * Checks if `$value` is more than `$min`.
     *
     * @param int $value Value to check.
     * @param int $max   Max length.
     *
     * @return bool `true` if `$value` is more than `$min`, `false` if not.
     */
    public function more_than(int $value, int $max) : bool
    {
        return $value > $max;
    }

    /**
     * Checks if `$value` is between than `$min` and `$max`.
     *
     * @param int $value Value to check.
     * @param int $min   Min length.
     * @param int $max   Max length.
     *
     * @return bool `true` if `$value` is between than `$min` and `$max`, `false` if not.
     */
    public function between(int $value, int $min, int $max) : bool
    {
        return ($value >= $min && $value <= $max);
    }
    ///////////////
    // End Rules //
    ///////////////
}
