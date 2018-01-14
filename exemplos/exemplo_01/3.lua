function handler (evt)
	event.timer(3000, function()
		event.post {
			class  = 'ncl',
			type   = 'presentation',
			action = 'stop',
			label  = ''
		}
	end)
end

event.register(handler)

