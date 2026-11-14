extends CharacterBody2D


const SPEED = 160
const JUMP_VELOCITY = -400
@onready var animated_sprite_2d: AnimatedSprite2D = $Area2D3/AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $Area2D/AnimationPlayer
@onready var bow_and_arrows: Sprite2D = $Area2D/BowAndArrows

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left1", "right")
	




	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if Input.is_action_just_pressed("attack"):
		animation_player.play("side")
		animated_sprite_2d.play("new_animation")
		animated_sprite_2d.flip_h = true

	if Input.is_action_just_pressed("side_attack"):
		animation_player.play("attack")
		animated_sprite_2d.play("new_animation")
		animated_sprite_2d.flip_h = false
		


	move_and_slide()
