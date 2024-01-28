extends Node

class_name Card

var CardType
var Cost
var Health
var Name
var Description
var ArtPath
var Attack
		
func _init(card_type: String = "Unit", cost: int = 0, attack: int = 0, health: int = 0, card_name: String = "Card Not found",
		description: String = "This card is missing. Please report this incident to your local card finding agency.",
		art_path: String = "res://Assets/Cards/cardBack_blue3.png"):
	self.CardType = card_type
	self.Cost = cost
	self.Health = health
	self.Name = card_name
	self.Attack = attack
	self.Description = description
	self.ArtPath = art_path
	pass

