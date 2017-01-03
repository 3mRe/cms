<?php
namespace Application\Page\Controller;

use Alexya\Foundation\Controller;
use Alexya\Http\Response;

/**
 * External page controller.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class External extends Controller
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

    /**
     * Registers an user.
     *
     * @param string $name     Username.
     * @param string $password Password.
     * @param string $email    Email.
     *
     * @return Response Response object.
     */
    public function register(string $name, string $password, string $email) : Response
    {
        // TODO

        return $this->index();
    }

    /**
     * Performs a login.
     *
     * @param string $name     Username.
     * @param string $password Password.
     *
     * @return Response Response object.
     */
    public function login(string $name, string $password) : Response
    {
        // TODO

        return $this->index();
    }
}
