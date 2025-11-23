const express = require("express");
const app = express();

app.use(express.json());
app.use(express.static("public"));

app.get("/api/about", (req, res) => {
    res.json({
        description: "Welcome to Moffat Bay Lodge, your serene escape nestled in the heart of the San Juan Islands. Our lodge offers comfortable accommodations, breathtaking waterfront views, and a variety of outdoor activities to make your vacation unforgettable. Whether you’re looking to relax by the water, explore the surrounding nature, or enjoy local cuisine, our team is dedicated to providing a warm and memorable experience for every guest. Discover the perfect blend of adventure and relaxation at Moffat Bay Lodge—your home away from home.We are a collaborative development team focused on creating high-quality web applications and user-centered digital solutions."
    });
});

app.listen(3000, () => {
    console.log("Server running on http://localhost:3000");
});
