extends Node


export (int) var STAGE_LENGTH = 4352
var feathers_remaining = 6


# Called when the node enters the scene tree for the first time.
func _ready():
	feathers_remaining = 6
	$HUD/YouWin.hide()
	$Stage1.position.x = 0
	$Stage2.position.x - -STAGE_LENGTH
	$Stage1/Tree.rotation_degrees = 0
	$Stage2/Tree.rotation_degrees = 0


func _on_Ground1_LeftZone_entered(_area):
	print("Ground1 left zone")
	$Stage2.position.x = $Stage1.position.x - STAGE_LENGTH
func _on_Ground1_RightZone_entered(_body):
	print("Ground1 right zone")
	$Stage2.position.x = $Stage1.position.x + STAGE_LENGTH
	
func _on_Ground2_LeftZone_entered(_area):
	print("Ground2 left zone")
	$Stage1.position.x = $Stage2.position.x - STAGE_LENGTH
func _on_Ground2_RightZone_entered(_body):
	print("Ground2 right zone")
	$Stage1.position.x = $Stage2.position.x + STAGE_LENGTH


func _on_Feather1_collected(_body):
	print("Feather1 collected")
	feathers_remaining -= 1
	update_feather_count()
	$Stage1/Feathers/Feather1.queue_free()
	$Stage2/Feathers/Feather1.queue_free()
	check_win()
	
func _on_Feather2_collected(_body):
	print("Feather2 collected")
	feathers_remaining -= 1
	update_feather_count()
	$Stage1/Feathers/Feather2.queue_free()
	$Stage2/Feathers/Feather2.queue_free()
	check_win()
	
func _on_Feather3_collected(_body):
	print("Feather3 collected")
	feathers_remaining -= 1
	update_feather_count()
	$Stage1/Feathers/Feather3.queue_free()
	$Stage2/Feathers/Feather3.queue_free()
	check_win()
	
func _on_Feather4_collected(_body):
	print("Feather4 collected")
	feathers_remaining -= 1
	update_feather_count()
	$Stage1/Feathers/Feather4.queue_free()
	$Stage2/Feathers/Feather4.queue_free()
	check_win()
	
func _on_Feather5_collected(_body):
	print("Feather5 collected")
	feathers_remaining -= 1
	update_feather_count()
	$Stage1/Feathers/Feather5.queue_free()
	$Stage2/Feathers/Feather5.queue_free()
	check_win()
	
func _on_Feather6_collected(_body):
	print("Feather6 collected")
	feathers_remaining -= 1
	update_feather_count()
	$Stage1/Feathers/Feather6.queue_free()
	$Stage2/Feathers/Feather6.queue_free()
	check_win()


func _on_Axe_collected(_body):
	print("Axe collected")
	$Player.has_axe = true
	$Stage1/Items/Axe.queue_free()
	$Stage2/Items/Axe.queue_free()
	$ItemTone.play()
	
func _on_ClimbingGear_collected(_body):
	print("Climbing gear collected")
	$Player.has_climbing_gear = true
	$Stage1/Items/ClimbingGear.queue_free()
	$Stage2/Items/ClimbingGear.queue_free()
	$ItemTone.play()
	
func _on_Kite_collected(_body):
	print("Kite collected")
	$Player.has_kite = true
	$Stage1/Items/Kite.queue_free()
	$Stage2/Items/Kite.queue_free()
	$ItemTone.play()

func _on_Tree_body_entered(body):
	if (body == $Player) and not $Stage1/Tree.is_chopped and $Player.has_axe:
		print("Chopping tree")
		$AnimationPlayer.play("fall")
		$Stage1/Tree.is_chopped = true
		$Stage2/Tree.is_chopped = true
		
func update_feather_count():
	$HUD/FeathersCollected.text = "Feathers Remaining: " + String(feathers_remaining)
	$FeatherTone.play()

func check_win():
	if feathers_remaining <= 0:
		$HUD/YouWin.show()

