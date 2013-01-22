#!/bin/bash -e

# run a set of Dart Unit tests that
# rely on the the DOM
results=$(DumpRenderTree test/ToDoApp_test.html)
echo -e "$results"

# check to see if DumpRenderTree tests
# fails, since it always returns 0
if [[ "$results" == *"Some tests failed"* ]]
then
  exit 1
fi

exit 0
