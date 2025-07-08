#!/bin/bash

# Navigate to project directory
cd /home/atlatl/eliteperfume-supabase

# Stop Supabase containers
echo "Stopping Supabase containers..."
docker compose down

echo "All containers stopped."
