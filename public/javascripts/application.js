function ibento_modify_event_gotogeneral() {
    if ($('geo_map_edit').hasClassName('collapsed')) {
    } else {
        $('geo_map_edit').addClassName('collapsed');
        $('event_edit').removeClassName('collapsed');
    }
}
function ibento_modify_event_gotomap() {
    if ($('event_edit').hasClassName('collapsed')) {
    } else {
        $('event_edit').addClassName('collapsed');
        $('geo_map_edit').removeClassName('collapsed');
    }
}

function ibento_modify_event_selectgoto(tab_name) {
    if (tab_name == 'general') {
        ibento_modify_event_gotogeneral();
    }
    else if (tab_name == 'map') {
        ibento_modify_event_gotomap();
    }
}