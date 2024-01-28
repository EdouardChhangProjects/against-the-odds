extends Control

var hp: int = 20

func damage(value: int) -> void:
	hp -= value
	$Label.text = str(hp)
	pass

func get_hp() -> int:
	return hp

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
