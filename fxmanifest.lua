fx_version "adamant"

game "gta5"

client_script "client.lua"
client_script "config.lua"

server_script "server.lua"
server_script "config.lua"

ui_page {
	'html/ui.html'
}

files {
    "html/ui.html",
    "html/style.css",
    "html/app.js",
    "html/engine.png",
}