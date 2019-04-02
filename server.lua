-- Créditos: Shadow --
AddEventHandler('chatMessage', function(source, n, msg)
    local args = stringsplit(msg, ' ')
        
    if string.lower(args[1]) == "/animacoes" then
        TriggerClientEvent("Animacoes:Mostrar", source)
        TriggerClientEvent("chatMessage", source, "Animacoes-vRP", {255,0,0}, "^7Exemplo: \"^3/animacao Rock^7\"")
        CancelEvent()
    elseif string.lower(args[1]) == "/animacao" then
        if args[2] ~= nil then
            TriggerClientEvent("Animacao:Iniciar", source, args[2])
        else
            TriggerClientEvent("chatMessage", source, "Animacoes-vRP", {255,0,0}, "^7Use \"^3/animacoes^7\" para exibir todas animações")
        end
        CancelEvent()
    elseif string.lower(args[1]) == "/parar" then
        TriggerClientEvent("Animacoes:Parar", source)
        CancelEvent()
    end	
end)

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end