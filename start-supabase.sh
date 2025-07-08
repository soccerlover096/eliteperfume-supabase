#!/bin/bash

# Navigate to project directory
cd /home/atlatl/eliteperfume-supabase

# Start Supabase containers
echo "Starting Supabase containers..."
docker compose up -d

# Check if all containers are running
echo "Checking container status..."
sleep 5
docker compose ps

echo "Supabase services should be accessible at:"
echo "- API: http://localhost:8000"
echo "- Studio: http://localhost:3001"
echo "- Database: localhost:5432"
