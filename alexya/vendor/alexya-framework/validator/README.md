# Validator
Alexya's validator components

## Contents

 - [Validator](#validator)
    - [Instantiating Validator objects](#instantiating_validator_objects)
    - [Adding fields](#adding_fields)
    - [Validating](#validating)
 - [Field](#field)
    - [Instantiating Field objects](#instantiating_field_objects)
    - [Adding rules](#adding_rules)
    - [Validating fields](#validating_fields)
 - [Rulers](#rulers)
    - [String ruler](#string_ruler)
    - [Integer ruler](#integer_ruler)

<a name="validator"></a>
## Validator
The class `\Alexya\Validator\Validator` provides helpers for validating input.

You'll need to instance a `Validator` object, add the fields to validate and call the `validate` method.

<a name="instantiating_validator_objects"></a>
### Instantiating Validator objects

The constructor can accept as parameter an array of `\Alexya\Validator\Ruler` objects.
You can also add a new ruler using the method `addRuler`.

Example:

```php
<?php

$validator = new \Alexya\Validator\Validator([
    new \Alexya\Validator\Rulers\StringRuler(),
    new \Alexya\Validator\Rulers\IntegerRuler()
]);

$validator->addRuler(new \Alexya\Validator\Rulers\GenericRuler());
```

<a name="adding_fields"></a>
### Adding fields
For adding a field use the method `add` which accepts as parameter the filed name and its value and returns
an object of type `\Alexya\Validator\Field` which is the [field](#field).

<a name="validating"></a>
### Validating

Once you've added all the fields use the method `validate` to validate the fields.
If a string is sent as parameter, it will validate the field with that name, if not it will
validate all fields.
It returns `true` if all fields have been validated successfully, `false` if not.

The method `getErrors` returns an array containing validation errors.

Example:

```php
<?php

$validator = new \Alexya\Validator\Validator([);
$validator->addRuler(new \Alexya\Validator\Rulers\GenericRuler());
$validator->addRuler(new \Alexya\Validator\Rulers\StringRuler());

$validator->add("username", "test")
          ->addRule("String::required", "Please, enter your username")
          ->addRule("String::min_length", [3], "Your username can't be less than 3 chars")
          ->addRule("String::max_length", [20], "Your username can't be more than 20 chars")
          ->addRule("String::not_contains_chars", ["#$!\\"], "Your password can't contain special chars");
$validator->add("password", "asdf123")
          ->addRule("String::required", "Please, enter your password")
          ->addRule("String::min_length", [3], "Your password can't be less than 3 chars");

if($validator->validate()) {
    echo "All input has been successfully validated"
} else {
    $messages = $validator->getErrors();

    echo "Couldn't validate inputs!";
    foreach($messages as $message) {
        echo $message;
    }
}
```

<a name="field"></a>
## Field
The class `\Alexya\Validator\Field` represents the field to validate.

<a name="instantiating_field_objects"></a>
### Instantiating Field objects
The constructor accepts as parameter the field to validate.

<a name="adding_rules"></a>
### Adding rules
You can add validation rules with the method `addRule` which accepts three parameters:

 * A string being the rule name.
 * An array containing the parameters to send to the ruler (can be omited).
 * A string being the error message if the field doesn't satisfy the rule.

This method returns an instance of this object for chainability.

<a name="validating_fields"></a>
### Validating fields
Once you've added all rules, use the method `validate` to validate the field.
It accepts as parameter the ruler object with the validation rules and returns
`true` if the validation succeeded, `false` if not.

The method `getErrors` returns an array with the validation errors.

Example:

```php
<?php

$field = new Field("test");
$field->addRule("String::not_empty", "The string can't be empty!");
      ->addRule("String::min_length", [4], "The string can't be shorter than 4 chars!");
      ->addRule("String::max_length", [20], "The string can't be longer than 20 chars!");
      ->addRule("String::matches", ["([0-9A-Z]*)"], "The string must have only numbers and letters!");

if(!$field->validate()) {
    echo implode("\n", $field->getErrors());
}
```

<a name="rulers"></a>
## Rulers
The class `\Alexya\Validator\Ruler` is the base class for all rulers.

A ruler is an object that contains the methods for validating input.

<a name="string_ruler"></a>
### String ruler
The class `\Alexya\Validator\Rulers\StringRuler` contains validation rules for strings.

Validation Rules:

|      Rule      |      Parameters        |                          Description                          |
|----------------|:----------------------:|---------------------------------------------------------------|
|    not_empty   |                        | Requires the value to not be empty.                           |
|   min_length   |        `int $i`        | Requires the value to be, at least, `$i` length.              |
|   max_length   |        `int $i`        | Requires the value to be less than `$i` length.               |
| length_between |  `int $min`, `int max` | Requires the value to length to be between `$min` and `$max`. |
| contains_chars | `string/array $chars`  | Requires the value to contain any of the specified chars.     |
|    matches     |    `string $regex`     | Requires the value to match `$regex`.                         |
|    is_email    |                        | Requires the value to be a valid email.                       |
|     is_url     |                        | Requires the value to be a valid url.                         |
|     is_ip      |                        | Requires the value to be a valid IP.                          |
|     is_mac     |                        | Requires the value to be a valid mac.                         |
|    is_regex    |                        | Requires the value to be a valid regex.                       |
|    is_hash     |                        | Requires the value to be a valid hash.                        |
|    is_json     |                        | Requires the value to be a valid json.                        |

All the rules can start with `String::`.

Example:

```php
<?php

$ruler = new \Alexya\Validator\Rulers\StringRuler();

var_dump($ruler->validate("String::not_empty", ""));      // bool(false);
var_dump($ruler->validate("min_length", "test", [4]));    // bool(true);
var_dump($ruler->validate("String::is_ip", "127.0.0.1")); // bool(true);
```

<a name="integer_ruler"></a>
### Integer ruler
The class `\Alexya\Validator\Rulers\IntegerRuler` contains validation rules for integers.

Validation Rules:

|   Rule    |       Parameters       |                     Description                       |
|-----------|:----------------------:|-------------------------------------------------------|
| less_than |       `int $min`       | Checks if `$value` is less than `$min`.               |
| more_than |       `int $min`       | Checks if `$value` is more than `$min`.               |
|  between  | `int $min`, `int $max` | Checks if `$value` is between than `$min` and `$max`. |

All the rules can start with `Integer::`.

Example:

```php
<?php

$ruler = new \Alexya\Validator\Rulers\IntegerRuler();

var_dump($ruler->validate("Integer::less_than", 20, [40]));   // bool(false);
var_dump($ruler->validate("more_than", 30, [4]));             // bool(true);
var_dump($ruler->validate("Integer::between", 40, [4, 400])); // bool(true);
```
