extends GridContainer

@export var item_display_template: PackedScene

@onready var display_container : MarginContainer = $DisplayContainer

var displays : Array[ResourceItemDisplay]
var player_inventory: Inventory

func _ready():
	var _player : player = get_tree().get_first_node_in_group("player")
	player_inventory = _player.find_child("inventory") as Inventory
	player_inventory.connect("resource_count_changed", _on_player_inventory_resource_count_changed)
	

func _on_player_inventory_resource_count_changed(type: ResourceItem,new_count:int) -> void:
	#find existing item display for type
	var current_display: ResourceItemDisplay
	
	for d in displays:
		if (d.resource_type == type):
			current_display = d
			break
	# if none , create new
	#16.40 - 9
