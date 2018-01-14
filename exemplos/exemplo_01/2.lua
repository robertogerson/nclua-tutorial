function handler (evt)
	event.post {
		class  = 'ncl',
		type   = 'presentation',
		action = 'stop',
		label  = ''
	}
end

event.register(handler)

