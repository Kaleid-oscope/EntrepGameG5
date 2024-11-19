extends CharacterBody2D


const speed = 100



func exitStuff():
	if(Input.is_action_pressed("Escape")):
		get_tree().change_scene_to_file("res://scenes/MenuScreen.tscn")
		
func _physics_process(delta):
	player_movement(delta)
	current_camera()

func player_movement(_delta):
	
	if Input.is_action_pressed("key_right"):
		Global.direction = "right"
		animation(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("key_left"):
		Global.direction = "left"
		animation(1)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("key_down"):
		Global.direction = "front"
		animation(1)
		velocity.y = speed
		velocity.x = 0
	elif Input.is_action_pressed("key_up"):
		Global.direction = "back"
		animation(1)
		velocity.y = -speed
		velocity.x = 0
	else:
		animation(0)
		velocity.x = 0
		velocity.y = 0
	move_and_slide()

func animation(enable):
	var dir = Global.direction
	var animations = $AnimatedSprite2D
	
	if Global.direction == "none":
		animations.play("front_idle")
	
	if dir == "right":
		animations.flip_h = false
		if enable == 1:
			animations.play("side_walk")
		elif enable == 0:
			animations.play("side_idle")
	elif dir == "left":
		animations.flip_h = true
		if enable == 1:
			animations.play("side_walk")
		elif enable == 0:
			animations.play("side_idle")
	elif dir == "front":
		animations.flip_h = true
		if enable == 1:
			animations.play("front_walk")
		elif enable == 0:
			animations.play("front_idle")
	elif dir == "back":
		animations.flip_h = true
		if enable == 1:
			animations.play("back_walk")
		elif enable == 0:
			animations.play("back_idle")
			
func player():
	pass

func current_camera():
	if Global.current_scene == "world":
		$world_camera.enabled = true
		$cliffside_camera.enabled = false
	elif Global.current_scene == "cliff_side":
		$world_camera.enabled = false
		$cliffside_camera.enabled = true
	
	
	
