extends Control

@export var game_manager : current_scene

func _ready():
	hide()
	game_manager.connect("toggle_game_paused",_on_game_manager_toggle_game_paused)
	
	
func _on_game_manager_toggle_game_paused(is_paused : bool):
	print("function work")
	if (is_paused):
		print("show")
		show()
	else:
		print("hide")
		hide()
	


func _on_resume_pressed():
	print("resume")
