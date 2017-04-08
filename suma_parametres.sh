#!/bin/bash
vars=("$*");
TOTAL="0"
for variable in $vars; do
	TOTAL=$((TOTAL + variable ));
done;

echo "$TOTAL";

