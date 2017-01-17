<?php
namespace Application\Module\Presenter;

use Alexya\Foundation\Presenter;

/**
 * Dock module presenter.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class Dock extends Presenter
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
