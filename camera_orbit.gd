extends Node3D

var lookSensitivity: float = 15.0;
var minLookAngle: float = -20.0;
var maxLookAngle: float = 75.0;

var mouseDelta = Vector2();
@onready var player = get_parent()

func _process(delta):
	var rot = Vector3(mouseDelta.y, mouseDelta.x, 0) * lookSensitivity * delta
	rotation_degrees.x += rot.x
	rotation_degrees.x = clamp(rotation_degrees.x, minLookAngle, maxLookAngle)
	
	player.rotation_degrees.y -= rot.y
	mouseDelta = Vector2()

func _input(event):
	if get_tree().paused:
		return
		
	if event is InputEventMouseMotion:
		mouseDelta = event.relative
