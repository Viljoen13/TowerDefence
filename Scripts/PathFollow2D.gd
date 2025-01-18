extends PathFollow2D

export var speed: float = 100.0

func _ready():
	# Set the initial offset to zero or a random value if you want staggered spawns
	offset = 0

func _process(delta):
	# Move the unit along the path
	offset += speed * delta
