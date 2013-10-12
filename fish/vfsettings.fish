function __vfs_site_launch --on-event virtualenv_did_activate:work.sbtc.site
    set -g _BACKUP_PYTHONPATH $PYTHONPATH
    set -gx PYTHONPATH /Users/adam/work/sbtc/site
    set -gx DJANGO_SETTINGS_MODULE sbtc.settings
end
function __vfs_site_teardown --on-event virtualenv_will_deactivate:work.sbtc.site
    set -gx PYTHONPATH $_BACKUP_PYTHONPATH
    set -e DJANGO_SETTINGS_MODULE
end
