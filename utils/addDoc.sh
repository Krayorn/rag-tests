#!/bin/bash

# This script interacts with a running ragserver to add some example documents.

set -eux

# 	{"text": "I am a gunslinger called Venom using a rifle with a 200m range."},
#	{"text": "I am a hunter nicknamed one-eye, armed with a bow and some poisonous arrows."}


echo '{
	"documents": [
	{"text": "Characters in the wild imaginary west can be one of four classes, gunslinger, hunter, doctor and mechanic."},
  {"text": "To repell monsters, you need to use a piece of technology called a farstall."},
  {"text": "When fighting monsters, being in a mech is very useful as it provides gunpower and protection."},
  {"text": "Farstall can be carried by human in a backpack, on a horse or on a mech. Bigger forstalls works against bigger monsters."}
]}' | tr -d "\n" | curl \
		-X POST \
    -H 'Content-Type: application/json' \
    -d @- \
    http://localhost:9020/add/