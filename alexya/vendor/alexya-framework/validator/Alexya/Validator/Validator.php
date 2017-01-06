<?php
namespace Alexya\Validator;

/**
 * Validator class.
 *
 * This class provides helpers for validating input.
 *
 * The constructor can accept as parameter an array of `\Alexya\Validator\Ruler` objects.
 * You can also add a new ruler using the method `addRuler`.
 *
 * Example:
 *
 *     $validator = new \Alexya\Validator\Validator([
 *         new \Alexya\Validator\Rulers\StringRuler(),
 *         new \Alexya\Validator\Rulers\IntegerRuler()
 *     ]);
 *     $validator->addRuler(new \Alexya\Validator\Rulers\GenericRuler());
 *
 * For adding a field use the method `add` which accepts as parameter the filed name and
 * its value and returns an object of type `\Alexya\Validator\Field`.
 *
 * Once you've added all the fields use the method `validate` to validate the fields.
 * If a string is sent as parameter, it will validate the field with that name, if not it will
 * validate all fields.
 * It returns `true` if all fields have been validated successfully, `false` if not.
 *
 * The method `getErrors` returns an array containing validation errors.
 *
 * Example:
 *
 *     $validator = new \Alexya\Validator\Validator([);
 *     $validator->addRuler(new \Alexya\Validator\Rulers\GenericRuler());
 *     $validator->addRuler(new \Alexya\Validator\Rulers\StringRuler());
 *
 *     $validator->add("username", "test")
 *               ->addRule("String::required", "Please, enter your username")
 *               ->addRule("String::min_length", [3], "Your username can't be less than 3 chars")
 *               ->addRule("String::max_length", [20], "Your username can't be more than 20 chars")
 *               ->addRule("String::not_contains_chars", ["#$!\\"], "Your password can't contain special chars");
 *     $validator->add("password", "asdf123")
 *               ->addRule("String::required", "Please, enter your password")
 *               ->addRule("String::min_length", [3], "Your password can't be less than 3 chars");
 *
 *     if($validator->validate()) {
 *         echo "All input has been successfully validated"
 *     } else {
 *         $messages = $validator->getErrors();
 *
 *         echo "Couldn't validate inputs!";
 *         foreach($messages as $message) {
 *             echo $message;
 *         }
 *     }
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class Validator
{
    /**
     * Fields to validate.
     *
     * @var array
     */
    private $_fields = [];

    /**
     * Validation errors.
     *
     * @var array
     */
    private $_errors = [];

    /**
     * Rulers applied to the validation.
     *
     * @var array
     */
    private $_rulers = [];

    /**
     * Constructor.
     *
     * @param array $rulers Validation rulers.
     */
    public function __construct(array $rulers = [])
    {
        $this->_rulers = array_map(function($ruler) {
            return ($ruler instanceof Ruler); // Assure the array contains Ruler objects
        }, $rulers);
    }

    /**
     * Adds a ruler to the array.
     *
     * @param \Alexya\Validator\Ruler $ruler Ruler to add.
     */
    public function addRuler(Ruler $ruler)
    {
        $this->_rulers[] = $ruler;
    }

    /**
     * Adds a field to the array.
     *
     * If the field already exists it will be overriden.
     *
     * @param string $name  Field name.
     * @param string $value Field value.
     *
     * @return \Alexya\Validator\Field Field object.
     */
    public function add(string $name, string $value) : Field
    {
        $field = new Field($name, $value);

        $this->_fields[$field->getName()] = $field;

        return $field;
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

    /**
     * Performs the validation.
     *
     * If the `$name` parameter is empty, all fields will be validated.
     *
     * @param string $name Field name to validate
     *
     * @return bool `true` if the field(s) where successfully validated, `false` if not.
     */
    public function validate(string $name = "") : bool
    {
        if(isset($this->_fields[$name])) {
            return $this->_validate($this->_fields[$name]);
        }

        $ret = true;
        foreach($this->_fields as $field) {
            if(!$this->_validate($field)) {
                $ret = false;
            }
        }

        return $ret;
    }

    /**
     * Performs the actual validation.
     *
     * @param \Alexya\Validator\Field $field Field to validate.
     *
     * @return bool `true` if the field was successfully validated, `false` if not.
     */
    private function _validate(Field $field) : bool
    {
        foreach($this->_rulers as $ruler) {
            if(!$field->validate($ruler)) {
                $this->_errors = array_merge($this->_errors, $field->getErrors());

                return false;
            }
        }

        return true;
    }
}
