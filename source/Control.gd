extends Control



func _on_TextureButton_pressed():
	get_tree().change_scene("res://scenes/World.tscn")


func _on_TextureButton2_pressed():
	$"/root/Music".stop()
