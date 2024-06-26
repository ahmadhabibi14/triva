CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(100) UNIQUE NOT NULL,
  full_name VARCHAR(255) NOT NULL,
  email VARCHAR(100) UNIQUE,
  password VARCHAR(100) NOT NULL,
  avatar_url VARCHAR(255) NOT NULL DEFAULT '/img/avatars/default.png',
  google_id VARCHAR(255) DEFAULT '',
  facebook_id VARCHAR(255) DEFAULT '',
  github_id VARCHAR(255) DEFAULT '',
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT now(),
  updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT now(),
  deleted_at TIMESTAMP WITHOUT TIME ZONE
);