extends Area2D

@export var next_scene: PackedScene   # Escena destino que asignas desde el Inspector

# Este método debe coincidir con la señal conectada en el editor
func _on_Salida_arriba_body_entered(body):
	if body.name == "Player" and next_scene:
		get_tree().change_scene_to_packed(next_scene)


func _on_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
