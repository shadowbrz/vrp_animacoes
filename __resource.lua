description "vrp_animacoes"

dependency "vrp"

client_script {
    '@vrp/lib/utils.lua',
    'client.lua',
}

server_script {
    '@vrp/lib/utils.lua',
    'server.lua',
}