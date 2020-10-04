extends Node


export (int) var STAGE_LENGTH = 1600


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Ground1_LeftZone_entered(_area):
	print("Ground1 left zone")
	$Ground2.position.x = $Ground1.position.x - STAGE_LENGTH
