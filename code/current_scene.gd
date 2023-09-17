extends Node2D

func _ready():
	pass

func pause():
	get_tree().paused = true

func unpause():
	get_tree().paused = false
	


func _on_button_pressed():
	pause()


