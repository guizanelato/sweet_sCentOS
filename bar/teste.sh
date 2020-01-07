#iktop numbers start at 0. if you want desktop 2 to be in second place,
# start counting from 1 instead of 0. But wou'll lose a group ;)
for w in `seq 0 $((cur - 1))`; do line="${line}="; done

# enough =, let's print the current desktop
line="${line}|"

# En then the other groups
for w in `seq $((cur + 2)) $tot`; do line="${line}="; done

# don't forget to print that line!
echo $line
