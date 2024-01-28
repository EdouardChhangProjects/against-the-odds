extends Node

# [CardType, Cost, Attack, Health, Name, Description, link to card art]
const CARD_DB : Dictionary = {
	"TestCard" :
		["Unit", 1, 2, 3, "Test Card", "This is a test Card", "res://Assets/Cards/cardBack_blue3.png"],
	"Chevalier" :
		["Unit", 1, 1, 1, "Chevalier", "Melee", "res://Assets/Cards/cardBack_blue3.png"],
	"Ethan" :
		["Unit", 4, 1, 4, "Golem Primordial", "G-O-L-E-M", "res://Assets/Cards/cardBack_blue3.png"],
	"Chat" :
		["Unit", 12, 12, 12, "Chat - Stonaute", "Non", "res://Assets/Cards/cardBack_blue3.png"],
}

static func getCard(card_name: String) -> Card:
	var data = CARD_DB[card_name]
	return Card.new(data[0], data[1], data[2], data[3], data[4], data[5], data[6])
	
"res://Assets/Cards/"
