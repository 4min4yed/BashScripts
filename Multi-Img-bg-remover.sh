#!/bin/bash

echo "Welcome to the automatic multi-image background remover made by Mohamed Amin Ayed, Powered by remove.bg"
sleep 1
echo "You should enter your API key (Get yours from https://www.remove.bg/dashboard#api-key) and then the image extension (e.g., jpg, png)"
echo "This is mine: H1fTgWP5Abvdr7ceaQ6BYXEM"

if [ $# -ne 2 ]; then
  echo "Usage: $0 <API_KEY> <image_extension>"
  exit 1
fi

API_KEY="$1"
EXT="$2"

for i in *."$EXT"; do
  echo "Processing $i..."
  response=$(curl -s -w "%{http_code}" -o "${i%.*}-no-bg.png" \
    -H "X-API-Key: $API_KEY" \
    -F image_file=@"$i" \
    -F size=auto \
    https://api.remove.bg/v1.0/removebg)

  if [ "$response" -eq 429 ]; then
    echo "X Rate limit hit. Waiting 51 seconds..."
    sleep 51
    continue
  elif [ "$response" -ne 200 ]; then
    echo "X Failed to process $i. HTTP $response"
  else
    echo "V Done: $i"
  fi

  sleep 1
done
