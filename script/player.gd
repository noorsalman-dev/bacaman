extends CharacterBody2D


const SPEED = 100
const JUMP_VELOCITY = -400

@onready var animated_sprite_2d: AnimatedSprite2D = $Area2D2/AnimatedSprite2D
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	



	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	
	
	if direction >= 0:
		animated_sprite_2d.flip_h = false
	elif direction <= 0:
		animated_sprite_2d.flip_h = true
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)


	if Input.is_action_just_pressed("side_attack"):
		animation_player.play("new_animation")
		animated_sprite_2d.flip_h = true

	if Input.is_action_just_pressed("attack"):
		animation_player.play("attack")
		animated_sprite_2d.flip_h = false


	

	move_and_slide()
