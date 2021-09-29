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

if [ -z "$SLUG" ]; then
	echo "Slug not found, Please provide --slug arg to procced with rename..."
	exit;
fi

if [ -z "$NAMESPACE" ]; then
	echo "Namespace not found, Please provide --namespace arg to procced with rename..."
	exit;
fi

echo "Updating plugin slug with $SLUG"
grep -rl wp-plugin-template . --exclude-dir={node_modules,vendor,.history,.git,bin} | xargs sed -i '' "s/wp-plugin-template/$SLUG/g"

echo "Updating plugin files with $SLUG"
find . -name 'wp-plugin-template*' -type f | sed -e "p;s/wp-plugin-template/$SLUG/"  | xargs -n2 mv

echo "Updating plugin namespace with $NAMESPACE"
grep -rl WP_Plugin_Template . --exclude-dir={node_modules,vendor,.history,.git,bin} | xargs sed -i '' "s/WP_Plugin_Template/$NAMESPACE/g"
