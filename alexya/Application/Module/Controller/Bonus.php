<?php
namespace Application\Module\Controller;

use Alexya\Foundation\Controller;

/**
 * Bonus module controller.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class Bonus extends Controller
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
