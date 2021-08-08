fx_version 'cerulean'

game 'gta5'

version '1.0.0'

description 'Custom hud created for vola'

lua54 'yes'

client_script 'client/hud_cl.lua'

server_scripts {
	"@vrp/lib/utils.lua",
	'server/hud_sv.lua'
}

ui_page 'html/ui.html'

files {
	'html/ui.html',
	'html/css/style.css',
	'html/img/*.png',
	'html/js/script.js',
}