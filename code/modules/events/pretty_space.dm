#ifndef UNDERWATER_MAP
/datum/random_event/major/pretty_space
	name = "Space Colors"
	customization_available = 1
	required_elapsed_round_time = 0 MINUTES

	is_event_available(ignore_time_lock)
		. = ..()
		if(.)
			if (global.is_map_on_ground_terrain)
				. = FALSE

	admin_call(var/source)
		if (..())
			return

		var/color = usr.client?.input_data(list(DATA_INPUT_JSON), "Enter color matrix", null, null)?.output
		var/duration = usr.client?.input_data(list(DATA_INPUT_NUM), "Enter duration (in seconds)", null, null)?.output * 1 SECOND
		src.event_effect(source, duration, color)
		return

	event_effect(var/source, duration = null, list/color = null)
		..()
		if(!islist(color))
			color = list()
			for(var/i in 1 to 9)
				color.Add(0.15 + rand())
			for(var/i in 1 to 3)
				color.Add(rand()/10)
		if(!duration)
			duration = 30 SECONDS + rand() * 3 MINUTES

		command_alert("Navigational radar indicates that the [station_or_ship()] will shortly begin drifting through a molecular cloud. This poses no danger to structural integrity or personnel, so enjoy the view.", "Navigational Update", alert_origin = ALERT_WEATHER)
		RECOLOUR_PARALLAX_RENDER_SOURCES_IN_GROUP(Z_LEVEL_STATION, color, 10 SECONDS)

		SPAWN(duration)
			RECOLOUR_PARALLAX_RENDER_SOURCES_IN_GROUP(Z_LEVEL_STATION, list(), 10 SECONDS)
#endif
