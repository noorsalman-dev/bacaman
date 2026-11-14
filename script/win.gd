extends Area2D





func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("left "):
		get_tree().change_scene_to_file("res://scene/level_6.tscn")
