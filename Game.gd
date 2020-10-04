extends Node


export (int) var STAGE_LENGTH = 4352


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Ground1_LeftZone_entered(_area):
	print("Ground1 left zone")
#	$Ground2.position.x = $Ground1.position.x - STAGE_LENGTH


func _on_Ground1_RightZone_entered(body):
	print("Ground1 right zone")


func _on_Feather1_collected():
	print("Feather1 collected")
	$Stage1/Feathers/Feather1.queue_free()


func _on_Stage1_Axe_entered(body):
	print("Axe collected")
	$Player.has_axe = true
	$Stage1/Items/Axe.queue_free()
	
