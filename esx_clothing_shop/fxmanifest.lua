fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Jube'
description 'ESX Clothing Shop with modern glass UI and ox_inventory compatibility'
version '1.0.0'

ui_page 'html/index.html'

shared_scripts {
    'config.lua'
}

client_scripts {
    'client/main.lua'
}

server_scripts {
    'server/main.lua'
}

files {
    'html/index.html',
    'html/style.css',
    'html/script.js'
}

dependency 'es_extended'
