class_name Esguerra
extends CharacterBody2D

@export var gravity = 100
@export var jump_speed = 100
@export var speed = 100

func _physics_process(delta):
	
	
	var direction = Input.get_axis("izquierda", "derecha")
	velocity.x = speed * direction
	
#gravedad
	if not is_on_floor():
		velocity.y = velocity.y + gravity  * delta 
	
	#salto
	var jump_pressed = Input.is_action_just_pressed("saltar")
	if jump_pressed: 
		velocity.y = velocity.y - jump_speed
	
	
	move_and_slide()
