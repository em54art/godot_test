extends StaticBody2D
class_name rock_type

@export var node_types: Array[ResourceNodeType]
@export var starting_resources : int = 1
@export var pickup_type: PackedScene
@export var launch_speed : float = 100
@export var launch_duration: float = 0.25

@onready var level_parent = get_parent()

var current_resource : int :
	set(resource_count):
		current_resource = resource_count
		#resource hits 0, remove from scene
		if(resource_count <= 0):
			queue_free()

func _ready():
	current_resource = starting_resources


func harvest(amount: int):
	for n in amount:
		spawn_resource()

	current_resource -= amount

func spawn_resource():
	var pickup_instance: pickup = pickup_type.instantiate() as pickup
	level_parent.add_child(pickup_instance)
	pickup_instance.position = position
	
	var direction : Vector2 = Vector2(
		randf_range(-1.0,1.0),
		randf_range(-1.0,1.0)
	).normalized()
	
	pickup_instance.launch(direction * launch_speed,launch_duration)
