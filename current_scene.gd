extends Node2D
#reference

class_name current_scene

signal toggle_game_paused(is_paused : bool)
var mynode = preload("res://item/resource_bush_2.tscn")


func _ready():
	inst(Vector2(700,400))

#instance bush method
func inst(pos):
	var instace = mynode.instantiate()
	instace.position = pos
	add_child(instace)
	
#pause menu (figure out what happens in the code)
var game_paused : bool = false:
	get:
		return game_paused
		
	set(value):
		game_paused = value
		get_tree().paused = game_paused
		emit_signal("toggle_game_paused",game_paused)

#input escape
func _input(event : InputEvent):
	if(event.is_action_pressed("pause")):
		game_paused = !game_paused



