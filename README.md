# ExpressionEngine Boilerplate

This is a boilerplate for ExpressionEngine projects. It is largely based on the work done by @aaronbushnell. More information on the structure can be found [here](http://blog.aaronmbushnell.com/post/39040725384/how-we-use-expressionengine-git-and-ruby-gems-in-our)

## Features

- supports multiple environments via custom configs
- includes a [Grunt](http://github.com/grunt) config for automating tasks (CSS, JS, optimisation, shell tasks)
- third party addons are easier maintain outside of ExpressionEngine
- [H5BP](http://h5bp.com) .htacess

## Usage

- add this repo to the root of your EE installation
- move the contents of /!root to the root of your EE installation
- update `system/expressionengine/config/config.php` and `system/expressionengine/config/database.php` as per [config.master.php]( _config/config.master.php#L19 )
- update the config files at `_config/` as you require

### Licence

MIT: http://fixate.mit-license.org/
