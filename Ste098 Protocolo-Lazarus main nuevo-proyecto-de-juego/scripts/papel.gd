extends Area2D
var jugador_cerca := false
var dialog_box : Node = null

func _on_body_entered(body):
	if body.name == "Player" and dialog_box == null:
		jugador_cerca = true
		var dialog_scene = preload("res://scenes/dialogo_1.tscn") # Cargar la escena del diálogo
		dialog_box = dialog_scene.instantiate()
		dialog_box.name = "DialogoTemporal"
		get_parent().add_child(dialog_box) # Añadir el diálogo a la escena principal
		dialog_box.show_dialog("Presiona E para recoger el objeto")

func _on_body_exited(body):
	if body.name == "Player":
		jugador_cerca = false
		var nodo_existente = get_parent().get_node_or_null("DialogoTemporal")
		if nodo_existente:
			nodo_existente.queue_free()
			dialog_box = null
			
func _process(delta):
	if jugador_cerca and Input.is_action_just_pressed("interact"):
		recoger_objeto()

func recoger_objeto():
	print("Objeto recogido")
	var nodo_existente = get_parent().get_node_or_null("DialogoTemporal")
	if nodo_existente:
		nodo_existente.queue_free()
	dialog_box = null

	queue_free()
