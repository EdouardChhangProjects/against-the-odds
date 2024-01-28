extends Node

class_name CardUI

var CardDB = preload("res://CardDatabase.gd")

signal reparent_requested(which_card_ui: CardUI)

@export var CardName : String = ""
@onready var drop_point_detector = $DropPointDetector
@onready var card_state_machine: CardStateMachine = $CardStateMachine as CardStateMachine

var targets : Array[Node] = []

var card : Card

# Called when the node enters the scene tree for the first time.
func _ready():
	
	card_state_machine.init(self)

	if self.CardName in CardDB.CARD_DB:
		card = CardDB.getCard(self.CardName)
	else:
		card = Card.new()
# TODO
# refactor code so that it works when children are moved
	$MarginContainer/VBoxContainer/CardArt.texture = load(card.ArtPath)
	$MarginContainer/VBoxContainer/NamePanel/Name.text = card.Name
	$MarginContainer/VBoxContainer/DescriptionContainer/Description.text = card.Description
	$Shield/Node2D/HealthLabel.text = str(card.Health)
	$Sword/Node/AttackLabel.text = str(card.Attack)
	$ManaContainer/Node2D/ManaLabel.text = str(card.Cost)
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	card_state_machine.on_input(event)

func _on_mouse_entered() -> void:
	card_state_machine.on_mouse_entered()

func _on_mouse_exited() -> void:
	card_state_machine.on_mouse_exited()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_gui_input(event):
	card_state_machine.on_gui_input(event)
	pass # Replace with function body.

func set_description(desc: String):
	$MarginContainer/VBoxContainer/DescriptionContainer/Description.text = desc

func _on_drop_point_detector_area_entered(area):
	if not targets.has(area):
		targets.append(area)
	pass # Replace with function body.

func _on_drop_point_detector_area_exited(area):
	targets.erase(area)
	pass # Replace with function body.

func getAttack() -> int:
	return card.Attack
