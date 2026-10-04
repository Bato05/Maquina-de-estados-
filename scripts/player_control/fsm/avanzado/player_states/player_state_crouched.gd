extends PlayerStateGravityBase

const TIERRA = preload("res://scenes/tierra.tscn")
var tierra_instance = null

func start():
	tierra_instance = TIERRA.instantiate()
	player.add_child(tierra_instance)
	
func end():
	if tierra_instance: tierra_instance.queue_free()	

func on_physics_process(delta):	
	player.play_animation(player.animations.crouch)
	player.velocity = Vector2.ZERO
	
	handle_gravity(delta)
	player.move_and_slide()
	
func on_input(_event):
	# seria mejor usar el parametro _event para obtener la información del evento
	if Input.is_action_just_released("ui_down"): 
		state_machine.change_to(player.states.Idle)
