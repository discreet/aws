FILES=`find . -name "*.py"`

for file in $FILES; do
  pylint $file
done
