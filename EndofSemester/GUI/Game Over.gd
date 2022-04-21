extends Control




func _on_Restart_pressed():
	get_tree().change_scene("res://EndofSemester-level1.tscn")


func _on_Quit_pressed():
	get_tree().quit()
