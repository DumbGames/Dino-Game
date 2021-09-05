extends KinematicBody2D


const GRAVITY = 30
var MOVE_SPEED = 200
var jumpforce = 800
const UP = Vector2(0, -1)
var max_speed = 500
var Veclocity = Vector2()
onready var anim = $AnimationPlayer
onready var audio = $"jump effect"
func _physics_process(delta):
	
	Veclocity.y += GRAVITY
	Veclocity.x += MOVE_SPEED
	if Veclocity.x > max_speed:
		Veclocity.x = max_speed
	
	Veclocity = move_and_slide(Veclocity, UP)
	
	if is_on_floor():
		anim.play("Run")
		if Input.is_action_pressed("jumpp"):
			Veclocity.y = -jumpforce
			audio.play()
func die():
	get_tree().change_scene("res://scenes/failed.tscn")

func _on_Button_pressed():
	if is_on_floor():
		anim.play("Run")
		Veclocity.y = -jumpforce
		audio.play()

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		$Label.visible = true



func _on_Area2D2_body_entered(body):
	get_tree().change_scene("res://scenes/Win.tscn")
