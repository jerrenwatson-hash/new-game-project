extends Area2D

@onready var game_manger: Node = %game_manger
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(body):
   game_manger.add_point()
   animation_player.play("Pickup")
