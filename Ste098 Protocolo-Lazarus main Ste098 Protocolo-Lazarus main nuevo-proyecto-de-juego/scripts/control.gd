extends Control

func _ready():
	visible = false

func show_dialog(text: String):
	$Panel/Label.text = text
	visible = true

func _process(delta):
	if visible and Input.is_action_just_pressed("interact"):
		visible = false
