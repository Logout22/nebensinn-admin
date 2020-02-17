#!/bin/sh
if ! curl -I -q {{external_address}} 2>/dev/null | head -n1 | grep -q 200; then
	echo "Error: unable to reach Ghost home page!" | mail -s "Book club Ghost instance" webmaster
fi
