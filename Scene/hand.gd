extends HBoxContainer

class_name Hand

func addCard(card: CardUI):
	if card.get_parent():
		card.reparent(self)
	pass

func _ready() -> void:
	for child in get_children():
		var card_ui := child as CardUI
		card_ui.reparent_requested.connect(_on_card_ui_reparent_requested)
	pass


func _on_card_ui_reparent_requested(child: CardUI) -> void:
	child.reparent(self)
