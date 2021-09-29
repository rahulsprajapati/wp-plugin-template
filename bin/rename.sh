#!/usr/bin/env bash

SLUG=''
NAMESPACE=''

for arg; do
	shift
	case $arg in
	--slug*)
		SLUG=${arg//"--slug="/}
		;;
	--namespace*)
		NAMESPACE=${arg//"--namespace="/}
		;;
	*)
		set -- "$@" "$arg"
		;;
	esac
done

if [ -n "$SLUG" ]; then	
	echo "Updating plugin slug with $SLUG"
	grep -rl wp-plugin-template . --exclude-dir={node_modules,vendor,.history,.git,bin} | xargs sed -i '' "s/wp-plugin-template/$SLUG/g"

	echo "Updating plugin files with $SLUG"
	find . -name 'wp-plugin-template*' -type f | sed -e "p;s/wp-plugin-template/$SLUG/"  | xargs -n2 mv
fi

if [ -n "$NAMESPACE" ]; then
	echo "Updating plugin namespace with $NAMESPACE"
	grep -rl WP_Plugin_Template . --exclude-dir={node_modules,vendor,.history,.git,bin} | xargs sed -i '' "s/WP_Plugin_Template/$NAMESPACE/g"
fi
