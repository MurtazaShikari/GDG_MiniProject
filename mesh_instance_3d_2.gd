extends MeshInstance3D  # Or StaticBody3D depending on where you attach it

@onready var clue_label = $ClueLabel3D
@onready var clue_timer = $ClueTimer
@onready var player = get_node("/root/Main/FPVCharacter")  # Update path if needed

const INTERACT_DISTANCE = 3.0

func _process(_delta):
	if Input.is_action_just_pressed("interact"):
		var distance = global_transform.origin.distance_to(player.global_transform.origin)
		if distance <= INTERACT_DISTANCE:
			clue_label.visible = true
			clue_timer.start()

func _on_ClueTimer_timeout():
	clue_label.visible = false
