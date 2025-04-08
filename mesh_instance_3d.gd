extends MeshInstance3D  # or Node3D, depending on where you place this

@onready var clue_label = $ClueLabel3D
@onready var player = get_node("/root/Main/FPVCharacter")  # Adjust to your actual player path

const INTERACT_DISTANCE = 3.0

func _process(delta):
	if Input.is_action_just_pressed("interact"):  # Make sure to define this in Input Map as "E"
		var distance = global_transform.origin.distance_to(player.global_transform.origin)
		if distance <= INTERACT_DISTANCE:
			clue_label.visible = not clue_label.visible  # toggle on/off
