extends Node2D

func _ready():
	$AnimationPlayer.play("Coin")
	$Area2D.connect("area_entered" , self , "on_area_entered")

func on_area_entered(area2d):
	$AnimationPlayer.play("pick_up")
	call_deferred("_pickup_disabled()")
	
func _pickup_disabled():
	$Area2D/CollisionShape2D.disabled = true
	
