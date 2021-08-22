NEW="17 38 58 79 199 208 225 233 243 370 375 382"
OLD="93 99 125 129 134 157 172 173 176 183 310 331 364 400 496 "

ALL="$NEW $OLD"

for A in $ALL; do
	for B in tex pdf png; do
		cp example_$A.$B h_example_${A}.$B
	done
done
