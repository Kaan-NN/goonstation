/obj/spawner
	name = "object spawner"

/obj/spawner/bomb
	name = "bomb"
	icon = 'icons/mob/screen1.dmi'
	icon_state = "x"
	var/btype = 0  //0 = radio, 1= prox, 2=time
	var/explosive = 1	// 0= firebomb
	var/btemp = 1000	// bomb temperature (degC)
	var/active = 0

/obj/spawner/bomb/radio
	btype = 0

/obj/spawner/bomb/proximity
	btype = 1

/obj/spawner/bomb/timer
	btype = 2

/obj/spawner/bomb/timer/syndicate
	btemp = 2000

//
/obj/spawner/newbomb
	name = "bomb"
	icon = 'icons/mob/screen1.dmi'
	icon_state = "x"
	var/btype = 0 // 0=radio, 1=prox, 2=time
	var/btemp1 = 1500
	var/btemp2 = 1000	// tank temperatures

	timer
		btype = 2

		syndicate
			btemp1 = 1700
			btemp2 = 900

	proximity
		btype = 1

	radio
		btype = 0

/obj/spawner/bomb/New()
	..()

	switch (src.btype)
		// radio
		if (0)
			new /obj/item/assembly/radio_bomb(src.loc, btemp)

		// proximity
		if (1)
			var/obj/item/assembly/proximity_bomb/R = new /obj/item/assembly/proximity_bomb(src.loc, btemp)
			if(src.active)
				SEND_SIGNAL(R.trigger, COMSIG_ITEM_ASSEMBLY_ACTIVATION, R)

		// timer
		if (2)
			new /obj/item/assembly/time_bomb(src.loc, btemp)

	qdel(src)

/obj/spawner/newbomb/New()
	..()

	switch (src.btype)
		// radio
		if (0)

			var/obj/item/device/transfer_valve/V = new(src.loc)
			var/obj/item/tank/plasma/PT = new(V)
			var/obj/item/tank/oxygen/OT = new(V)

			var/obj/item/device/radio/signaler/S = new(V)

			V.tank_one = PT
			V.tank_two = OT
			V.attached_device = S

			S.master = V
			PT.master = V
			OT.master = V

			S.b_stat = 0

			PT.air_contents.temperature = btemp1 + T0C
			OT.air_contents.temperature = btemp2 + T0C

			V.UpdateIcon()

		// proximity
		if (1)

			var/obj/item/device/transfer_valve/V = new(src.loc)
			var/obj/item/tank/plasma/PT = new(V)
			var/obj/item/tank/oxygen/OT = new(V)

			var/obj/item/device/prox_sensor/P = new(V)

			V.tank_one = PT
			V.tank_two = OT
			V.attached_device = P

			P.master = V
			PT.master = V
			OT.master = V


			PT.air_contents.temperature = btemp1 + T0C
			OT.air_contents.temperature = btemp2 + T0C

			V.UpdateIcon()


		// timer
		if (2)
			var/obj/item/device/transfer_valve/V = new(src.loc)
			var/obj/item/tank/plasma/PT = new(V)
			var/obj/item/tank/oxygen/OT = new(V)

			var/obj/item/device/timer/T = new(V)

			V.tank_one = PT
			V.tank_two = OT
			V.attached_device = T

			T.master = V
			PT.master = V
			OT.master = V
			T.time = 30

			PT.air_contents.temperature = btemp1 + T0C
			OT.air_contents.temperature = btemp2 + T0C

			V.UpdateIcon()
	qdel(src)


/obj/spawner/briefcasebomb/New()
	..()

	var/obj/item/device/transfer_valve/briefcase/V = new(src.loc)
	var/obj/item/tank/plasma/PT = new(V)
	var/obj/item/tank/oxygen/OT = new(V)

	var/obj/item/device/timer/T = new(V)

	V.tank_one = PT
	V.tank_two = OT
	V.attached_device = T

	T.master = V
	PT.master = V
	OT.master = V
	T.time = 30

	PT.air_contents.temperature = 170 + T0C
	OT.air_contents.temperature = 20 + T0C

	qdel(src)

/obj/bomberman
	name = "large cartoon bomb"
	desc = "It looks like it's gonna blow."
	icon = 'icons/obj/items/weapons.dmi'
	icon_state = "dumb_bomb"
	density = 1
	var/exploding = 0

	New()
		..()
		if(!isturf(src.loc))
			dispose()
			return
		SPAWN(2 SECONDS)
			explode()

	Bumped(atom/A)
		if(ismob(A))
			walk(src, get_dir(A, src), 1)

	bump(atom/O)
		walk(src, 0)

	ex_act(severity)
		if(exploding)
			return
		explode()

	proc/explode()
		exploding = 1

		if(!isturf(src.loc))
			dispose()
			return
		src.icon = null
		src.anchored = ANCHORED
		src.set_density(0)
		var/list/atom/movable/overlay/boom = list()
		var/list/atom/movable/overlay/boom_tips = list()
		var/list/obj/affected_objs = list()
		var/list/mob/affected_mobs = list()
		var/atom/movable/overlay/animation = new /atom/movable/overlay( src.loc )
		animation.icon_state = "nothing"
		animation.icon = 'icons/effects/effects.dmi'
		for(var/turf/T in oview(3, src))
			if((T.x != src.x && T.y != src.y) || T.density)
				continue
			var/dist = GET_DIST(src.loc, T)
			var/rel_dir = get_dir(src.loc, T)
			if(dist <= 3)
				for(var/atom/A in T)
					if(isliving(A))
						affected_mobs.Add(A)
					if(istype(A, /obj/window) || istype(A, /obj/mesh/grille))
						affected_objs.Add(A)
					if(istype(A, /obj/blob))
						affected_objs.Add(A)
					// TODO: Handle more object types?
				if(T.x == src.x && T.y == src.y)
					continue
				var/atom/movable/overlay/A = new /atom/movable/overlay( T )
				A.icon_state = "nothing"
				A.icon = 'icons/effects/effects.dmi'
				A.set_dir(rel_dir)

				if(dist == 3)
					boom_tips.Add(A)
				else
					boom.Add(A)

		FLICK("boom_center", animation)
		for(var/atom/movable/overlay/A in boom)
			FLICK("boom_segment", A)
		for(var/atom/movable/overlay/A in boom_tips)
			FLICK("boom_tip", A)
		for(var/mob/M in affected_mobs)
			M.ex_act(3)
		for(var/obj/O in affected_objs)
			// drsingh for Cannot execute null.ex act()
			if (!isnull(O)) O.ex_act(rand(1,2))
		playsound(src.loc, "explosion", 100, 1)
		playsound(src.loc, 'sound/effects/explosionfar.ogg', 100, 1, 14)
		SPAWN(1 SECOND)
			animation.dispose()
			for(var/atom/movable/overlay/A in (boom + boom_tips))
				A.dispose()
			src.dispose()



/obj/spawner/mail
	name = "mail spawner"
	icon = 'icons/obj/items/items.dmi'
	icon_state = "mail-1"
	var/amount_to_make = 1

	New()
		..()
		create_random_mail(src.loc, src.amount_to_make)
		qdel(src)

	two
		name = "mail spawner (x2)"
		amount_to_make = 2
	five
		name = "mail spawner (x5)"
		amount_to_make = 5
	ten
		name = "mail spawner (x10)"
		amount_to_make = 10
	fifty
		name = "mail spawner (x50)"
		amount_to_make = 50
