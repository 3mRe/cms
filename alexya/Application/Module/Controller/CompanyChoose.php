<?php
namespace Application\Module\Controller;

use Alexya\Foundation\Controller;
use Alexya\Http\Response;

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
     * @return Response Response object.
     */
    public function index() : Response
    {
        $response = new Response([
            "Content-Type" => "text/html"
        ], $this->_triad->Presenter->render());

        return $response;
    }
}
