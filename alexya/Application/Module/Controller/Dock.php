<?php
namespace Application\Module\Controller;

use Alexya\Foundation\Controller;

/**
 * Dock module controller.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class Dock extends Controller
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
}
