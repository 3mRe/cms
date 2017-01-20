<?php
namespace Application\Module\Presenter;

use Alexya\Foundation\Presenter;

/**
 * Payment module presenter.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class Payment extends Presenter
{
    /**
     * Renders and returns the page.
     *
     * @return string Page content.
     */
    public function render() : string
    {
        return $this->_triad->View->render();
    }
}
