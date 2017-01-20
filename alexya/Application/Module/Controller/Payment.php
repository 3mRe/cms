<?php
namespace Application\Module\Controller;

use Alexya\Foundation\Controller;

/**
 * Payment module controller.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class Payment extends Controller
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
     * Renders the balance page.
     *
     * @return string Page content.
     */
    public function Balance() : string
    {
        $this->_triad->View->setName("Balance");

        return $this->_triad->Presenter->render();
    }

    /**
     * Renders the vouchers page.
     *
     * @return string Page content.
     */
    public function Vouchers() : string
    {
        $this->_triad->View->setName("Vouchers");

        return $this->_triad->Presenter->render();
    }
}
