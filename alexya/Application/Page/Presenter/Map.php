<?php
namespace Application\Page\Presenter;

use \Alexya\Container;
use \Alexya\Foundation\Presenter;
use \Alexya\Database\ORM\Model;

/**
 * Map page presenter.
 *
 * Sets the variables for rendering the map page view.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class Map extends Presenter
{
    /**
     * Sets View's variables.
     */
    public function onInstance()
    {
        $id = (Container::Account()->Settings->clientResolution ?? 0);

        $resolutions = [
            [820, 600],
            [1024, 567],
            [1024, 720],
            [1280, 720],
            [1280, 900]
        ];

        $this->width            = $resolutions[$id][0];
        $this->height           = $resolutions[$id][1];
        $this->resolutionID     = $id;
        $this->autoStartEnabled = (Container::Account()->Settings->autoStart ?? 0);
    }
}
