extends Node


export (int) var STAGE_LENGTH = 4352


# Called when the node enters the scene tree for the first time.
func _ready():
	$Stage1/Tree.rotation_degrees = 0


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


func _on_Axe_collected(body):
	print("Axe collected")
	$Player.has_axe = true
	$Stage1/Items/Axe.queue_free()
	
func _on_ClimbingGear_collected(body):
	print("Climbing gear collected")
	$Player.has_climbing_gear = true
	$Stage1/Items/ClimbingGear.queue_free()

func _on_Tree_body_entered(body):
	if (body == $Player) and not $Stage1/Tree.is_chopped and $Player.has_axe:
		print("Chopping tree")
		$AnimationPlayer.play("fall")
		$Stage1/Tree.is_chopped = true

