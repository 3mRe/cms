<?php
namespace Application;

use Alexya\Container;
use Alexya\Tools\Str;
use Alexya\Tools\Collection;

use Httpful\Request;

/**
 * API controller.
 *
 * Performs requests to the API server and returns the response.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class API
{
    /**
     * API server host.
     *
     * @var string
     */
    private $_host = "localhost";

    /**
     * Constructor.
     *
     * @param string  $host     Host of the API server.
     * @param Request $template Request template,
     */
    public function __construct(string $host, Request $template)
    {
        $this->_host = $host;
        Request::ini($template);
    }

    /**
     * Executes a POST request.
     *
     * @param string $command Command to execute.
     * @param array  $params  Params to send.
     *
     * @return mixed Parsed response.
     */
    public function post(string $command, array $params = [])
    {
        if(Container::Settings()->get("application.api.debug")) {
            return $this->_debug($command, $params);
        }

        $request = Request::post($this->_getUrl($command));

        return $this->_finishAndSendRequest($request, $params);
    }

    /**
     * Executes a GET request.
     *
     * @param string $command Command to execute.
     * @param array  $params  Params to send.
     *
     * @return mixed Parsed response.
     */
    public function get(string $command, array $params = [])
    {
        if(Container::Settings()->get("application.api.debug")) {
            return $this->_debug($command, $params);
        }

        $request = Request::get($this->_getUrl($command) ."?". http_build_query($params));

        return $this->_finishAndSendRequest($request, $params);
    }

    /**
     * Returns command URL.
     *
     * @param string $command API command.
     *
     * @return string Command URL.
     */
    private function _getUrl(string $command) : string
    {
        $url = Str::trailing($this->_host, "/") . $command;

        if(Str::endsWith($url, "/")) {
            $url = substr($url, -1);
        }

        if(!Str::startsWith($this->_host, "http://")) {
            $url = "http://". $url;
        }

        return $url;
    }

    /**
     * Adds request body and sends it.
     *
     * @param Request $request Request to finish.
     * @param array   $params  Parameters to send.
     *
     * @return mixed Parsed response.
     */
    private function _finishAndSendRequest(Request $request, array $params)
    {
        $response = $request->body(http_build_query($request))
                            ->send();

        Container::Logger()->debug("Request executed!");
        Container::Logger()->debug("Request: ". $request->uri);
        Container::Logger()->debug("Response: ". $response->raw_body);

        return $response->body;
    }

    /**
     * Mocks the API response.
     *
     * @param string $command API command.
     * @param array  $params  Request params.
     *
     * @return Collection Mocked response.
     */
    private function _debug(string $command, array $params) : Collection
    {
        $mocks = Container::Settings()->get("application.api.mocks");

        $ret = null;
        foreach($mocks as $key => $value) {
            if($key != $command) {
                continue;
            }

            if(!is_callable($value)) {
                $ret = $value;

                continue;
            }

            $ret = $value(... array_values($params));
        }

        if($ret == null) {
            Container::Logger()->debug("Couldn't mock API response for `{$command}`!");

            return new Collection();
        }

        if(!is_array($ret)) {
            $ret = json_decode($ret, true);
        }

        return new Collection($ret);
    }
}
