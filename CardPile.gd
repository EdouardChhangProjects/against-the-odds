extends Node

class_name CardPile

var cards = []

func pushCard(card: Card):
	cards.push(card)
	pass

func pushCards(cards: Array[Card]):
	cards.reverse()
	for card in cards:
		card.push(card)
	pass

func popCard():
	if cards.is_empty():
		return Card.new()
	return cards.pop_front()
