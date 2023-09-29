extends Node2D
class_name harvestingtool


@export var effected_nodes: Array[ResourceNodeType]
@export var min_amount : int = 1
@export var max_amount : int = 1


#if the body interacts is a resource and matchs with effected node
#debug and harvest between min and max amount
func _on_area_2d_body_entered(body):
	if body is rock_type:
		for type in effected_nodes:
			if(body.node_types.has(type)):
				#print_debug("match found type:"+type.display_name + " on " + body.name)
				body.harvest(randi_range(min_amount,max_amount))



	
#10:37

