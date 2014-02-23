## Welcome to rbenvdevtools

## Installation

Clone the repostory

The scripts rely on an environment variable RBENV_DEV_DIR. This points to a parent directory
that contains rbenv plugins directories, with the assumption that directories are named
rbenv-{pluginname}. For example:

$HOME/projects/rbenv-myplugin
$HOME/projects/rbenv-myotherplugin

$RBENV_DEV_DIR should point to $HOME/projects
