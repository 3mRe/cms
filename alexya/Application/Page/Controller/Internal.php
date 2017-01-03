<?php
namespace Application\Page\Controller;

use \Alexya\Container;
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
     * @return Response Response object
     */
    public function index() : Response
    {
        $uri = $this->_request->uri();

        if(
            count($uri) < 2 ||
            empty($uri[1])
        ) {
            Response::redirect("/Internal/Start");
        }

        $body = "";
        try {
            $moduleURI = implode("/", array_slice($uri, 2));
            $module    = new Module($uri[2], new Request(
                $moduleURI,
                ($_GET ?? []),
                ($_POST ?? []),
                ($_COOKIES ?? []),
                ($_FILES ?? []),
                ($_SERVER ?? [])
            ));

            $this->_triad->children->module = $module;

            $body = $this->_triad->Presenter->render();
        } catch(Exception $e) {
            if(!Container::Settings()->get("application.debug")) {
                Response::redirect("/Internal/Start");
            }

            throw $e;
        }

        return new Response([
            "Content-Type" => "text/html"
        ], $body);
    }
}
