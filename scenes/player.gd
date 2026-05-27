extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


@onready var gravity= ProjectSettings.get_setting("physics/2D/defualt_gravity")

func _physics_process(delta): 
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move left ","move right")
	
	#flip the sprite
	if direction < 0:
			animated_sprite.flip_h=false

	elif direction > 0:
			animated_sprite.flip_h=true
	# Apply movement 
	
	if direction:
		velocity.x =  direction * SPEED
	else:
		velocity.x = 0 
	move_and_slide()


func _on_coin_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_killzone_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
