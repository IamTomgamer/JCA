extends Node

func OpenDash():
	get_tree().change_scene_to_file("res://Dashboard/Dashboard.tscn")
	
func OpenProjects():
	get_tree().change_scene_to_file("res://Project Manager/ProjectManager.tscn")
	
