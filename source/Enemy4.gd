extends Area2D



func _on_Enemy4_body_entered(body):
	if body.name == "Dino":
		body.die()
