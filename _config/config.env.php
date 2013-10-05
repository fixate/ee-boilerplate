<?php

/**
 * Environment Declaration
 *
 * This switch statement sets our environment. The environment is used primarily
 * in our custom config file setup. It is also used, however, in the front-end
 * index.php file and the back-end admin.php file to set the debug mode
 *
 * @package    Focus Lab Master Config
 * @version    1.1.1
 * @author     Focus Lab, LLC <dev@focuslabllc.com>
 */

if ( ! defined('ENV'))
{
	switch ($_SERVER['HTTP_HOST']) {
		// Make sure you have domain.com AND www.domain.com connecting to the production database.
		case '[domain.com]' :
			define('ENV', 'prod');
			define('ENV_FULL', 'Production');
			define('ENV_DEBUG', FALSE);
		break;

		case '[www.domain.com]' :
			define('ENV', 'prod');
			define('ENV_FULL', 'Production');
			define('ENV_DEBUG', FALSE);
		break;

		case '[test.domain.com]' :
			define('ENV', 'dev');
			define('ENV_FULL', 'Development');
			define('ENV_DEBUG', TRUE);
		break;

		default :
			define('ENV', 'local');
			define('ENV_FULL', 'Local');
			define('ENV_DEBUG', TRUE);
		break;
	}
}

/* End of file config.env.php */
/* Location: ./config/config.env.php */
