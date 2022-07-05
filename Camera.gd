extends Camera

export var distance = 4.0
export var height = 2.0


# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)
	
	set_as_toplevel(true)
