for file in `find . -name "*.py"`; do
  pylint $file
done
