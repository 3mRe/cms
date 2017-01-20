<?php
namespace Application\Module\Model;

use Alexya\Container;
use Alexya\Foundation\Model;

/**
 * Payment page model.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class Payment extends Model
{
    /**
     * Sets variables.
     */
    public function onInstance()
    {
        $this->balance = [];
        $this->pages   = [];

        $this->randomPackage = json_decode($this->_getRandomPackage());
        $this->packages      = json_decode($this->_getPackages());
    }

    /**
     * Returns a random package.
     *
     * @return string Random package JSON.
     */
    private function _getRandomPackage() : string
    {
        $json = [
            "link"  => Container::Settings()->get("application.url") ."Payment/StarterPack",
            "title" => "Starter pack",
            "text"  => "The perfect package for starting space-pilots"
        ];

        return json_encode($json);
    }

    /**
     * Returns available packages.
     *
     * @return string Available packages JSON.
     */
    private function _getPackages() : string
    {
        $json = [];

        return json_encode($json);
    }
}
