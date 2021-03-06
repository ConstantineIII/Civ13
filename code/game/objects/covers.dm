/obj/covers

	name = "floor covers"
	desc = ""
	icon = 'icons/turf/floors.dmi'
	icon_state = "wood_ship"
	var/base_icon_state = "wood_ship"
	var/passable = TRUE
	var/origin_covered = FALSE
	var/origin_water_level = 0
	var/not_movable = FALSE //if it can be removed by wrenches
	var/health = 100
	is_cover = TRUE
	anchored = TRUE
	opacity = FALSE
	density = FALSE
	layer = 2.1
	level = 2
	var/amount = FALSE
	var/wall = FALSE
	var/wood = TRUE
	var/onfire = FALSE
	flammable = TRUE
	var/current_area_type = /area/caribbean
	var/incomplete = FALSE
	explosion_resistance = TRUE
	var/list/bullethole_count = list()
	var/list/bullethole_overlays = list()
//	invisibility = 101 //starts invisible
	var/material = "Wood" //Depending on mat, depending on what harms it.
	var/adjusts = FALSE //if it adjusts acording to neighbouring sprites

	var/hardness = 50 //for projectile penetration
/*

/obj/covers/attackby(obj/item/W as obj, mob/user as mob)
	switch(material)
		if ("Wood")
			//Do nothing, anything can cut through wood.
		else if ("Stone")
			//Swords no work on stone, unga dunga no knify wifey the wall.
			if(!istype(W, /obj/item/weapon/sledgehammer) && !istype(W, /obj/item/projectile))
				user << "Your [W.name] glances off the [src.name]!"
				return
			else
				//Damage the wall.
		else if ("Metal" || "steel")
			if(!istype(W, /obj/item/weapon/sledgehammer) && !istype(W, /obj/item/projectile))
				user << "Your [W.name] glances off the [src.name]!"
				return
			else
				//Damage the wall.
		else
			//Do nothing, you're not important.
			..()*/


/obj/covers/ex_act(severity)
	switch(severity)
		if (1.0)
			Destroy(src)
			return
		if (2.0)
			health -= initial(health)/2
			return
		if (3.0)
			health -= initial(health)/10
			return
		else
	return
/obj/covers/wood
	name = "wood floor"
	icon = 'icons/turf/flooring/wood.dmi'
	icon_state = "wood"
	passable = TRUE
	amount = 1
	layer = 1.99
	material = "Wood"

/obj/covers/thatch
	name = "thatch floor"
	icon = 'icons/turf/flooring/wood.dmi'
	icon_state = "thatch1"
	passable = TRUE
	amount = 1
	layer = 1.99
	material = "Wood"

/obj/covers/thatch2
	name = "thatch floor"
	icon = 'icons/turf/flooring/wood.dmi'
	icon_state = "thatch2"
	passable = TRUE
	amount = 1
	layer = 1.99
	material = "Wood"

/obj/covers/fancywood
	name = "wood floor"
	icon = 'icons/turf/flooring/wood.dmi'
	icon_state = "fancywood"
	passable = TRUE
	amount = 1
	layer = 1.99
	material = "Wood"

/obj/covers/wood/stairs
	name = "wood stairs"
	icon = 'icons/obj/stairs.dmi'
	icon_state = "wood2_stairs"
	material = "Wood"

/obj/covers/slate
	name = "slatestone wall"
	desc = "A slate wall."
	icon = 'icons/obj/structures.dmi'
	icon_state = "slate"
	passable = TRUE
	not_movable = TRUE
	density = TRUE
	opacity = TRUE
	amount = 0
	layer = 3
	health = 500
	hardness = 100
	wood = FALSE
	wall = TRUE
	flammable = FALSE
	explosion_resistance = 10
	material = "Stone"

/obj/covers/cobblestone
	name = "cobblestone floor"
	icon = 'icons/turf/floors.dmi'
	icon_state = "cobble_vertical_dark"
	passable = TRUE
	not_movable = TRUE
	amount = 0
	wood = FALSE
	layer = 1.99
	flammable = FALSE
	explosion_resistance = 2
	material = "Stone"

/obj/covers/romanroad
	name = "roman road"
	icon = 'icons/turf/floors.dmi'
	icon_state = "roman_road"
	passable = TRUE
	not_movable = TRUE
	amount = 0
	wood = FALSE
	layer = 1.99
	flammable = FALSE
	explosion_resistance = 2
	material = "Stone"

/obj/covers/marblefloor
	name = "marble floor"
	icon = 'icons/turf/floors.dmi'
	icon_state = "marble"
	passable = TRUE
	not_movable = TRUE
	amount = 0
	wood = FALSE
	layer = 1.99
	flammable = FALSE
	explosion_resistance = 2
	material = "Stone"

/obj/covers/slatefloor
	name = "slate floor"
	icon = 'icons/turf/floors.dmi'
	icon_state = "slatefloor"
	passable = TRUE
	not_movable = TRUE
	amount = 0
	wood = FALSE
	layer = 1.99
	flammable = FALSE
	explosion_resistance = 2
	material = "Stone"

/obj/covers/sandstone/brick
	name = "sandstone brick floor"
	icon_state = "sandstone_brick"

/obj/covers/sandstone/slab
	name = "sandstone slab floor"
	icon_state = "sandstone_slab"

/obj/covers/sandstone/slab/red
	name = "red sandstone slab floor"
	icon_state = "red_sandstone_slab"

/obj/covers/sandstone/tile
	name = "sandstone tile"
	icon_state = "sandstone_tile"

/obj/covers/sandstone/tile/decorative
	name = "sandstone decorative tile"
	icon_state = "sandstone_decorative_tile"

/obj/covers/sandstone/tile/decorative/red
	name = "red sandstone decorative tile"
	icon_state = "red_sandstone_decorative_tile"

/obj/covers/roads
	name = "dirt road"
	icon = 'icons/turf/roads.dmi'
	icon_state = "d_roadvr"
	passable = TRUE
	not_movable = TRUE
	amount = 0
	wood = FALSE
	layer = 1.98
	flammable = FALSE
	explosion_resistance = 10
	material = "Stone"
	var/vertical = FALSE

/obj/covers/roads/dirt
	name = "dirt road"

/obj/covers/roads/update_icon()
	..()
	spawn(1)
		overlays.Cut()
		var/list/sideslist = list()
		for (var/direction in list(NORTH,SOUTH,EAST,WEST))
			for(var/obj/covers/roads/R in get_step(src,direction))
				sideslist += direction
				continue
		for (var/direction in list(NORTHEAST,NORTHWEST,SOUTHEAST,SOUTHWEST))
			var/turf/T = null
			switch(direction)
				if (NORTHEAST)
					T = locate(src.x+1,src.y+1,src.z)
				if (NORTHWEST)
					T = locate(src.x-1,src.y+1,src.z)
				if (SOUTHEAST)
					T = locate(src.x+1,src.y-1,src.z)
				if (SOUTHWEST)
					T = locate(src.x-1,src.y-1,src.z)
			if (T)
				for(var/obj/covers/roads/R in T)
					sideslist += direction
					continue

		if ((NORTHWEST in sideslist) && (NORTH in sideslist) && (WEST in sideslist))
			overlays += image(icon=src.icon, icon_state = "d_roadnwc")
		if ((NORTHEAST in sideslist) && (NORTH in sideslist) && (EAST in sideslist))
			overlays += image(icon=src.icon, icon_state = "d_roadnec")
		if ((SOUTHEAST in sideslist) && (SOUTH in sideslist) && (EAST in sideslist))
			overlays += image(icon=src.icon, icon_state = "d_roadsec")
		if ((SOUTHWEST in sideslist) && (SOUTH in sideslist) && (WEST in sideslist))
			overlays += image(icon=src.icon, icon_state = "d_roadswc")

		if ((WEST in sideslist) && (EAST in sideslist) && (NORTH in sideslist) && (SOUTH in sideslist))
			icon_state = "d_road+" //4 sides
			base_icon_state = icon_state
			return

		if (icon_state == "d_roadvr")
			if (WEST in sideslist)
				if (!(NORTH in sideslist))
					if (EAST in sideslist)
						icon_state = "d_roadtswe" //T, SOUTH EAST WEST
						base_icon_state = icon_state
					else
						icon_state = "d_roadsw" //Turn, SOUTH-WEST
						base_icon_state = icon_state
				else if (!(SOUTH in sideslist))
					if (EAST in sideslist)
						icon_state = "d_roadtnwe" //T, NORTH EAST WEST
						base_icon_state = icon_state
					else
						icon_state = "d_roadnw" //Turn, NORTH-WEST
						base_icon_state = icon_state
				else if ((SOUTH in sideslist) && (NORTH in sideslist))
					icon_state = "d_roadtnsw" //T, NORTH SOUTH WEST
					base_icon_state = icon_state
			else if (EAST in sideslist)
				if (!(NORTH in sideslist))
					icon_state = "d_roadse" //Turn, SOUTH-EAST
					base_icon_state = icon_state
					return
				else if (!(SOUTH in sideslist))
					icon_state = "d_roadne" //Turn, NORTH-EAST
					base_icon_state = icon_state
				else if ((SOUTH in sideslist) && (NORTH in sideslist))
					icon_state = "d_roadtnse" //T, NORTH SOUTH EAST
					base_icon_state = icon_state
		else
			if (NORTH in sideslist)
				if (!(EAST in sideslist))
					icon_state = "d_roadnw" //Turn, NORTH-WEST
					base_icon_state = icon_state
				else if (!(WEST in sideslist))
					if (SOUTH in sideslist)
						icon_state = "d_roadtnse" //T, NORTH SOUTH EAST
						base_icon_state = icon_state
					else
						icon_state = "d_roadne" //Turn, NORTH-EAST
						base_icon_state = icon_state
				else if ((WEST in sideslist) && (EAST in sideslist))
					icon_state = "d_roadtnwe" //T, NORTH EAST WEST
					base_icon_state = icon_state
			else if (SOUTH in sideslist)
				if (!(EAST in sideslist))
					icon_state = "d_roadsw" //Turn, SOUTH-WEST
					base_icon_state = icon_state
				else if (!(WEST in sideslist))
					icon_state = "d_roadse" //Turn, SOUTH-EAST
					base_icon_state = icon_state
				else if ((WEST in sideslist) && (EAST in sideslist))
					icon_state = "d_roadtswe" //T, EAST SOUTH WEST
					base_icon_state = icon_state
		if ((WEST in sideslist) && (NORTH in sideslist) && (SOUTH in sideslist))
			icon_state = "d_roadtnsw" //T, NORTH SOUTH WEST
			base_icon_state = icon_state
		if ((WEST in sideslist) && (NORTH in sideslist) && (EAST in sideslist))
			icon_state = "d_roadtnwe" //T, NORTH EAST WEST
			base_icon_state = icon_state
		if ((WEST in sideslist) && (EAST in sideslist) && (SOUTH in sideslist))
			icon_state = "d_roadtswe" //T, SOUTH EAST WEST
			base_icon_state = icon_state
		if ((EAST in sideslist) && (NORTH in sideslist) && (SOUTH in sideslist))
			icon_state = "d_roadtnse" //T, NORTH SOUTH EAST
			base_icon_state = icon_state

/obj/covers/roads/New()
	..()
	spawn(2)
		if (vertical)
			dir = 1
		else
			dir = 4
		for(var/obj/covers/roads/R in range(1,src))
			R.update_icon()
		update_icon()

/obj/covers/cobblestone/stairs
	name = "stone stairs"
	icon = 'icons/obj/stairs.dmi'
	icon_state = "rampup"
	material = "Stone"

/obj/covers/road
	name = "road"
	icon = 'icons/turf/floors.dmi'
	icon_state = "road_1"
	passable = TRUE
	not_movable = TRUE
	amount = 0
	wood = FALSE
	layer = 1.99
	flammable = FALSE
	explosion_resistance = 2
	material = "Stone"

/obj/covers/road/New()
	..()
	icon_state = pick("road_1","road_2","road_3")
	base_icon_state = icon_state

/obj/covers/steelplating
	name = "steel floor"
	icon = 'icons/turf/floors.dmi'
	icon_state = "floor"
	passable = TRUE
	not_movable = TRUE
	amount = 0
	wood = FALSE
	layer = 1.99
	flammable = FALSE
	explosion_resistance = 3
	material = "Steel"

/obj/covers/steelplating/white
	name = "white floor"
	icon_state = "white"
	material = "Steel"

/obj/covers/concretefloor
	name = "concrete floor"
	icon_state = "concrete6"
	passable = TRUE
	not_movable = TRUE
	amount = 0
	wood = FALSE
	layer = 1.99
	flammable = FALSE
	explosion_resistance = 4
	material = "Stone"

/obj/covers/concretefloor/New()
	..()
	icon_state = pick("concrete6","concrete7")
	base_icon_state = icon_state

/obj/covers/sandstone
	name = "sandstone floor"
	icon = 'icons/turf/floors.dmi'
	icon_state = "sandstone_floor"
	passable = TRUE
	not_movable = TRUE
	amount = 0
	wood = FALSE
	layer = 1.99
	flammable = FALSE
	explosion_resistance = 2
	material = "Stone"

/obj/covers/sandstone/stairs
	name = "sandstone stairs"
	icon = 'icons/obj/stairs.dmi'
	icon_state = "sandstone_stairs"
	material = "Stone"

/obj/covers/wood_ship
	name = "wood floor"
	icon_state = "wood_ship"
	passable = TRUE
	not_movable = TRUE
	amount = 1
	layer = 1.99
	material = "Wood"

//Carpets - To be Expanded upon Later

/obj/covers/carpet/
	name = "Carpet"
	desc = "Fluffy and Flammable!"
	icon = 'icons/turf/flooring/carpet.dmi'
	icon_state = "carpet"
	passable = TRUE
	not_movable = TRUE
	amount = 0
	wood = FALSE
	layer = 1.99
	flammable = TRUE

/obj/covers/carpet/pinkcarpet
	name = "Pink Carpet"
	desc = "Fluffy and Flammable!"
	icon = 'icons/turf/flooring/carpet.dmi'
	icon_state = "gaycarpet"
	passable = TRUE
	not_movable = TRUE
	amount = 0
	wood = FALSE
	layer = 1.99
	flammable = TRUE

/obj/covers/carpet/redcarpet
	name = "Red Carpet"
	desc = "Fluffy and Flammable!"
	icon = 'icons/turf/flooring/carpet.dmi'
	icon_state = "carpet"
	passable = TRUE
	not_movable = TRUE
	amount = 0
	wood = FALSE
	layer = 1.99
	flammable = TRUE

/obj/covers/carpet/orangecarpet
	name = "Orange Carpet"
	desc = "Fluffy and Flammable!"
	icon = 'icons/turf/flooring/carpet.dmi'
	icon_state = "oracarpet"
	passable = TRUE
	not_movable = TRUE
	amount = 0
	wood = FALSE
	layer = 1.99
	flammable = TRUE

/obj/covers/carpet/purplecarpet
	name = "Purple Carpet"
	desc = "Fluffy and Flammable!"
	icon = 'icons/turf/flooring/carpet.dmi'
	icon_state = "purcarpet"
	passable = TRUE
	not_movable = TRUE
	amount = 0
	wood = FALSE
	layer = 1.99
	flammable = TRUE

/obj/covers/carpet/bluecarpet
	name = "Blue Carpet"
	desc = "Fluffy and Flammable!"
	icon = 'icons/turf/flooring/carpet.dmi'
	icon_state = "blucarpet"
	passable = TRUE
	not_movable = TRUE
	amount = 0
	wood = FALSE
	layer = 1.99
	flammable = TRUE

/obj/covers/carpet/tealcarpet
	name = "Teal Carpet"
	desc = "Fluffy and Flammable!"
	icon = 'icons/turf/flooring/carpet.dmi'
	icon_state = "sblucarpet"
	passable = TRUE
	not_movable = TRUE
	amount = 0
	wood = FALSE
	layer = 1.99
	flammable = TRUE

/obj/covers/carpet/greencarpet
	name = "Green Carpet"
	desc = "Fluffy and Flammable!"
	icon = 'icons/turf/flooring/carpet.dmi'
	icon_state = "turcarpet"
	passable = TRUE
	not_movable = TRUE
	amount = 0
	wood = FALSE
	layer = 1.99
	flammable = TRUE

/obj/covers/carpet/blackcarpet
	name = "Black Carpet"
	desc = "Fluffy and Flammable!"
	icon = 'icons/turf/flooring/carpet.dmi'
	icon_state = "bcarpet"
	passable = TRUE
	not_movable = TRUE
	amount = 0
	wood = FALSE
	layer = 1.99
	flammable = TRUE

/obj/covers/carpet/whitecarpet
	name = "White Carpet"
	desc = "Fluffy and Flammable!"
	icon = 'icons/turf/flooring/carpet.dmi'
	icon_state = "wcarpet"
	passable = TRUE
	not_movable = TRUE
	amount = 0
	wood = FALSE
	layer = 1.99
	flammable = TRUE
//Continue

/obj/covers/saloon_door
	name = "saloon door"
	desc = "A wood door."
	icon = 'icons/obj/doors/material_doors.dmi'
	icon_state = "saloon"
	passable = TRUE
	not_movable = TRUE
	density = FALSE
	opacity = FALSE
	amount = 2
	layer = 3
	health = 90
	wall = FALSE
	explosion_resistance = 3
	material = "Wood"


/obj/covers/saloon_door/Crossed(mob/living/carbon/M as mob )
	if (ismob(M) && !isghost(M) && M.mob_size >= MOB_MEDIUM)
		visible_message("[M] pushes \the [src].","You push \the [src]")
		icon_state = "saloon_opening"
		update_icon()
		spawn(20)
			icon_state = "saloon"
			update_icon()

/obj/covers/wood_wall
	name = "soft wood wall"
	desc = "A wood wall."
	icon = 'icons/turf/walls.dmi'
	icon_state = "b_wood_wall"
	passable = TRUE
	not_movable = TRUE
	density = TRUE
	opacity = TRUE
	amount = 4
	layer = 3
	health = 150
	wall = TRUE
	explosion_resistance = 5
	material = "Wood"
	hardness = 75

/obj/covers/wood_wall/adjustable
	icon_state = "new_wood0"
	base_icon_state = "new_wood"
	adjusts = TRUE

/obj/covers/wood_wall/medieval
	name = "medieval wall"
	desc = "A dark-ages wall."
	icon = 'icons/turf/walls.dmi'
	icon_state = "medieval_wall"
	health = 180

/obj/covers/wood_wall/medieval/x
	name = "medieval wall crossbeam"
	desc = "A dark-ages wall with an x shaped support."
	icon = 'icons/turf/walls.dmi'
	icon_state = "medieval_wall_x"
	health = 185

/obj/covers/wood_wall/medieval/y/r
	name = "medieval wall crossbeam"
	desc = "A dark-ages wall with an slanted support."
	icon = 'icons/turf/walls.dmi'
	icon_state = "medieval_wall_y1"
	health = 185

/obj/covers/wood_wall/medieval/y/l
	name = "medieval wall crossbeam"
	desc = "A dark-ages wall with an slanted support."
	icon = 'icons/turf/walls.dmi'
	icon_state = "medieval_wall_y2"
	health = 185

/obj/covers/wood_wall/shoji
	name = "shoji wall"
	desc = "A shoji paper wall."
	icon = 'icons/turf/walls.dmi'
	icon_state = "shoji_wall2"
	passable = TRUE
	not_movable = TRUE
	density = TRUE
	opacity = TRUE
	amount = 3
	layer = 3
	health = 70
	wall = TRUE
	explosion_resistance = 1
	material = "Wood"
	hardness = 30

/obj/covers/wood_wall/shoji_divider
	name = "shoji dividing wall"
	desc = "A shoji paper wall. This one is more meant to divide rooms."
	icon = 'icons/turf/walls.dmi'
	icon_state = "shoji_wall"
	passable = TRUE
	not_movable = TRUE
	density = TRUE
	opacity = TRUE
	amount = 3
	layer = 3
	health = 50
	wall = TRUE
	explosion_resistance = 1
	material = "Wood"
	hardness = 20

/obj/covers/wood_wall/bamboo
	name = "bamboo wall"
	desc = "A wall made from bamboo."
	icon = 'icons/obj/bamboostuff.dmi'
	icon_state = "bamboo_wall"
	health = 80
	amount = 3
	layer = 3
	health = 70
	wall = TRUE
	explosion_resistance = 3
	material = "Wood"
	hardness = 40

/obj/covers/wood_wall/log
	name = "log wall"
	desc = "A log wall."
	icon = 'icons/turf/walls.dmi'
	icon_state = "log_wall"
	passable = TRUE
	not_movable = TRUE
	density = TRUE
	opacity = TRUE
	amount = 4
	layer = 3
	health = 180
	wall = TRUE
	explosion_resistance = 7
	material = "Wood"
	hardness = 80

/obj/covers/wood_wall/log/corner
	icon_state = "log_wall_corner"
	material = "Wood"

/obj/covers/stone_wall
	name = "stone wall"
	desc = "A stone wall."
	icon = 'icons/turf/walls.dmi'
	icon_state = "b_stone_wall"
	passable = TRUE
	not_movable = TRUE
	density = TRUE
	opacity = TRUE
	amount = 0
	layer = 3
	health = 400
	wood = FALSE
	wall = TRUE
	flammable = FALSE
	explosion_resistance = 7
	material = "Stone"
	hardness = 100

/obj/covers/stone_wall/attackby(obj/item/W as obj, mob/user as mob)
	var/mob/living/carbon/human/H = user
	if(istype(W, /obj/item/weapon/chisel))
		var design = "smooth"
		if (!istype(H.l_hand, /obj/item/weapon/hammer) && !istype(H.r_hand, /obj/item/weapon/hammer))
			user << "<span class = 'warning'>You need to have a hammer in one of your hands to use a chisel.</span>"
			return
		else
			var/display = list("Smooth", "Cave", "Underground Cave", "Brick", "Cobbled", "Tiled", "Cancel")
			var/input =  WWinput(user, "What design do you want to carve?", "Carving", "Cancel", display)
			if (input == "Cancel")
				return
			else if  (input == "Smooth")
				user << "<span class='notice'>You will now carve the smooth design!</span>"
				design = "smooth"
			else if  (input == "Cave")
				user << "<span class='notice'>You will now carve the cave design!</span>"
				design = "cave"
			else if  (input == "Underground Cave")
				user << "<span class='notice'>You will now carve the cave design!</span>"
				design = "undercave"
			else if  (input == "Brick")
				user << "<span class='notice'>You will now carve the brick design!</span>"
				design = "brick"
			else if  (input == "Cobbled")
				user << "<span class='notice'>You will now carve the cobbled design!</span>"
				design = "cobbled"
			else if  (input == "Tiled")
				user << "<span class='notice'>You will now carve the tiled design!</span>"
				design = "tiled"
			visible_message("<span class='danger'>[user] starts to chisel a design!</span>", "<span class='danger'>You start chiseling a design.</span>")
			playsound(src,'sound/effects/pickaxe.ogg',60,1)
			if (do_after(user, 60, src))
			//Designs possible are "smooth", "cave", "brick", "cobbled", "tiled"
				if(design == "smooth")
					src.icon_state = "b_stone_wall"
					base_icon_state = icon_state
					src.name = "stone wall"
					src.desc = "A cave wall carved smooth."
				else if(design == "cave")
					src.icon_state = "rocky"
					base_icon_state = icon_state
					src.name = "underground cave wall"
					src.desc = "A cave wall."
				else if(design == "undercave")
					src.icon_state = "rock"
					base_icon_state = icon_state
					src.name = "cave wall"
					src.desc = "A cave wall."
				else if(design == "brick")
					src.icon_state = "b_brick_stone_wall"
					base_icon_state = icon_state
					src.name = "stone brick wall"
					src.desc = "A cave wall carved to look like its made of stone bricks."
				else if(design == "cobbled")
					src.icon_state = "b_cobbled_stone_wall"
					base_icon_state = icon_state
					src.name = "cobbled stone wall"
					src.desc = "A cave wall carved to look like piled up stones."
				else if(design == "tiled")
					src.icon_state = "b_tiled_stone_wall"
					base_icon_state = icon_state
					src.name = "tiled stone wall"
					src.desc = "A cave wall carved to have a tiled stone pattern."
				return
	..()

/obj/covers/sandstone_smooth_wall
	name = "sandstone wall"
	desc = "A sandstone wall."
	icon = 'icons/turf/walls.dmi'
	icon_state = "sandstone_smooth"
	passable = TRUE
	not_movable = TRUE
	density = TRUE
	opacity = TRUE
	amount = 0
	layer = 3
	health = 400
	wood = FALSE
	wall = TRUE
	flammable = FALSE
	explosion_resistance = 7
	material = "Stone"
	hardness = 100

/obj/covers/sandstone_wall
	name = "sandstone brick wall"
	desc = "A sandstone wall."
	icon = 'icons/turf/walls.dmi'
	icon_state = "sandstone_brick"
	passable = TRUE
	not_movable = TRUE
	density = TRUE
	opacity = TRUE
	amount = 0
	layer = 3
	health = 400
	wood = FALSE
	wall = TRUE
	flammable = FALSE
	explosion_resistance = 7
	material = "Stone"
	hardness = 100

/obj/covers/dirt_wall
	name = "dirt wall"
	desc = "A dirt wall."
	icon = 'icons/turf/walls.dmi'
	icon_state = "drydirt_wall"
	passable = TRUE
	not_movable = TRUE
	density = TRUE
	opacity = TRUE
	amount = 0
	layer = 3
	health = 90
	wood = FALSE
	wall = TRUE
	flammable = FALSE
	explosion_resistance = 3
	hardness = 65

/obj/covers/straw_wall
	name = "straw wall"
	desc = "A straw wall. Looks flimsy."
	icon = 'icons/turf/walls.dmi'
	icon_state = "straw_wallh"
	passable = TRUE
	not_movable = TRUE
	density = TRUE
	opacity = TRUE
	amount = 1
	layer = 3
	health = 75
	wood = TRUE
	wall = TRUE
	explosion_resistance = 2
	material = "Wood"
	hardness = 30

/obj/covers/dirt_wall/blocks
	name = "dirt blocks wall"
	desc = "A dirt blocks wall."
	icon = 'icons/turf/walls.dmi'
	icon_state = "drysod_wall"
	passable = TRUE
	not_movable = TRUE
	density = TRUE
	opacity = TRUE
	amount = 0
	layer = 3
	health = 110
	wood = FALSE
	wall = TRUE
	flammable = FALSE
	explosion_resistance = 4

/obj/covers/dirt_wall/blocks/incomplete
	name = "dirt blocks wall"
	desc = "A dirt blocks wall."
	icon = 'icons/turf/walls.dmi'
	icon_state = "drysod_wall_inc1"
	passable = TRUE
	not_movable = TRUE
	density = TRUE
	opacity = FALSE
	incomplete = TRUE
	amount = 0
	layer = 3
	health = 30
	var/stage = 1
	wood = FALSE
	wall = TRUE
	flammable = FALSE

/obj/covers/dirt_wall/blocks/incomplete/attackby(obj/item/W as obj, mob/user as mob)
	if (istype(W, /obj/item/weapon/sandbag))
		if (stage == 3)
			user << "You start adding dirt to the wall..."
			if (do_after(user, 20, src))
				user << "You finish adding dirt to the wall, completing it."
				qdel(W)
				new /obj/covers/dirt_wall/blocks(loc)
				qdel(src)
				return
		else if (stage <= 2)
			user << "You start adding dirt to the wall..."
			if (do_after(user, 20, src))
				if (stage <= 2)
					user << "You finish adding dirt to the wall."
					stage = (stage+1)
					icon_state = "drysod_wall_inc[stage]"
					base_icon_state = icon_state
					health = (20*stage)
					qdel(W)
					return
	..()


/obj/covers/clay_wall
	name = "clay block wall"
	desc = "A clay block wall."
	icon = 'icons/obj/claystuff.dmi'
	icon_state = "claybrickwall"
	passable = TRUE
	not_movable = TRUE
	density = TRUE
	opacity = TRUE
	amount = 0
	layer = 3
	health = 150
	wood = FALSE
	wall = TRUE
	flammable = FALSE
	explosion_resistance = 6
	material = "Stone"
	hardness = 75

/obj/covers/clay_wall/grecian
	name = "smooth grecian plaster wall"
	desc = "A grecian style plaster wall."
	icon_state = "grecian_plaster_smooth"
	health = 210
	explosion_resistance = 7

/obj/covers/clay_wall/attackby(obj/item/W as obj, mob/user as mob)
	if (istype(W, /obj/item/weapon/plaster))
		user << "You start adding plaster to the wall..."
		if (do_after(user, 20, src))
			user << "You finish adding plaster to the wall, rendering it."
			qdel(W)
			var/obj/covers/clay_wall/grecian/S = new /obj/covers/clay_wall/grecian(loc)
			qdel(src)
			var/choice = WWinput(user, "What type of wall?","Grecian Walls","Normal",list("Grecian Smooth","Grecian Smooth Pattern","Grecian Cobbled","Grecian Cobbled Pattern"))
			if (choice == "Grecian Smooth")
				return
			else if (choice == "Grecian Smooth Pattern")
				S.icon_state = "grecian_plaster_pattern"
				base_icon_state = icon_state
				var/choice1 = WWinput(user, "Which orientation?","Grecian Smooth Pattern","Vertical",list("Vertical","Horizontal"))
				if (choice1 == "Vertical")
					S.dir = SOUTH
				else if (choice1 == "Horizontal")
					S.dir = EAST
			else if (choice == "Grecian Cobbled")
				S.icon_state = "grecian_plaster_cobbled"
				base_icon_state = icon_state
				S.name = "cobbled grecian plaster wall"
			else if (choice == "Grecian Cobbled Pattern")
				S.icon_state = "grecian_plaster_pattern"
				base_icon_state = icon_state
				var/choice2 = WWinput(user, "Which orientation?","Grecian Cobbled Pattern","Vertical",list("Vertical","Horizontal"))
				if (choice2 == "Vertical")
					S.dir = NORTH
				else if (choice2 == "Horizontal")
					S.dir = WEST
			return
	..()

/obj/covers/clay_wall/incomplete
	name = "clay block wall"
	desc = "A clay block wall."
	icon = 'icons/obj/claystuff.dmi'
	icon_state = "claybrickwall_inc1"
	passable = TRUE
	not_movable = TRUE
	density = TRUE
	opacity = FALSE
	incomplete = TRUE
	amount = 0
	layer = 3
	health = 40
	var/stage = 1
	wood = FALSE
	wall = TRUE
	flammable = FALSE
	material = "Stone"

/obj/covers/clay_wall/incomplete/attackby(obj/item/W as obj, mob/user as mob)
	if (istype(W, /obj/item/weapon/clay/claybricks/fired))
		if (stage >= 2)
			user << "You start adding clay blocks to the wall..."
			if (do_after(user, 20, src))
				user << "You finish adding clay blocks to the wall, completing it."
				qdel(W)
				new /obj/covers/clay_wall(loc)
				qdel(src)
				return
		else if (stage <= 1)
			user << "You start adding clay blocks to the wall..."
			if (do_after(user, 20, src))
				if (stage <= 1)
					user << "You finish clay block to the wall."
					stage += 1
					icon_state = "claybrickwall_inc[stage]"
					base_icon_state = icon_state
					health = (30*stage)
					qdel(W)
					return
	..()

/obj/covers/clay_wall/sumerian
	name = "sumerian clay wall"
	desc = "A sumerian style clay wall."
	icon = 'icons/obj/claystuff.dmi'
	icon_state = "sumerian-wall"
	passable = TRUE
	not_movable = TRUE
	density = TRUE
	opacity = TRUE
	amount = 0
	layer = 3
	health = 150
	wood = FALSE
	wall = TRUE
	flammable = FALSE
	explosion_resistance = 6
	material = "Stone"

/obj/covers/clay_wall/sumerian/incomplete
	name = "sumerian clay wall"
	desc = "A sumerian style clay wall."
	icon = 'icons/obj/claystuff.dmi'
	icon_state = "sumerian-wall_inc1"
	passable = TRUE
	not_movable = TRUE
	density = TRUE
	opacity = FALSE
	incomplete = TRUE
	amount = 0
	layer = 3
	health = 40
	var/stage = 1
	wood = FALSE
	wall = TRUE
	flammable = FALSE
	material = "Stone"

/obj/covers/clay_wall/sumerian/incomplete/attackby(obj/item/W as obj, mob/user as mob)
	if (istype(W, /obj/item/weapon/clay/claybricks/fired))
		if (stage >= 2)
			user << "You start adding clay to the wall..."
			if (do_after(user, 20, src))
				user << "You finish adding clay to the wall, completing it."
				qdel(W)
				var/obj/covers/clay_wall/sumerian/S = new /obj/covers/clay_wall/sumerian(loc)
				qdel(src)
				var/choice = WWinput(user, "What type of wall?","Clay Walls","Normal",list("Normal","Doorway","Window","Corner"))
				if (choice == "Normal")
					return
				else if (choice == "Doorway")
					S.icon_state = "sumerian-door"
					base_icon_state = icon_state
					S.name = "sumerian clay door"
					S.density = FALSE
					S.opacity = FALSE
				else if (choice == "Window")
					new /obj/structure/window_frame/sumerian(loc)
					qdel(src)
				else if (choice == "Corner")
					S.icon_state = "sumerian-corner1"
					base_icon_state = icon_state
					var/choice1 = WWinput(user, "Which corner?","Clay Walls","North-West",list("North-West","North-East","South-West","South-East"))
					if (choice1 == "North-West")
						S.dir = SOUTH
					else if (choice1 == "North-East")
						S.dir = EAST
					else if (choice1 == "South-West")
						S.dir = NORTH
					else if (choice1 == "South-East")
						S.dir = WEST
				return
		else if (stage <= 1)
			user << "You start adding clay blocks to the wall..."
			if (do_after(user, 20, src))
				if (stage <= 1)
					user << "You finish adding clay to the wall."
					stage += 1
					icon_state = "sumerian-wall_inc[stage]"
					base_icon_state = icon_state
					health = (30*stage)
					qdel(W)
					return
	..()

/obj/covers/brick_wall
	name = "brick wall"
	desc = "A red brick wall."
	icon = 'icons/turf/walls.dmi'
	icon_state = "new_brick0"
	base_icon_state = "new_brick"
	adjusts = TRUE
	passable = TRUE
	not_movable = TRUE
	density = TRUE
	opacity = TRUE
	amount = 0
	layer = 3
	health = 450
	wood = FALSE
	wall = TRUE
	flammable = FALSE
	explosion_resistance = 7
	material = "Stone"
	hardness = 92

/obj/covers/cement_wall
	name = "concrete wall"
	desc = "A concrete wall."
	icon = 'icons/turf/walls.dmi'
	icon_state = "cement_wall0"
	base_icon_state = "cement_wall"
	passable = TRUE
	not_movable = TRUE
	density = TRUE
	opacity = TRUE
	amount = 0
	layer = 3
	health = 650 //until there are stronger alternatives.
	wood = FALSE
	wall = TRUE
	flammable = FALSE
	explosion_resistance = 8
	material = "Stone"
	hardness = 95
	adjusts = TRUE

/obj/covers/vault
	name = "vault wall"
	desc = "A very strong wall of concrete wall."
	icon = 'icons/obj/structures.dmi'
	icon_state = "vault"
	passable = TRUE
	not_movable = TRUE
	density = TRUE
	opacity = TRUE
	amount = 0
	layer = 3
	health = 800
	wood = FALSE
	wall = TRUE
	flammable = FALSE
	explosion_resistance = 10
	material = "Stone"
	hardness = 100

/obj/covers/slate
	name = "slatestone wall"
	desc = "A slate wall."
	icon = 'icons/obj/structures.dmi'
	icon_state = "slate"
	passable = TRUE
	not_movable = TRUE
	density = TRUE
	opacity = TRUE
	amount = 0
	layer = 3
	health = 500
	wood = FALSE
	wall = TRUE
	flammable = FALSE
	explosion_resistance = 10
	material = "Stone"
	hardness = 100

/obj/covers/cement_wall/incomplete
	name = "incomplete concrete wall"
	desc = "A cement brick wall."
	icon = 'icons/turf/walls.dmi'
	icon_state = "cementwall_inc1"
	passable = TRUE
	not_movable = TRUE
	density = TRUE
	opacity = FALSE
	incomplete = TRUE
	amount = 0
	layer = 3
	health = 80
	var/stage = 1
	wood = FALSE
	wall = TRUE
	flammable = FALSE
	material = "Stone"

/obj/covers/cement_wall/incomplete/attackby(obj/item/W as obj, mob/user as mob)
	if (istype(W, /obj/item/weapon/clay/advclaybricks/fired/cement))
		user << "You start adding cement to the wall..."
		if (do_after(user, 20, src))
			user << "You finish adding cement to the wall, completing it."
			qdel(W)
			new /obj/covers/cement_wall(loc)
			qdel(src)
			return
	..()

/obj/covers/brick_wall/incomplete
	name = "incomplete brick wall"
	desc = "A red brick wall."
	icon = 'icons/turf/walls.dmi'
	icon_state = "brickwall_inc1"
	passable = TRUE
	not_movable = TRUE
	density = TRUE
	opacity = FALSE
	incomplete = TRUE
	amount = 0
	layer = 3
	health = 80
	var/stage = 1
	wood = FALSE
	wall = TRUE
	flammable = FALSE
	material = "Stone"

/obj/covers/brick_wall/incomplete/attackby(obj/item/W as obj, mob/user as mob)
	if (istype(W, /obj/item/weapon/clay/advclaybricks/fired))
		user << "You start adding bricks to the wall..."
		if (do_after(user, 20, src))
			user << "You finish adding bricks to the wall, completing it."
			var/choice = WWinput(user, "What type of wall?","Brick Walls","Wall",list("Wall","Window"))
			if (choice == "Wall")
				qdel(W)
				new /obj/covers/brick_wall(loc)
				qdel(src)
				return
			else if (choice == "Window")
				qdel(W)
				new /obj/structure/window_frame/brick(loc)
				qdel(src)
				return
	..()

/obj/covers/jail/
	name = "jail"
	desc = "Do not use this."
	icon = 'icons/turf/walls.dmi'
	icon_state = "woodjail"
	passable = TRUE
	not_movable = TRUE
	density = TRUE
	opacity = TRUE
	amount = 1
	layer = 3
	health = 100000
	wall = TRUE
	explosion_resistance = 100
	var/buildstackamount = 8
	var/buildstack = /obj/item/stack/material/wood
	material = "Wood"
	hardness = 15

/obj/covers/jail/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if (istype(mover, /obj/effect/effect/smoke))
		return TRUE

	else if (istype(mover, /obj/item/projectile))
		return TRUE
	else
		return FALSE

/obj/covers/jail/woodjail
	name = "wood jail bars"
	desc = "To keep prisoners in."
	icon = 'icons/turf/walls.dmi'
	icon_state = "woodjail"
	passable = TRUE
	not_movable = TRUE
	density = TRUE
	opacity = TRUE
	amount = 1
	layer = 3
	health = 200
	wall = TRUE
	explosion_resistance = 5
	buildstackamount = 8
	buildstack = /obj/item/stack/material/wood
	opacity = 0
	material = "Wood"

/obj/covers/jail/steeljail
	name = "steel jail bars"
	desc = "To keep prisoners in better."
	icon = 'icons/turf/walls.dmi'
	icon_state = "steeljail"
	passable = TRUE
	not_movable = TRUE
	density = TRUE
	opacity = TRUE
	amount = 1
	layer = 3
	health = 800
	wall = TRUE
	explosion_resistance = 5
	buildstackamount = 8
	buildstack = /obj/item/stack/rods
	opacity = 0
	material = "Steel"

/obj/covers/jail/attackby(obj/item/W as obj, mob/user as mob)
	if (istype(W,/obj/item/weapon) && !istype(W,/obj/item/weapon/wrench)) //No weapons can harm me! If not weapon and not a wrench.
		user << "You pound the bars uselessly!"//sucker
	else if (istype(W,/obj/item/weapon/wrench))//if it is a wrench
		user << "<span class='notice'>You start disassembling the [src]...</span>"
		playsound(loc, 'sound/items/Screwdriver.ogg', 50, TRUE)
		if (do_after(user, 30, target = src))
			for (var/i = TRUE, i <= buildstackamount, i++)
				new buildstack(get_turf(src))
			qdel(src)
			return
	return TRUE

/obj/covers/jail/woodjail/attackby(obj/item/W as obj, mob/user as mob)
	if (istype(W,/obj/item/weapon) && !istype(W,/obj/item/weapon/wrench) && !istype(W,/obj/item/weapon/hammer)) //No weapons can harm me! If not weapon and not a wrench or hammer since im wood..
		user << "You pound the bars uselessly!" //sucker
	else if (istype(W,/obj/item/weapon/wrench) || istype(W,/obj/item/weapon/hammer))//if it is a wrench or hammer since im wood.
		user << "<span class='notice'>You start disassembling the [src]...</span>"
		playsound(loc, 'sound/items/Screwdriver.ogg', 50, TRUE)
		if (do_after(user, 30, target = src))
			for (var/i = TRUE, i <= buildstackamount, i++)
				new buildstack(get_turf(src))
			qdel(src)
			return
	return TRUE

/obj/covers/jail/bullet_act(var/obj/item/projectile/P)
	return PROJECTILE_CONTINUE

/obj/covers/jail/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if (istype(mover, /obj/effect/effect/smoke))
		return TRUE
	else if (istype(mover, /obj/item/projectile))
		return TRUE
	..()


/obj/covers/New()
	..()
	initial_opacity = opacity
	spawn(5)
		updateturf()
		if (opacity)
			for(var/obj/roof/R in range(1,src))
				R.update_transparency(0)
	return TRUE


/obj/covers/updateturf()
	..()
	var/turf/T = get_turf(src)
	if (T)
		origin_water_level = T.water_level
		T.water_level = 0
		T.move_delay = 0
	return TRUE


/obj/covers/Destroy()
	var/area/caribbean/CURRENTAREA = get_area(src)
	if (!istype(CURRENTAREA, /area/caribbean/void/caves))
		if (wall && !incomplete)
			new current_area_type(get_turf(src))
		var/turf/floor/T = get_turf(loc)
		if (T)
			T.water_level = origin_water_level
			T.move_delay = initial(T.move_delay)
	if (amount > 0)
		var/obj/item/stack/material/wood/wooddrop = new /obj/item/stack/material/wood
		wooddrop.amount = amount
	if (wall == TRUE)
		for(var/obj/roof/R in range(2,src))
			R.collapse_check()
	..()
	spawn(1)
		if (opacity)
			for(var/obj/roof/R in range(1,src))
				R.update_transparency(0)
	return TRUE

// the item you can use to repair a hole
/obj/item/weapon/covers
	name = "floor cover"
	desc = "Use this to cover holes."
	icon = 'icons/turf/floors.dmi'
	icon_state = "wood_ship_repaired2"
	w_class = 2.0
	flammable = TRUE
	value = 0
/obj/covers/repairedfloor
	name = "repaired floor"
	desc = "a repaired wood floor."
	icon = 'icons/turf/floors.dmi'
	icon_state = "wood_ship_repaired"
	layer = 1.98
	flammable = TRUE
	explosion_resistance = FALSE

/obj/covers/repairedfloor/New()
	..()
	spawn(15)
		var/turf/T = get_turf(src)
		if (istype(T, /turf/floor/beach/water/deep/saltwater))
			visible_message("The [src] sinks!")
			qdel(src)
			return

/obj/item/weapon/covers/attack_self(mob/user)
	var/covers_time = 80
	if (ishuman(user))
		var/turf/targetfloor = get_turf(get_step(user, user.dir))
		if (istype(targetfloor, /turf/wall) || istype(targetfloor, /turf/floor/beach/water/deep/saltwater))
			visible_message("<span class='notice'>You can't build here!</span>")
			return
		var/mob/living/carbon/human/H = user
		covers_time /= H.getStatCoeff("strength")
		covers_time /= (H.getStatCoeff("crafting") * H.getStatCoeff("crafting"))
	if (WWinput(user, "This will start building a floor cover [user.dir] of you.", "Floor Cover Construction", "Continue", list("Continue", "Stop")) == "Continue")
		visible_message("<span class='danger'>[user] starts constructing the floor cover.</span>", "<span class='danger'>You start constructing the floor cover.</span>")
		if (do_after(user, covers_time, user.loc) && src)
			qdel(src)
			new/obj/covers/repairedfloor(get_step(user, user.dir), user)
			visible_message("<span class='danger'>[user] finishes placing the floor cover.</span>")
			if (ishuman(user))
				var/mob/living/carbon/human/H = user
				H.adaptStat("crafting", 3)
		return


/obj/covers/fire_act(temperature)
	if (prob(35 * (temperature/500)) && wood == TRUE)
		visible_message("<span class = 'warning'>[src] is burned away.</span>")
		qdel(src)



/obj/covers/CanPass(var/atom/movable/mover)
	if (istype(mover, /obj/effect/effect/smoke))
		return TRUE
	else if (istype(mover, /obj/item/projectile))
		if (prob(75) && density)
			visible_message("<span class = 'warning'>\The [mover.name] hits \the [src]!</span>")
			return FALSE
		else
			return TRUE
	else
		return ..()

/obj/covers/attackby(obj/item/W as obj, mob/user as mob)
	if (istype(W, /obj/item/weapon/wrench) && not_movable == TRUE)
		return
	if (istype(W, /obj/item/weapon/hammer))
		if (!wall)
			user << "You start removing \the [src]..."
			if (do_after(user, 70, src))
				user << "You removed \the [src] from the floor."
				qdel(src)
				return
	if (wall)
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		if (istype(W, /obj/item/weapon/poster/religious))
			user << "You start placing the [W] on the [src]..."
			if (do_after(user, 70, src))
				visible_message("[user] places the [W] on the [src].")
				var/obj/structure/poster/religious/RP = new/obj/structure/poster/religious(get_turf(src))
				var/obj/item/weapon/poster/religious/P = W
				RP.religion = P.religion
				RP.symbol = P.symbol
				RP.color1 = P.color1
				RP.color2 = P.color2
				user.drop_from_inventory(W)
				qdel(W)
				return
		if (istype(W, /obj/item/weapon/poster/faction))
			user << "You start placing the [W] on the [src]..."
			if (do_after(user, 70, src))
				visible_message("[user] places the [W] on the [src].")
				var/obj/structure/poster/faction/RP = new/obj/structure/poster/faction(get_turf(src))
				var/obj/item/weapon/poster/faction/P = W
				RP.faction = P.faction
				RP.bstyle = P.bstyle
				RP.color1 = P.color1
				RP.color2 = P.color2
				user.drop_from_inventory(W)
				qdel(W)
				return
		if (istype(W, /obj/item/flashlight/torch) && wood == TRUE)
			var/obj/item/flashlight/torch/T = W
			if (prob(33) && T.on)
				onfire = TRUE
				visible_message("<span class='danger'>\The [src] catches fire!</span>")
				start_fire()
		else
			switch(W.damtype)
				if ("fire")
					health -= W.force * 0.7
				if ("brute")
					health -= W.force * 0.2

		playsound(get_turf(src), 'sound/weapons/smash.ogg', 100)
		user.do_attack_animation(src)
		try_destroy()
		..()
	else
		return

/obj/covers/proc/try_destroy()
	if (health <= 0)
		visible_message("<span class='danger'>\The [src] is broken into pieces!</span>")
		qdel(src)
		return


/obj/covers/bullet_act(var/obj/item/projectile/proj)
	if (istype(proj, /obj/item/projectile/arrow/arrow/fire) && wood == TRUE)
		health -= proj.damage * 0.25
		if (prob(25))
			onfire = TRUE
			visible_message("<span class='danger'>\The [src] catches fire!</span>")
			start_fire()
		try_destroy()
	else
		if (wall)
			if (istype(proj, /obj/item/projectile/shell))
				var/obj/item/projectile/shell/S = proj
				if (S.atype == "HE")
					visible_message("<span class='danger'>\The [src] is broken into pieces!</span>")
					qdel(src)
					return
				else
					if (prob(60))
						visible_message("<span class='danger'>\The [src] is broken into pieces!</span>")
						qdel(src)
			else
				if (istype(proj, /obj/item/projectile/bullet) && bullethole_count.len < 13)
					new_bullethole()
				health -= proj.damage * 0.1
				try_destroy()
			return
		else
			return

/obj/covers/proc/start_fire()
	if (onfire && wood)
		var/obj/effect/fire/NF = new/obj/effect/fire(src.loc)
		start_fire_dmg(NF)

/obj/covers/proc/start_fire_dmg(var/obj/effect/fire/SF)
	spawn(80)
		if (health > 0)
			health -= 10
			start_fire_dmg()
			return
		else
			try_destroy()
			qdel(SF)
			return

///////////////////////////////COVER WALL BORDERS//////////////////////////////
/obj/covers/proc/check_relatives(var/update_self = FALSE, var/update_others = FALSE)
	if (!adjusts)
		return
	var/junction
	if (update_self)
		junction = FALSE
	for (var/checkdir in cardinal)
		var/turf/T = get_step(src, checkdir)
		for(var/obj/covers/CV in T)
			if (!can_join_with(CV))
				continue
			if (update_self)
				if (can_join_with(CV))
					junction |= get_dir(src,CV)
			if (update_others)
				CV.check_relatives(1,0)
	if (!isnull(junction))
		icon_state = "[base_icon_state][junction]"
	return

/obj/covers/proc/can_join_with(var/obj/covers/W)
	if (istype(W,src))
		return TRUE
	return FALSE

/obj/covers/update_icon()
	..()
	check_relatives(1,1)
	overlays.Cut()
	overlays |= bullethole_overlays

/obj/covers/New()
	..()
	check_relatives(1,1)

/obj/covers/Destroy()
	check_relatives(0,1)
	..()

/obj/covers/proc/new_bullethole()
	if (bullethole_count.len >= 13)
		return
	if (!wall)
		return
	var/list/opts = list(1,2,3,4,5,6,7,8,9,10,11,12,13)
	for(var/i in bullethole_count)
		opts -= i
	if (isemptylist(opts))
		return
	var/chnum = pick(opts)
	var/tmp_bullethole = image(icon = 'icons/turf/walls.dmi', icon_state = "bullethole[chnum]", layer = src.layer+0.01)
	bullethole_overlays += tmp_bullethole
	bullethole_count += list(chnum)
	update_icon()

////////////////////////////////////////////////////////////

/obj/covers/wood_wall/aztec
	name = "aztec wood wall"
	desc = "A wood wall, in aztec style."
	icon_state = "aztec0"
	base_icon_state = "aztec"
	adjusts = TRUE

/obj/covers/wood_wall/nordic
	name = "nordic wood wall"
	desc = "A wood wall, in northern european style."
	icon_state = "nordic0"
	base_icon_state = "nordic"
	adjusts = TRUE

/obj/covers/stone_wall/roman
	name = "roman stone wall"
	desc = "A roman-style stone wall."
	icon_state = "roman0"
	base_icon_state = "roman"
	adjusts = TRUE

/obj/covers/stone_wall/egyptian
	name = "egyptian sandstone wall"
	desc = "An egyptian-style sandstone wall."
	icon_state = "egyptian0"
	base_icon_state = "egyptian"
	adjusts = TRUE

/obj/covers/stone_wall/mayan
	name = "mayan stone wall"
	desc = "A mayan-style stone wall."
	icon_state = "mayan0"
	base_icon_state = "mayan"
	adjusts = TRUE

/obj/covers/stone_wall/classic
	name = "stone block wall"
	desc = "A stone block wall."
	icon_state = "stone_block_wall0"
	base_icon_state = "stone_block_wall"
	adjusts = TRUE

/obj/covers/stone_wall/brick
	name = "stone brick wall"
	desc = "A stone brick wall."
	icon_state = "stone_brickwall0"
	base_icon_state = "stone_brickwall"
	adjusts = TRUE
	health = 550

/obj/covers/stone_wall/fortress
	name = "fortress brick wall"
	desc = "A dense fortress brick wall."
	icon_state = "fortress_brickwall0"
	base_icon_state = "fortress_brickwall"
	adjusts = TRUE
	health = 650
	explosion_resistance = 7