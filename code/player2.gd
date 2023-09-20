extends CharacterBody2D

@export var speed: float = 200.0

#@onready var animation_tree : AnimationTree = $AnimationTree
var direction : Vector2 = Vector2.ZERO

#func _ready():
#	animation_tree.active = true
	
#func _process(delta):
#	update_animation_parameters()

func _physics_process(delta):
#move 4 directions
	direction = Input.get_vector("move_left","move_right","move_up","move_down").normalized()

	if direction:
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO

	move_and_slide()

#animations
#func update_animation_parameters():
#	if(velocity == Vector2.ZERO):
#		animation_tree["parameters/conditions/idle"] = true
#		animation_tree["parameters/conditions/is_moving"] = false
#	else:
#		animation_tree["parameters/conditions/idle"] = false
#		animation_tree["parameters/conditions/is_moving"] = true
#
#	if(Input.is_action_just_pressed("use")):
#		animation_tree["parameters/conditions/attack"] = true
#	else:
#		animation_tree["parameters/conditions/attack"] = false
#
#	if(direction != Vector2.ZERO):
#		animation_tree["parameters/idle/blend_position"] = direction
#		animation_tree["parameters/walk/blend_position"] = direction
#		animation_tree["parameters/water_atk/blend_position"] = direction


