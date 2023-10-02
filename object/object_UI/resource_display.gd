extends MarginContainer

@export var item_display_template: PackedScene

@onready var grid_container : GridContainer = $GridContainer

var displays : Array[ResourceItemDisplay]
var player_inventory: Inventory

func _ready():
	var _player : player = get_tree().get_first_node_in_group("player")
	player_inventory = _player.find_child("inventory") as Inventory
	player_inventory.connect("resource_count_changed", _on_player_inventory_resource_count_changed)
	

func _on_player_inventory_resource_count_changed(type: ResourceItem,new_count:int) -> void:
	#find existing item display for type
	var current_display: ResourceItemDisplay
	
	#find existing display and updae the count if one is found
	for d in displays:
		if (d.resource_type == type):
			current_display = d
			current_display.update_count(new_count)
			break
	# if none , create new
	if (current_display == null):
		var new_display : ResourceItemDisplay = item_display_template.instantiate() as ResourceItemDisplay
		grid_container.add_child(new_display)
		new_display.resource_type = type
		new_display.update_count(new_count)
		displays.append(new_display)
