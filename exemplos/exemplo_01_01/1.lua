local send_evt = {
  class = 'ncl',
  type = 'presentation'
}

function handler (evt)
  if evt.class == 'ncl' and
    evt.type == 'presentation' then
    print (evt.class, evt.type, evt.action, evt.label)

    print (evt.action, evt.action == "stop", evt.label, evt.label == "a1")

    -- when start lambda start a1 them stop a1
    if evt.action == 'start' and evt.label == '' then
      send_evt.label  = 'a1'

      send_evt.action = 'start'
      event.post (send_evt)
      
      send_evt.action = 'stop'
      event.post (send_evt)

    -- when a1 finishes start a2 then wait 1s and stop a2 and start a3
    elseif evt.action == 'stop' and evt.label == 'a1' then
      send_evt.label  = 'a2'

      send_evt.action = 'start' 
      event.post (send_evt)

      send_evt.action = 'stop'
      event.timer (1000,
        function ()
          event.post (send_evt)
          send_evt.label = 'a3'
          send_evt.action = 'start'
          event.post (send_evt)
        end
      )
    -- when start a3 wait 1s then stop a3 and lambda
    elseif evt.action == 'start' and evt.label == 'a3' then
      send_evt.label = 'a3'
      send_evt.action = 'stop'

      event.timer (1000,
        function ()
          event.post (send_evt)
          send_evt.label = ''
          event.post (send_evt)
        end )
    end
  end
end

event.register(handler)

