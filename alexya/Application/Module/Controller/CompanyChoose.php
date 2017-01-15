<?php
namespace Application\Module\Controller;

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
}
