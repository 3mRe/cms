<?php
namespace Application\ORM;

use Alexya\Database\ORM\Model;
use Alexya\Tools\Str;
use Httpful\Response;

/**
 * Account class ORM.
 *
 * Can represent a database row, an API result or debug from the config files.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class Account extends Model
{
    ///////////////////////////////////
    // Static methods and properties //
    ///////////////////////////////////

    /**
     * Returns an empty Account object.
     *
     * @return \Application\ORM\Account Empty account object.
     */
    public static function empty() : Account
    {
        return new Account();
    }

    /**
     * Returns an Account object from the debug array.
     *
     * @param array $settings Debug settings.
     *
     * @return \Application\ORM\Account Account object.
     */
    public static function debug(array $settings) : Account
    {
        $rows      = [];
        $relations = [];

        foreach($settings as $key => $value) {
            $firstChar        = substr($key, 0, 1);
            $firstCharIsUpper = (strtoupper($firstChar) == $firstChar);

            if(is_array($value) && $firstCharIsUpper) {
                $relations[$key] = $value;

                continue;
            }

            $rows[$key] = $value;
        }

        $account = new Account($rows);

        foreach($relations as $class => $rows) {
            $name = $class;

            if(!Str::startsWith($class, "\\")) {
                $class = "\\Application\\ORM\\{$class}";
            }

            if(!class_exists($class)) {
                $class = "\\Alexya\\Database\\ORM\\Model";
            }

            $exploded = explode("\\", $class);

            if($class != "\\Alexya\\Database\\ORM\\Model") {
                $name = $exploded[count($exploded) - 1];
            }

            $account->{$name} = new $class($rows);
        }

        return $account;
    }

    /**
     * Returns an Account object from an API response.
     *
     * @param Response $response API response.
     *
     * @return \Application\ORM\Account Account object.
     */
    public static function api(Response $response) : Account
    {
        return Account::debug(json_decode($response->raw_body, true));
    }

    ///////////////////////////////////////
    // Non static methods and properties //
    ///////////////////////////////////////

    /**
     * Checks whether the account is logged or not.
     *
     * @return bool `true` if account is logged in, `false` if not.
     */
    public function isLogged() : bool
    {
        return !empty(($this->id ?? ""));
    }
}
