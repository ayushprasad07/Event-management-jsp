<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Add Event</title>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: white;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    padding: 20px;
}

.container {
    background: white;
    padding: 40px;
    border-radius: 20px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1), 
                0 1px 8px rgba(0, 0, 0, 0.05);
    max-width: 500px;
    width: 100%;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.container:hover {
    transform: translateY(-5px);
    box-shadow: 0 15px 40px rgba(0, 0, 0, 0.15), 
                0 5px 15px rgba(0, 0, 0, 0.08);
}

h2 {
    color: #2c3e50;
    text-align: center;
    margin-bottom: 30px;
    font-size: 28px;
    animation: fadeInDown 0.8s ease;
    position: relative;
}

h2::after {
    content: '';
    position: absolute;
    bottom: -10px;
    left: 50%;
    transform: translateX(-50%);
    width: 60px;
    height: 3px;
    background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
    border-radius: 2px;
    animation: expandWidth 0.8s ease 0.3s backwards;
}

@keyframes fadeInDown {
    from {
        opacity: 0;
        transform: translateY(-20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

@keyframes expandWidth {
    from {
        width: 0;
    }
    to {
        width: 60px;
    }
}

form {
    animation: fadeIn 1s ease 0.2s backwards;
}

@keyframes fadeIn {
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}

label {
    display: block;
    color: #34495e;
    font-weight: 600;
    margin-bottom: 8px;
    font-size: 14px;
}

input[type="text"],
input[type="date"] {
    width: 100%;
    padding: 12px 16px;
    border: 2px solid #e0e0e0;
    border-radius: 10px;
    font-size: 15px;
    transition: all 0.3s ease;
    background: #fafafa;
    margin-bottom: 20px;
}

input[type="text"]:focus,
input[type="date"]:focus {
    outline: none;
    border-color: #667eea;
    background: white;
    box-shadow: 0 4px 12px rgba(102, 126, 234, 0.15);
    transform: translateY(-2px);
}

button[type="submit"] {
    width: 100%;
    padding: 14px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    border: none;
    border-radius: 10px;
    font-size: 16px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
    box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
    margin-top: 10px;
}

button[type="submit"]:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
}

button[type="submit"]:active {
    transform: translateY(0);
    box-shadow: 0 2px 10px rgba(102, 126, 234, 0.3);
}

.link-container {
    text-align: center;
    margin-top: 25px;
}

a {
    color: #667eea;
    text-decoration: none;
    font-weight: 500;
    position: relative;
    transition: color 0.3s ease;
}

a::after {
    content: '';
    position: absolute;
    width: 0;
    height: 2px;
    bottom: -3px;
    left: 50%;
    transform: translateX(-50%);
    background: #667eea;
    transition: width 0.3s ease;
}

a:hover {
    color: #764ba2;
}

a:hover::after {
    width: 100%;
}
</style>
</head>
<body>

<div class="container">
    <h2>Add New Event</h2>

    <form action="events" method="post">
        <input type="hidden" name="action" value="insert">

        <label for="name">Event Name:</label>
        <input type="text" id="name" name="name" required placeholder="Enter event name">

        <label for="date">Event Date:</label>
        <input type="date" id="date" name="date" required>

        <button type="submit">Add Event</button>
    </form>

    <div class="link-container">
        <a href="events">View All Events</a>
    </div>
</div>

</body>
</html>
