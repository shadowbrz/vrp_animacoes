-- Créditos: Shadow --
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPserver = Tunnel.getInterface("vRP")

-- upper: se for true: apenas parte superior do corpo, false: animação completa
-- seq: lista de animações como {dict, anim_name, loops} (loops é o número de loops, default 1) ou uma tarefa def (properties: task, play_exit)
-- looping: se for true, irá repetir infinitamente o primeiro elemento da sequência até que stopAnim seja chamado
local animacoes = {
    ["Fumar"] = {false, {task="WORLD_HUMAN_SMOKING"}, false},
    ["Flex"] = {false, {task="WORLD_HUMAN_MUSCLE_FLEX"}, false},
    ["Rock"] = {false, {{"mp_player_introck","mp_player_int_rock",1}}, false},
}

-- Functions
function mostrarAnimacoes()
    local index = 0
    local mostrar = "^7"

    for k, v in pairs(animacoes) do
        index = index + 1
        if index == 1 then
            mostrar = mostrar..k
        else
            mostrar = mostrar..", "..k
        end
    end

    TriggerEvent("chatMessage", "Animacoes-vRP", {255,0,0}, mostrar)
end

function pararAnimacao()
    ClearPedTasksImmediately(GetPlayerPed(-1))
end

-- Eventos
RegisterNetEvent("Animacao:Iniciar")
AddEventHandler("Animacao:Iniciar", function(args)
    local emotes = animacoes[args]
    if emotes ~= nil then
        vRP._playAnim(emotes[1],emotes[2],emotes[3])
        TriggerEvent("chatMessage", "Animacoes-vRP", {255,0,0}, "^7Use \"^3/parar^7\" para parar todas as animações")
    else
        TriggerEvent("chatMessage", "Animacoes-vRP", {255,0,0}, "Nome da animação inválida")
    end
end)

RegisterNetEvent("Animacoes:Mostrar")
AddEventHandler("Animacoes:Mostrar", function()
    mostrarAnimacoes()
end)

RegisterNetEvent("Animacoes:Parar")
AddEventHandler("Animacoes:Parar", function()
    pararAnimacao()
end)