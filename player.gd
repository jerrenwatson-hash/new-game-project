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

	# Get the input
	
	var direction := Input.get_axis("move left ","move right")
	move_and_slide()
	#flip the sprite
	if direction < 0:
			animated_sprite.flip_h=true

	elif direction > 0:
			animated_sprite.flip_h=false
	# Apply movement 
	
	if direction:
		velocity.x =  direction * SPEED
	else:
		velocity.x = 0 

	if is_on_floor():
		if direction== 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")




func _on_coin_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_killzone_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
func jump(multi:float=1):
	velocity.y=JUMP_VELOCITY * multi
