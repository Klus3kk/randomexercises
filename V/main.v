module main

import os
import flag

fn main() {
	mut fp := flag.new_flag_parser(os.args)

	fp.application('geo')
	fp.version('0.0.1')
	fp.description('A sample CLI application that prints geometric shapes to the console.')
	fp.skip_executable()

	shape := fp.string('shape', `p`, 'none', 'The shape to use for the geometry.').to_lower() // (LONG COMMAND, SHORT COMMAND, DEFAULT VALUE, EXPLANAITION OF THE COMMAND)

	size := fp.int('size', `z`, 5, 'The size parameter for the shapes.') // --size
	symbol := fp.string('symbol', `m`, '*', 'The symbol to use for the geometry.').runes()[0] or { // --symbol -m
		`*`
	}

	additional_args := fp.finalize() !

	if additional_args.len > 0 {
		println('Unprocessed arguments:\n$additional_args.join_lines()')
	}

	println(shape)
	println(size)
	println(symbol)
}