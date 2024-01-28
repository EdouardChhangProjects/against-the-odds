extends Node2D

class_name Battle

signal turn_ended()

@onready var end_turn_button = $CanvasLayer/EndTurnButton/Button
@onready var player_hp = $CanvasLayer/PlayerHp/Label
@onready var battlefield = $CanvasLayer/Battlefield as Battlefield
@onready var hand = $CanvasLayer/Hand as Hand

var hp = 20

signal pressed()

func _ready():
	end_turn_button.pressed.connect(_on_end_turn_button_pressed)
	pass

func _on_end_turn_button_pressed():
	end_turn_button.disabled = true
	print(battlefield.get_child_count())
	if battlefield.get_child_count():
		for child in battlefield.get_children():
			hp -= child.getAttack()
			print(child.getAttack())
	player_hp.text = str(hp)
	if hp < 0:
		get_tree().quit()
	end_turn_button.disabled = false
	pass


func _on_deck_gui_input(event):
	pass # Replace with function body.
