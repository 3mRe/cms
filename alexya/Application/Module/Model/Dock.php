<?php
namespace Application\Module\Model;

use Alexya\Foundation\Model;

/**
 * Dock page model.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class Dock extends Model
{
    /**
     * Sets variables.
     */
    public function onInstance()
    {
        $this->pet = json_encode([
            "hasPet"  => true,
            "level"   => 1,
            "fuel"    => 1000,
            "maxFuel" => 1000000,
        ]);
    }
}
