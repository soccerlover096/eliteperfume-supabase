const jwt = require('jsonwebtoken');
const secret = 'ElitePerfume2025SuperSecretJWTTokenWithAtLeast32Chars';

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