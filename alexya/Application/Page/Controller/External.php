<?php
namespace Application\Page\Controller;

use Alexya\Container;
use Alexya\Foundation\Controller;
use Alexya\Http\Response;
use Alexya\Tools\Session\Session;
use Alexya\Tools\Session\Results;
use Alexya\Validator\Validator;
use Alexya\Validator\Rulers\StringRuler;

use Application\API;

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
        return $this->_performAction("register", [
            "username" => $name,
            "password" => $password,
            "email"    => $email
        ], "/Internal/CompanyChoose");
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
        return $this->_performAction("login", [
            "username" => $name,
            "password" => $password
        ], "/Internal/Start");
    }

    /**
     * Performs the actual action.
     *
     * @param string $action   Action to perform.
     * @param array  $params   API call params.
     * @param string $redirect Page to redirect in case action was performed successfully.
     *
     * @return Response Response object.
     */
    private function _performAction(string $action, array $params, string $redirect) : Response
    {
        /**
         * API object.
         *
         * @var API $API
         */
        $API = Container::API();

        /**
         * Session object.
         *
         * @var Session $Session
         */
        $Session = Container::Session();

        $this->validate(... array_values($params));

        $result = $API->get($action, $params);

        if($result->result) {
            $Session->id = $result->session_id;

            Response::redirect($redirect);
        }

        Results::flash("externalPage_results", [$result->error]);

        return $this->index();
    }

    /**
     * Performs input validation.
     *
     * @param string $name     Username.
     * @param string $password Pasword.
     * @param string $email    Email.
     */
    public function validate(string $name, string $password, string $email = null)
    {
        $validator = $this->_getValidator($name, $password, $email);

        if($validator->validate()) {
            return;
        }

        Results::flash("externalPage_results", $validator->getErrors());

        Response::redirect("/External");
    }

    /**
     * Returns the input validator.
     *
     * @param string $name     Username.
     * @param string $password Password.
     * @param string $email    Email.
     *
     * @return \Alexya\Validator\Validator Validator object.
     */
    private function _getValidator(string $name, string $password, string $email = null) : Validator
    {
        $validator = new Validator([
            new StringRuler()
        ]);

        $validator->add("username", $name)
                  ->addRule("String::not_empty", t("Please enter your username."))
                  ->addRule("String::min_length", [4], t("This username is too short. Please choose a new username which has between 4 and 20 characters."))
                  ->addRule("String::max_length", [20], t("This username is too long. Please choose a new username which has between 4 and 20 characters."));

        $validator->add("password", $password)
                  ->addRule("String::not_empty", t("Please enter your password."))
                  ->addRule("String::min_length", [4], t("This password is too short. Please choose a new password which has between 4 and 45 characters."))
                  ->addRule("String::max_length", [45], t("This password is too long. Please choose a new password which has between 4 and 45 characters."));

        if($email == null) {
            return $validator;
        }

        $validator->add("email", $email)
                  ->addRule("String::not_empty", t("Please enter your password."))
                  ->addRule("String::is_email", t("Your e-mail address doesn't seem to be correct. Please enter a valid e-mail address."));

        return $validator;
    }
}
