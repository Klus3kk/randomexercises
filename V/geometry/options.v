module geometry

pub enum GeometricShapeKind {
	left_triangle
	right_triangle
	pyramid
	square
	diamond
}

pub struct ShapeOptions {
	kind   GeometricShapeKind
	size   int
	symbol rune = `*`
}

pub fn (options ShapeOptions) are_valid() bool {
	return options.size > 0 && options.symbol != 0
}

pub const shape_map = {
	'left-triangle':  GeometricShapeKind.left_triangle
	'right-triangle': GeometricShapeKind.right_triangle
	'pyramid':        GeometricShapeKind.pyramid
	'square':         GeometricShapeKind.square
	'diamond':        GeometricShapeKind.diamond
}

pub const allowed_shapes = shape_map.keys()

pub fn generate_shape(options ShapeOptions) []string {
	return match options.kind {
		.left_triangle { ['left_triangle'] }
		.right_triangle { ['right_triangle'] }
		.pyramid { ['pyramid'] }
		.square { ['square'] }
		.diamond { ['diamond'] }
	}
}
