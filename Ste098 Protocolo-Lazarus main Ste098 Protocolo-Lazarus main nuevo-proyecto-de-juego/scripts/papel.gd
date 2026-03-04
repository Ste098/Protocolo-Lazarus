extends Area2D

var jugador_cerca := false
var dialog_box : Node = null

func _on_body_entered(body):
	if body.name == "Player":
		jugador_cerca = true
		if dialog_box == null:
			var dialog_scene = preload("res://scenes/dialogo_1.tscn")
			dialog_box = dialog_scene.instantiate()
			dialog_box.name = "DialogoTemporal"
			get_parent().add_child(dialog_box)
			dialog_box.show_dialog("Presiona E para recoger el objeto")

func _on_body_exited(body):
	if body.name == "Player":
		jugador_cerca = false
		if dialog_box:
			dialog_box.queue_free()
			dialog_box = null

func _process(delta):
	if jugador_cerca and dialog_box and Input.is_action_just_pressed("interact"):
		recoger_objeto()

func recoger_objeto():
	print("Objeto recogido")
	if dialog_box:
		dialog_box.queue_free()
		dialog_box = null
	queue_free()



	
