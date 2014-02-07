#!/bin/bash
pmset -g batt | egrep -o '\s(\d+:)?\d+\s' | tr -d ' '
