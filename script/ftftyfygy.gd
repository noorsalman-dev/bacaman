extends Area2D


# Called when the node enters the scene tree for the first time.
var health = 100

@onready var progress_bar: ProgressBar = $"../ProgressBar"





func _physics_process(delta: float) -> void:
	progress_bar.value = health


func _on_body_entered(body: Node2D) -> void:
	health = health - 5
	if health <= 0:
		get_tree().reload_current_scene()
		
