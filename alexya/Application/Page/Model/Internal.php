<?php
namespace Application\Page\Model;

use Alexya\Container;
use Alexya\Foundation\Model;

/**
 * Internal page model.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class Internal extends Model
{
    /**
     * On instance method.
     *
     * Adds model variables to the array.
     */
    public function onInstance()
    {
        $this->account = Container::Account();
        $this->news    = Container::API()->get("news/latest/10");
        
        $this->translationVars = [
            "SERVER_NAME"           => Container::Server()->name,
            "UNREAD_MESSAGES_COUNT" => 0,
            "EXP_FOR_NEXT_LEVEL"    => 0
        ];
    }
}
