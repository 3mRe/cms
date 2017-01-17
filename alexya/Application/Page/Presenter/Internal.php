<?php
namespace Application\Page\Presenter;

use Alexya\Foundation\Presenter;

/**
 * Internal page presenter.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class Internal extends Presenter
{
    /**
     * Renders and returns the page.
     *
     * @return string Page content.
     */
    public function render() : string
    {
        $name = ($this->_request->uri()[2] ?? "");

        if($name == "CompanyChoose") {
            return $this->_triad->children->module->Controller->render();
        }

        $this->_triad->View->set("name", $name);
        $this->_setFramesFlag($name);

        if($this->_triad->children->module->hasModel()) {
            foreach($this->_triad->Model->all() as $key => $value) {
                $this->_triad->children->module->Model->set($key, $value);
            }
        }

        // Call the render method here so it redirects now instead of when the view is being rendered.
        $this->_triad->View->set("module", $this->_triad->children->module->Controller->render());

        // TODO $this->_triad->View->set("news", Model::latest(10, "id", "news"));

        return $this->_triad->View->render();
    }

    /**
     * Sets the `hasFrames` flag.
     *
     * @param string $name Page name.
     */
    private function _setFramesFlag(string $name)
    {
        $framedPages = [
            "Dock",
            "Shop",
            "Clan",
            "Skylab",
            "PilotSheet",
            "GalaxyGates"
        ];

        $this->_triad->View->set("hasFrames", false);
        if(in_array($name, $framedPages)) {
            $this->_triad->View->set("hasFrames", true);
        }
    }
}
