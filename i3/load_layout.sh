i=1
for file in $(\ls -v ~/.config/i3/workspace_*.json)
do
    i3-msg "workspace $i; append_layout $file"
    grep class $file|awk '{print $2}'|sed 's/[^a-zA-Z0-9]//g'|tr [:upper:] [:lower:]|while read apps
    do
        echo
        $apps &
    done
    ((i++))
done

i3-msg "workspace 1;"
