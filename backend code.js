const express = require("express");
const sqlite3 = require("sqlite3").verbose();
const bodyParser = require("body-parser");

const app = express();
app.use(bodyParser.urlencoded({ extended: true }));

// DATABASE
const db = new sqlite3.Database("./users.db");

// Create table if not exists
db.run(`
    CREATE TABLE IF NOT EXISTS users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT UNIQUE,
        password TEXT
    )
`);

// LOGIN PAGE ROUTE
app.get("/login", (req, res) => {
    res.sendFile(__dirname + "/login.html");
});

// LOGIN POST ROUTE
app.post("/login", (req, res) => {
    const { username, password } = req.body;

    db.get(
        "SELECT * FROM users WHERE username = ? AND password = ?",
        [username, password],
        (err, row) => {
            if (row) {
                res.send("Login successful!");
            } else {
                res.send("Invalid username or password.");
            }
        }
    );
});

// START SERVER
app.listen(3000, () => console.log("Server running on http://localhost:3000"));
