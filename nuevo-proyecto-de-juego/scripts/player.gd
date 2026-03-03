extends CharacterBody2D

@export var speed: float = 200.0
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta):
	
	var direction := 0
	
	# Movimiento izquierda / derecha
	if Input.is_action_pressed("right"):
		direction += 1
	if Input.is_action_pressed("left"):
		direction -= 1
	
	velocity.x = direction * speed
	move_and_slide()
	
	update_animation(direction)

func update_animation(direction):
	
	if direction == 0:
		anim.play("idle")
	else:
		anim.play("caminar")
		
		# Voltear sprite según dirección
		if direction > 0:
			anim.flip_h = false
		elif direction < 0:
			anim.flip_h = true
