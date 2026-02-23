#!/usr/bin/env bash

input=$(cat)
SIZE=$(echo "$input" | jq -r '.context_window.context_window_size')
TOKENS=$(echo "$input" | jq -r '.context_window.current_usage | .input_tokens + .cache_creation_input_tokens + .cache_read_input_tokens // 0')
MODEL=$(echo "$input" | jq -r '.model.display_name')
COST=$(echo "$input" | jq -r '.cost.total_cost_usd // 0')
PCT=$((TOKENS * 100 / SIZE))
printf '%s | %.1fk (%d%%) | $%.2f\n' "$MODEL" "$(echo "scale=1; $TOKENS/1000" | bc)" "$PCT" "$COST"
