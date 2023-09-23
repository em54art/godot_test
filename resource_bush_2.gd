extends Area2D
class_name bush2

@onready var animation_player = $AnimationPlayer

func _on_body_entered(body):
	if body is player:
		animation_player.play("touch")
		
