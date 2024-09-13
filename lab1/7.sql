CREATE TABLE tasks (
    id SERIAL PRIMARY KEY,   -- Auto-incrementing integer
    name VARCHAR(50),        -- String with a maximum length of 50 characters
    user_id INTEGER          -- Integer referencing user
);
