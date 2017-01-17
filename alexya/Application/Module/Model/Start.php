<?php
namespace Application\Module\Model;

use Alexya\Foundation\Model;

/**
 * Start page model.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class Start extends Model
{
    /**
     * Sets variables.
     */
    public function onInstance()
    {
        $this->serverTime = "00:00 AM";
        $this->serverDate = "25/12/2000";

        $this->accountsRanking = [];
        $this->clansRanking    = [];

        $this->upcomingEvents = [];
    }
}
