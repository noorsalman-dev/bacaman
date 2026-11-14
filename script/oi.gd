extends Area2D


# xCalled when the node enters the scene tree for the first time.

var health = 100
@onready var progress_bar: ProgressBar = $ProgressBar

func _physics_process(delta: float) -> void:
	
	progress_bar.value = health


func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	health = health - 20
	print(health)
	if health <= 0: 
		queue_free() 
