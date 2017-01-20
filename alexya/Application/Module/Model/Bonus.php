<?php
namespace Application\Module\Model;

use Alexya\Foundation\Model;

/**
 * Bonus page model.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class Bonus extends Model
{
    /**
     * Sets variables.
     */
    public function onInstance()
    {
        $this->invites      = json_decode($this->_buildInvites());
        $this->dailyBonus   = json_decode($this->_buildDailyBonus());
        $this->currentBonus = 0;
    }

    /**
     * Returns the invites object as json.
     *
     * @return string Invites object as json.
     */
    private function _buildInvites() : string
    {
        $json = [
            "totalSent"      => 0,
            "totalOpened"    => 0,
            "availableToday" => 0,
            "maxPerDay"      => 0,
            "accepted"       => 0,
            "receivedBonus"  => 0,

            "bonus" => [
                "low" => [
                    "1 month of Premium",
                    "10,000 UCB-100 Ammunition"
                ],
                "mid" => [
                    "1 month of Premium",
                    "10000 RSB-75 Ammunition",
                    "200 EMP-1s",
                    "Damage and Honor Boosters for 10 hours"
                ],
                "high" => [
                    "1 month of Premium",
                    "2 LF-4 Lasers",
                    "1 Havoc drone design",
                    "200 extra energy",
                    "10 booty keys",
                    "10000 RSB-75 Ammunition",
                    "200 EMP-1s",
                    "Damage, Shield, and Honor Boosters for 10 hours"
                ]
            ]
        ];

        return json_encode($json);
    }

    /**
     * Returns the dailyBonus object as json.
     *
     * @return string dailyBonus object as json.
     */
    private function _buildDailyBonus() : string
    {
        $json = [
            [
                "10,000 Credits",
                "50 PLT-2026 rockets",
                "1 extra energy"
            ],
            [
                "300 MCB-25 ammo",
                "25,000 Credits",
                "1 extra energy"
            ],
            [
                "50 PLT-2021 rockets",
                "1 jump Credit",
                "1 extra energy"
            ],
            [
                "250 MCB-50 ammo",
                "1 repair credit",
                "1 extra energy"
            ],
            [
                "1 log-disk",
                "200 Uridium",
                "1 extra energy"
            ],
        ];

        return json_encode($json);
    }
}
