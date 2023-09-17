extends Node2D

@export var equiped_item : Resource

#test
func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.has_method("rock_touch"):
		print("nice")
	else:
		print("bad")
		pass
