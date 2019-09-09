extends MeshInstance2D

func _ready() -> void:
	
	make_mesh()

func make_mesh():
	var vertices = PoolVector2Array()
	vertices.push_back(Vector2(0, 1))
	vertices.push_back(Vector2(1, 0))
	vertices.push_back(Vector2(0, 0))
	# Initialize the ArrayMesh.
	var arr_mesh = ArrayMesh.new()
	var arrays = []
	arrays.resize(ArrayMesh.ARRAY_MAX)
	arrays[ArrayMesh.ARRAY_VERTEX] = vertices
	# Create the Mesh.
	arr_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)
	var m = MeshInstance2D.new()
	mesh = arr_mesh
	print(mesh)


#func _process(delta: float) -> void:
#	make_mesh()