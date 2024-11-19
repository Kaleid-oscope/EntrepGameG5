extends Node

var current_scene = "world"
var transition_scene = false
var direction = "none"

var player_exit_cliffside_posx = 406
var player_exit_cliffside_posy = 159
var player_start_posx = 13
var player_start_posy = 29
var game_first_loading = true

func finish_changescenes():
	if transition_scene == true:
		transition_scene = false
		if current_scene == "world":
			current_scene = "cliff_side"
		else:
			current_scene = "world"
			

		
			
