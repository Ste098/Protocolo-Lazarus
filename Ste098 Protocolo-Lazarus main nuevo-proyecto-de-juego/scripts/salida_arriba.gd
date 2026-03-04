extends Area2D

@export var next_scene : PackedScene  # Arrastra aquí la escena de destino en el Inspector

var player_inside := false  # Detecta si el Player está dentro del área


	

# Cuando el Player entra al área
func _on_body_entered(body):
	if body.name == "Player":  # O body.is_in_group("player")
		player_inside = true

# Cuando el Player sale del área
func _on_body_exited(body):
	if body.name == "Player":
		player_inside = false

# Revisar cada frame si el jugador presiona interact
func _process(delta):
	if player_inside and Input.is_action_just_pressed("interact"):
		if next_scene:
			call_deferred("_change_scene")
		else:
			print("Error: next_scene no está asignada!")

# Cambio de escena diferido
func _change_scene():
	get_tree().change_scene_to_packed(next_scene)
