extends CardState

var played: bool

func enter() -> void:
	var battlefield := get_tree().get_first_node_in_group("battlefield_layer")
	battlefield.addCard(card_ui)
	pass
