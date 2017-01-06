<?php
namespace Alexya\Validator;

/**
 * Field class.
 *
 * The constructor accepts as parameter the field to validate.
 *
 * You can add validation rules with the method `addRule` which accepts three parameters:
 *
 *  * A string being the rule name.
 *  * An array containing the parameters to send to the ruler (can be omited).
 *  * A string being the error message if the field doesn't satisfy the rule.
 *
 * This method returns an instance of this object for chainability.
 *
 * Once you've added all rules, use the method `validate` to validate the fi        $validator = $this->_getValidator($name, $password, $email);
eld.
 * It accepts as parameter the ruler object with the validation rules and returns
 * `true` if the validation succeeded, `false` if not.
 *
 * The method `getErrors` returns an array with the validation errors.
 *
 * Example:
 *
 *     $field = new Field("test");
 *     $field->addRule("String::not_empty", "The string can't be empty!");
 *           ->addRule("String::min_length", [4], "The string can't be shorter than 4 chars!");
 *           ->addRule("String::max_length", [20], "The string can't be longer than 20 chars!");
 *           ->addRule("String::matches", ["([0-9A-Z]*)"], "The string must have only numbers and letters!");
 *
 *     if(!$field->validate()) {
 *         echo implode("\n", $field->getErrors());
 *     }
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class Field
{
    /**
     * Rules array.
     *
     * @var array
     */
    private $_rules = [];

    /**
     * Errors array.
     *
     * @var array
     */
    private $_errors = [];

    /**
     * Field value.
     *
     * @var mixed
     */
    private $_value;

    /**
     * Field name.
     *
     * @var string
     */
    private $_name = "";

    /**
     * Constructor.
     *
     * @param string $name  Field name.
     * @param mixed  $value Field value.
     */
    public function __construct(string $name, $value)
    {
        $this->_name  = $name;
        $this->_value = $value;
    }

    /**
     * Returns field name.
     *
     * @return string Field name.
     */
    public function getName() : string
    {
        return $this->_name;
    }

    /**
     * Adds a rule to the array.
     *
     * If the rule already exists, it will be overwritten.
     *
     * @param string       $rule       Rule name.
     * @param string|array $parameters Parameters to send to the ruler (if a string, it will be interpreted as`$message`).
     * @param string       $message    Error message in case the field doesn't satisfy the rule.
     *
     * @return \Alexya\Validator\Field Chainability object
     */
    public function addRule(string $rule, $parameters, string $message = "") : Field
    {
        if(is_string($parameters)) {
            $message    = $parameters;
            $parameters = [];
        }

        $this->_rules[$rule] = [
            "parameters" => $parameters,
            "message"    => $message
        ];

        return $this;
    }

    /**
     * Performs the validation.
     *
     * @param \Alexya\Validator\Ruler $ruler Ruler with the validation rules.
     *
     * @return bool `true` if the field was sucessfully validated, `false` if not.
     */
    public function validate(Ruler $ruler) : bool
    {
        $ret = true;

        foreach($this->_rules as $rule => $value) {
            if(!$ruler->exists($rule)) {
                continue;
            }

            if(!$ruler->validate($rule, $this->_value, $value["parameters"])) {
                $ret = false;
                $this->_errors[] = $value["message"];
            }
        }

        return $ret;
    }

    /**
     * Returns the errors array.
     *
     * @return array Array with validation errors.
     */
    public function getErrors() : array
    {
        return $this->_errors;
    }
}
