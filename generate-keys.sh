#!/bin/bash

# This script generates the ANON_KEY and SERVICE_ROLE_KEY based on your JWT_SECRET
# Run this after setting your JWT_SECRET in .env

if [ ! -f .env ]; then
    echo "Error: .env file not found!"
    exit 1
fi

source .env

if [ -z "$JWT_SECRET" ]; then
    echo "Error: JWT_SECRET not set in .env file!"
    exit 1
fi

echo "Generating keys with JWT_SECRET..."

# You'll need to install Node.js and run:
# npm install -g jsonwebtoken

echo "Please install Node.js and run the following commands to generate your keys:"
echo ""
echo "npm install jsonwebtoken"
echo ""
echo "Then create a file generate-jwt.js with:"
echo ""
cat << 'EOF'
const jwt = require('jsonwebtoken');
const secret = process.env.JWT_SECRET;

const anonToken = jwt.sign(
  {
    iss: 'supabase-demo',
    role: 'anon',
    exp: Math.floor(Date.now() / 1000) + (60 * 60 * 24 * 365 * 10) // 10 years
  },
  secret
);

const serviceToken = jwt.sign(
  {
    iss: 'supabase-demo',
    role: 'service_role',
    exp: Math.floor(Date.now() / 1000) + (60 * 60 * 24 * 365 * 10) // 10 years
  },
  secret
);

console.log('ANON_KEY=' + anonToken);
console.log('SERVICE_ROLE_KEY=' + serviceToken);
EOF

echo ""
echo "Then run: JWT_SECRET='$JWT_SECRET' node generate-jwt.js"
echo ""
echo "Update the generated keys in your .env file."