<?php
namespace Application\Page\Controller;

use \Alexya\Container;
use \Alexya\Database\{
    QueryBuilder,
    ORM\Model
};
use \Alexya\Foundation\Controller;
use \Alexya\Http\Response;
use \Alexya\Tools\{
    Session\Results,
    Str
};
use \Alexya\Validator\Validator;

use \Application\ORM\Account;

/**
 * External page controller.
 *
 * Contains the logic of the external page.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class External extends Controller
{
    /**
     * Default action.
     *
     * Finds the home page and renders it.
     *
     * @return string Login page content.
     */
    public function index() : string
    {
        return $this->Login();
    }

    /**
     * Renders and returns the InvitationCode page.
     *
     * @return string Invitation code page content.
     */
    public function InvitationCode() : string
    {
        if(!Container::Settings()->get("application.invitation.enabled")) {
            Response::redirect("/External/Login");
        }

        $this->_triad->View->setName("InvitationCode");

        return $this->_triad->View->render();
    }

    /**
     * Renders and returns the Login page.
     *
     * @return string Login page content.
     */
    public function Login() : string
    {
        $this->_triad->View->setName("Login");

        return $this->_triad->View->render();
    }

    /**
     * Renders and returns the Register page.
     *
     * @return string Register page content.
     */
    public function Register() : string
    {
        $this->_triad->View->setName("Register");

        return $this->_triad->View->render();
    }

    /**
     * Performs the validation of an invitation code.
     *
     * @param string $code Invitation code to verify.
     */
    public function verifyInvitationCode($code)
    {
        if(
            Container::Settings()->get("application.invitation.enabled") ||
            $code != Container::Settings()->get("application.invitation.code")
        ) {
            /*$query = new QueryBuilder(Container::Database());
            $query->select()
                  ->from("invitation_codes")
                  ->where([
                      "code" => $code
                  ])
                  ->execute();*/

            if(true) {
                Results::flash("code_doesnt_exist", [
                    "result"  => "success",
                    "message" => t("The invitation code does not exists!")
                ]);

                Response::redirect("/External/InvitationCode");
            }
        }

        Container::Session()->invitation = [
            "verified" => true,
            "code"     => $code
        ];
        Results::flash("code_verified", [
            "result"  => "success",
            "message" => t("The invitation code has been successfully validated!")
        ]);

        Response::redirect("/External/Login");
    }

    /**
     * Performs a login attempt.
     *
     * @param string $username Username.
     * @param string $password Password.
     *
     * @return string Response content
     */
    public function doLogin($username, $password) : string
    {
        $Database = Container::Database();
        $Session  = Container::Session();
        $Logger   = Container::Logger();

        $session_id = Str::random(32, "0123456789abcdef");

        if(!$this->_checkInfo($username, $password)) {
            return $this->Login();
        }

        //$username = Security::cleanXSS($username);
        $password = md5($password); //Security::hash($password);

        $exists = Model::find([
            "AND" => [
                "name"     => $username,
                "password" => $password
            ]
        ], -1, "users", false);

        if(!is_numeric($exists->id)) {
            Results::addFlash("invalid_username_password", [
                "result"  => "danger",
                "message" => t("Username/password does not exists")
            ]);

            return $this->Login();
        }

        $account = Account::find($exists->last_login_accounts_id);
        $account->session_id = $session_id;
        $account->save();

        $Session->id = $session_id;

        Response::redirect("/Internal/Start");
    }

    /**
     * Performs a register attempt.
     *
     * @param string $username Username.
     * @param string $password Password.
     * @param string $email    Email.
     * @param string $tac      Terms and Conditions.
     *
     * @return string Response content.
     */
    public function doRegister(string $username, string $password, string $email, string $tac = "1") : String
    {
        $Session  = Container::Session();
        $Database = Container::Database();

        $session_id = Str::random(32, "0123456789abcdef");

        if(!$this->_checkInfo($username, $password, $email, $tac)) {
            return $this->Register();
        }

        //$username = Security::cleanXSS($username);
        $password = md5($password); //Security::hash($password);
        //$email    = Security::cleanXSS($email);

        //Check username and email is unique in db
        $email_exists = Model::find([
            "email" => $email
        ], -1, "users", false);

        if(!empty($_email_exists->id)) {
            Results::flash("email_already_exists", [
                "result"  => "danger",
                "message" => t("Given email already exists, please, login or try with another email")
            ]);

            return $this->Register();
        }

        $query = new QueryBuilder($Database);
        $sanitized = $query->sanitize($username);

        $username_exists = $Database->execute("SELECT * FROM `users` LEFT JOIN `accounts` USING(`id`) WHERE `users`.`name`='{$sanitized}' OR `accounts`.`name`='{$sanitized}';", false);
        if(!empty($username_exists)) {
            Results::flash("username_already_exists", [
                "result"  => "danger",
                "message" => t("Given username already exists, please, login or try with another username")
            ]);

            return $this->Register();
        }

        if(!$this->_registerUser($username, $password, $email, $session_id)) {
            Results::flash("register_error", [
                "result"  => "danger",
                "message" => t("There was an error registering!")
            ]);

            return $this->Register();
        }

        //Register successful
        $Session->id = $session_id;
        Response::redirect("/Internal/CompanyChoose");
    }

    /**
     * Checks that user provided info is valid for login/registering.
     *
     * @param string $username User name.
     * @param string $password Password.
     * @param string $email    Email.
     * @param string $tac      User accepts terms and conditions.
     *
     * @return bool `true` if user can login/register, `false` if not.
     */
    private function _checkInfo($username, $password, $email = null, $tac = null) : bool
    {
        $Settings = Container::Settings();

        $validator = new Validator();

        $validator->add("username", $username)
                  ->addRule("required", t("Please, enter your username"))
                  ->addRule("min_length", $Settings->get("application.forms.username.min_length"), t("Your username can't be shorter than ". $Settings->get("application.forms.username.min_length") ." chars"))
                  ->addRule("max_length", $Settings->get("application.forms.username.max_length"), t("Your username can't be longer than ". $Settings->get("application.forms.username.max_length") ." chars"))
                  ->addRule("not_contains_chars", $Settings->get("application.forms.username.not_allowed_chars"), t("Your username can't contain special chars"));

        $validator->add("password", $password)
                  ->addRule("required", t("Please, enter your password"))
                  ->addRule("min_length", $Settings->get("application.forms.password.min_length"), t("Your password can't be shorter than ". $Settings->get("application.forms.password.min_length") ." chars"))
                  ->addRule("max_length", $Settings->get("application.forms.password.max_length"), t("Your password can't be longer than ". $Settings->get("application.forms.password.max_length") ." chars"))
                  ->addRule("not_contains_chars", $Settings->get("application.forms.password.not_allowed_chars"), t("Your password can't contain special chars"));

        /*if($email != null) {
            $validator->add("email", $email)
                      ->addRule("required", t("Please, enter your email"))
                      ->addRule("is_email", t("Please, enter a valid email"));
        }

        if($tac != null) {
            $validator->add("tac", $email)
                      ->addRule("as_boolean", t("Please, accept the Terms and Conditions"));
        }*/

        if($validator->validate()) {
            return true;
        }

        foreach($validator->getErrors() as $error) {
            Results::flash("validator_error", [
                "result"  => "danger",
                "message" => $error
            ]);
        }

        return false;
    }

    /**
     * Registers a new user in the database.
     *
     * @param string $username   User name.
     * @param string $password   Password.
     * @param string $email      Email.
     * @param string $session_id Session ID.
     *
     * @return bool Whether the register succeeded or not.
     */
    private function _registerUser(string $username, string $password, string $email, string $session_id) : bool
    {
        $Database = Container::Database();
        $Logger   = Container::Logger();
        $Settings = Container::Settings();
        $query    = new QueryBuilder($Database);

        // First insert `users` row
        $user = Model::create("users");
        $user->register_ip   = IP;
        $user->last_login_ip = IP;
        $user->session_id    = Str::random(32, "0123456789abcdef");
        $user->name          = $username;
        $user->password      = $password;
        $user->email         = $email;
        $user->save();

        if(!is_numeric($user->id)) {
            $Logger->debug("Couldn't insert `users`: ". $Database->getError());
            $Logger->debug("Query executed: ". $Database->lastQuery);

            return false;
        }

        // Now insert `accounts` row
        $account = Model::create("accounts");
        $account->users_id          = $user->id;
        $account->register_ip       = IP;
        $account->register_users_id = $user->id;
        $account->session_id        = $session_id;
        $account->name              = $username;
        $account->uridium           = $Settings->get("application.register.uridium");
        $account->credits           = $Settings->get("application.register.credits");
        $account->experience        = $Settings->get("application.register.experience");
        $account->levels_id         = $Settings->get("application.register.level");
        $account->honor             = $Settings->get("application.register.honor");
        $account->jackpot           = $Settings->get("application.register.jackpot");
        $account->ranks_id          = $Settings->get("application.register.rank");
        $account->is_premium        = $Settings->get("application.register.premium");
        $account->save();

        if(!is_numeric($account->id)) {
            $Logger->debug("Couldn't insert `accounts`: ". $Database->getError());
            $Logger->debug("Query executed: ". $Database->lastQuery);

            return false;
        }

        // Update `users` row and set account's ID
        $user->register_accounts_id   = $account->id;
        $user->last_login_accounts_id = $account->id;
        $user->save();

        // Turn for Equipment
        // First thing is the hangar
        // Once hangar is done we will give the user a ship
        // Next thing are items
        // Finally the configurations

        $hangar = Model::create("accounts_equipment_hangars");
        $hangar->accounts_id = $account->id;
        $hangar->resources   = json_encode($Settings->get("application.register.resources"));
        $hangar->save();

        if(!is_numeric($hangar->id)) {
            $Logger->debug("Couldn't insert `accounts_equipment_hangars`: ". $Database->getError());
            $Logger->debug("Query executed: ". $Database->lastQuery);

            return false;
        }

        $ship = Model::create("accounts_equipment_ships");
        $ship->accounts_id      = $account->id;
        $ship->ships_id         = $Settings->get("application.register.ship.id");
        $ship->ships_designs_id = $Settings->get("application.register.ship.designs_id");
        $ship->gfx              = $Settings->get("application.register.ship.gfx");
        $ship->maps_id          = $Settings->get("application.register.ship.maps_id");
        $ship->position         = json_encode($Settings->get("application.register.ship.position"));
        $ship->health           = $Settings->get("application.register.ship.health");
        $ship->nanohull         = $Settings->get("application.register.ship.nanohull");
        $ship->shield           = $Settings->get("application.register.ship.shield");
        $ship->save();

        if(!is_numeric($ship->id)) {
            $Logger->debug("Couldn't insert `accounts_equipment_ships`: ". $Database->getError());
            $Logger->debug("Query executed: ". $Database->lastQuery);

            return false;
        }

        // Update `accounts` row and set hangar's ID
        $account->accounts_equipment_hangars_id = $hangar->id;
        $account->save();

        // Update `accounts_equipment_hangars` row and set ship's ID
        $hangar->accounts_equipment_ships_id = $ship->id;
        $hangar->save();

        $insert_items = [];
        foreach($Settings->get("application.register.items") as $key => $item) {
            if(!is_array($item)) {
                $key  = $item;
                $item = [];
            }
            $item["items_id"]  = ($item["items_id"] ?? $key);
            $item["levels_id"] = ($item["levels_id"] ?? 1);
            $item["amount"]    = ($item["amount"] ?? 0);

            $i = Model::create("accounts_equipment_items");
            $i->items_id  = $item["items_id"];
            $i->levels_id = $item["levels_id"];
            $i->amount    = $item["amount"];
            $i->save();

            if(!is_numeric($i->id)) {
                $Logger->debug("Couldn't insert `accounts_equipment_items`: ". $Database->getError());
                $Logger->debug("Query executed: ". $Database->lastQuery);
                // There's no need to make registration unsuccessfull just because we couldn't add 1 item
            }

            $insert_items[] = $i->id;
        }

        // Lets move the configuration queries to the configuration file so it's easier to edit in the future
        $Settings->get("application.register.configurations")($insert_items, $ship->id);

        // Turn for the galaxy gates
        for($i = 0; $i < count($Settings->get("application.register.galaxygates")); $i++) {
            $gg = $Settings->get("application.register.galaxygates")[$i];

            $gate = Model::create("accounts_galaxygates");
            $gate->galaxygates_id = $gg["id"];
            $gate->accounts_id    = $account->id;
            $gate->parts          = $gg["parts"];
            $gate->lives          = $gg["lives"];
            $gate->amount         = $gg["amount"];
            $gate->save();

            if(!is_numeric($gate->id)) {
                $Logger->debug("Couldn't insert `accounts_galaxygate`: ". $Database->getError());
                $Logger->debug("Query executed: ". $Database->lastQuery);
                // There's no need to make registration unsuccessfull just because we couldn't add 1 galaxygate
            }
        }

        // Settings
        $settings = Model::create("accounts_settings");
        $settings->accounts_id = $account->id;
        $settings->save();

        if(!is_numeric($settings->id)) {
            $Logger->debug("Couldn't insert `accounts_settings`: ". $Database->getError());
            $Logger->debug("Query executed: ". $Database->lastQuery);
        }

        // Now time for the less important things: The profile and the welcome message
        $profile = Model::create("accounts_profiles");
        $profile->accounts_id = $account->id;
        $profile->avatar      = $Settings->get("application.register.avatar");
        $profile->status      = $Settings->get("application.register.status");
        $profile->save();

        if(!is_numeric($profile->id)) {
            $Logger->debug("Couldn't insert `accounts_profiles`: ". $Database->getError());
            $Logger->debug("Query executed: ". $Database->lastQuery);
        }

        foreach($Settings->get("application.register.messages") as $m) {
            $message = Model::create("accounts_messages");
            $message->from_accounts_id = $m["author_id"];
            $message->from_status      = $m["author_status"];
            $message->to_accounts_id   = $account->id;
            $message->to_status        = $m["status"];
            $message->title            = $m["title"];
            $message->text             = $m["text"];
            $message->save();

            if(!is_numeric($message->id)) {
                $Logger->debug("Couldn't insert `accounts_messages`: ". $Database->getError());
                $Logger->debug("Query executed: ". $Database->lastQuery);
            }
        }

        return true;
    }
}
