<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Local config overrides & db credentials
 *
 * Our database credentials and any environment-specific overrides
 * This file should be specific to each developer and not tracked in Git
 *
 * @package    Focus Lab Master Config
 * @version    1.1.1
 * @author     Focus Lab, LLC <dev@focuslabllc.com>
 */

$env_db['hostname'] = 'localhost';
$env_db['username'] = '';
$env_db['password'] = '';
$env_db['database'] = '';

/**
 * Remote db - typically a shared development database
 *
 * Putting this below the local settings allows us to easily uncomment the
 * lines to connect to a secondary connection, overriding the first settings
 */
/*
$env_db['hostname'] = '';
$env_db['username'] = '';
$env_db['password'] = '';
$env_db['database'] = '';
*/


/* End of file config.local.php */
/* Location: ./config/config.local.php */