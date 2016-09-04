<?php
namespace Application\Page\Controller;

use \Alexya\Foundation\{
    Controller,
    Module
};
use \Alexya\Http\{
    Response,
    Request
};

use \Exception;

/**
 * Internal page controller.
 *
 * Loads the requested module.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class Internal extends Controller
{
    /**
     * Loads and executes the requested module.
     *
     * @return string Response content
     */
    public function index() : string
    {
        $uri = $this->_triad->_request->uri();

        if(
            count($uri) < 2 ||
            empty($uri[1])
        ) {
            Response::redirect("/Internal/Start");
        }

        $body = "";
        try {
            $moduleURI = implode("/", array_slice($uri, 2));
            $module    = new Module($uri[2], new Request($moduleURI));

            $this->_triad->children->module = $module;

            $body = $this->_triad->View->render();
        } catch(Exception $e) {
            throw $e;
            //Response::redirect("/internal/Start");
        }

        return $body;
    }
}