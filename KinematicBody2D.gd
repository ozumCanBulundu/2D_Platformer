extends KinematicBody2D

var gravity = 800;
var velocity = Vector2.ZERO
var maxHorizontalspeed = 125
var horizontalAcceleration = 1000
var jumpSpeed = 250
var lessJumpMultiplier = 5
var canJump = true


func _ready():
	pass # Replace with function body.

func _process(delta):
	var moveVector = get_move_vector()
	
	velocity.x += moveVector.x * horizontalAcceleration * delta
	
	if (moveVector.x == 0):
		velocity.x = lerp(0, velocity.x, pow(2,-50 * delta))

	velocity.x = clamp(velocity.x , -maxHorizontalspeed, maxHorizontalspeed)
	
	if (moveVector.y < 0 and is_on_floor()):
		velocity.y = moveVector.y * jumpSpeed
		
	
	if(moveVector.y < 0 and !is_on_floor() and canJump == true):
		velocity.y = moveVector.y * jumpSpeed
		canJump = false
	
	if(is_on_floor()):
		canJump = true
		
	
	if (velocity.y < 0 and !Input.is_action_pressed("action_jump")):
		velocity.y += gravity * delta * lessJumpMultiplier
	
	
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity , Vector2.UP)
	
	#will do coyotetimer later *********************************************************************
	
	update_animation()
	
func get_move_vector():
	var moveVector = Vector2.ZERO
	moveVector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	moveVector.y = -1 if Input.is_action_just_pressed("action_jump") else 0 
	return moveVector
	
func update_animation():
	var moveVec = get_move_vector()
	
	if(!is_on_floor()):
		$AnimatedSprite.play("jump")
	elif(moveVec.x != 0):
		$AnimatedSprite.play("run")
	else:
		$AnimatedSprite.play("idle")
	
	if(moveVec.x != 0):
		$AnimatedSprite.flip_h = true if moveVec.x > 0 else false
	
	
	
	
	
	
	
