extends Node3D

@onready var camera = $FPVCharacter/Head/Camera3D  # Adjust if your camera is elsewhere

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var from = camera.project_ray_origin(event.position)
		var to = from + camera.project_ray_normal(event.position) * 1000.0

		var query = PhysicsRayQueryParameters3D.new()
		query.from = from
		query.to = to

		var space_state = get_world_3d().direct_space_state
		var result = space_state.intersect_ray(query)

		if result:
			var clicked_node = result.get("collider")
			if clicked_node and clicked_node.name == "BathroomWall1":  # Match this name exactly
				print("Object clicked!")
				get_tree().change_scene_to_file("res://intro.tscn")  # Replace with your actual scene path
				
