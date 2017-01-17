<?php
namespace Application\Module\Controller;

use Alexya\Foundation\Controller;

/**
 * Start module controller.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class Start extends Controller
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
