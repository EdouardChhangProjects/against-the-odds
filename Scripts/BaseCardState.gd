extends CardState

const MINIMUM_THRESHOLD := 0.05

var min_time_elapsed : bool = true

func enter() -> void:
	if not card_ui.is_node_ready():
		await card_ui.ready
	card_ui.reparent_requested.emit(card_ui)
	
	min_time_elapsed = false
	var timer := get_tree().create_timer(MINIMUM_THRESHOLD, false)
	timer.timeout.connect(func(): min_time_elapsed = true)

func on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_mouse") and min_time_elapsed:
		card_ui.pivot_offset = card_ui.get_global_mouse_position() - card_ui.global_position
		transition_requested.emit(self, CardState.State.CLICKED)
