extends VBoxContainer




# Store the original position so it doesn't "drift" downward
var original_y: float

@onready var line_edit = $Settings/Right/Budget/LineEdit

func _ready() -> void:
	# Capture the correct Y position once at the start
	original_y = line_edit.position.y

func _on_check_button_toggled(is_on: bool) -> void:
	# Kill any active tweens to prevent them from fighting each other
	var tween = create_tween().set_parallel(true)
	
	if is_on:
		line_edit.show()
		# Fade In
		tween.tween_property(line_edit, "modulate:a", 1.0, 0.3).from(0.0)
		# Slide from original_y + 10 back to exactly original_y
		tween.tween_property(line_edit, "position:y", original_y, 0.4).from(original_y + 10).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
	else:
		# Fade Out
		tween.tween_property(line_edit, "modulate:a", 0.0, 0.2)
		# Slide down away from original_y
		tween.tween_property(line_edit, "position:y", original_y + 10, 0.2).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN)
		
		tween.set_parallel(false)
		tween.tween_callback(line_edit.hide)
