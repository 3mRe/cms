<?php
namespace Application\Module\Presenter;

use Alexya\Foundation\Presenter;

/**
 * GalaxyGates module presenter.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class GalaxyGates extends Presenter
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
