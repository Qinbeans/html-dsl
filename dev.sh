# set of commands to run, build, test, and document the project
if [ "$1" == "run" ]; then
	echo "Running the project..."
	gleam run
elif [ "$1" == "build" ]; then
	echo "Building the project..."
	gleam build
elif [ "$1" == "test" ]; then
	echo "Testing the project..."
	gleam test
elif [ "$1" == "docs" ]; then
	echo "Documenting the project..."
	rm -rf docs
	gleam docs build
	mv build/dev/docs/html_dsl docs
else
	echo "Usage: $0 {run|build|test|docs}"
	exit 1
fi

