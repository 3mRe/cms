<?php
namespace Application\Module\Controller;

use Alexya\Container;
use Alexya\Foundation\Controller;

/**
 * CompanyChoose module controller.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class CompanyChoose extends Controller
{
    /**
     * Renders and returns the page.
     *
     * @return string Page content.
     */
    public function index() : string
    {
        return $this->_triad->Presenter->render();
    }

    /**
     * Chooses a faction.
     *
     * @param string $id New faction id.
     *
     * @return string API response.
     */
    public function choose(string $id) : string
    {
        /**
         * API Object.
         *
         * @var \Application\API $API
         */
        $API = Container::API();

        /**
         * Account object.
         *
         * @var \Application\ORM\Account $Account
         */
        $Account = Container::Account();

        $result = [
            "result" => false
        ];

        if(
            !$Account->isLogged() ||
            !is_numeric($id)      ||
            ($id < 1 || $id > 3)
        ) {
            return json_encode($result);
        }

        $result = $API->post("accounts/{$Account->id}/chooseFaction", [
            "factions_id" => $id
        ]);

        return json_encode($result->getAll());
    }
}
