extends Node2D

@export var equiped_item : Resource

func _on_area_2d_body_entered(body):
	if body is rock_type:
		print("rock")
	else:
		print("not rock")
	
