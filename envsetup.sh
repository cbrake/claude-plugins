cp_drawio_export() {
	if [ -n "$1" ]; then
		drawio_file="$1"
	else
		drawio_file=$(command ls -t **/*.drawio 2>/dev/null | head -n 1)
	fi
	if [ -z "$drawio_file" ] || [ ! -f "$drawio_file" ]; then
		echo "No .drawio file found"
		return 1
	fi
	scale="${2:-2}"
	output="${drawio_file%.drawio}.png"
	echo "Exporting ${drawio_file} to ${output} (scale: ${scale})..."
	drawio --export --format png --border 20 --scale "$scale" --output "$output" "$drawio_file"
	echo "Done: ${output}"
}
