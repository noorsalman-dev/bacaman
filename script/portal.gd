extends Area2D


# Called when the node enters the scene tree for the first time.


func _on_body_entered(body: Node2D) -> void:
	print("level 2")
	get_tree().change_scene_to_file("res://scene/level_2.tscn")
