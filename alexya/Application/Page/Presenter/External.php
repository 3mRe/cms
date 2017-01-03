<?php
namespace Application\Page\Presenter;

use Alexya\Foundation\Presenter;

/**
 * External page presenter.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class External extends Presenter
{
    /**
     * Renders the page.
     *
     * @return string Page content.
     */
    public function render() : string
    {
        // TODO

        return $this->_triad->View->render();
    }
}
