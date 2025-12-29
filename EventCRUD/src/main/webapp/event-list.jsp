<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Event" %>

<!DOCTYPE html>
<html>
<head>
    <title>Event List</title>
    <style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: white;
    padding: 40px 20px;
    min-height: 100vh;
}

.container {
    max-width: 1200px;
    margin: 0 auto;
}

h2 {
    color: #2c3e50;
    margin-bottom: 30px;
    font-size: 32px;
    animation: fadeInDown 0.8s ease;
    position: relative;
    display: inline-block;
}

h2::after {
    content: '';
    position: absolute;
    bottom: -10px;
    left: 0;
    width: 80px;
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
        width: 80px;
    }
}

.header-section {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 30px;
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

.add-btn {
    padding: 12px 24px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    text-decoration: none;
    border-radius: 10px;
    font-weight: 600;
    transition: all 0.3s ease;
    box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
    display: inline-block;
}

.add-btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
}

.table-wrapper {
    background: white;
    border-radius: 15px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1), 
                0 1px 8px rgba(0, 0, 0, 0.05);
    overflow: hidden;
    animation: fadeInUp 1s ease 0.4s backwards;
}

@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(30px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

table {
    width: 100%;
    border-collapse: collapse;
}

thead {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}

thead th {
    color: white;
    padding: 18px 15px;
    text-align: left;
    font-weight: 600;
    font-size: 14px;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

tbody tr {
    border-bottom: 1px solid #f0f0f0;
    transition: all 0.3s ease;
}

tbody tr:hover {
    background: #f8f9ff;
    transform: scale(1.01);
    box-shadow: 0 4px 12px rgba(102, 126, 234, 0.1);
}

tbody tr:last-child {
    border-bottom: none;
}

tbody td {
    padding: 16px 15px;
    color: #34495e;
    font-size: 15px;
}

tbody td:first-child {
    font-weight: 600;
    color: #667eea;
}

.actions {
    display: flex;
    gap: 10px;
    align-items: center;
}

.edit-link {
    color: #667eea;
    text-decoration: none;
    font-weight: 500;
    padding: 8px 16px;
    border-radius: 6px;
    transition: all 0.3s ease;
    background: #f0f3ff;
}

.edit-link:hover {
    background: #667eea;
    color: white;
    transform: translateY(-2px);
    box-shadow: 0 4px 10px rgba(102, 126, 234, 0.3);
}

.delete-btn {
    background: #ff4757;
    color: white;
    border: none;
    padding: 8px 16px;
    border-radius: 6px;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.3s ease;
    font-size: 14px;
}

.delete-btn:hover {
    background: #ff3838;
    transform: translateY(-2px);
    box-shadow: 0 4px 10px rgba(255, 71, 87, 0.3);
}

.delete-btn:active {
    transform: translateY(0);
}

.empty-state {
    text-align: center;
    padding: 60px 20px;
    color: #95a5a6;
}

.empty-state p {
    font-size: 18px;
    margin-bottom: 20px;
}

@media (max-width: 768px) {
    .header-section {
        flex-direction: column;
        align-items: flex-start;
        gap: 20px;
    }
    
    table {
        font-size: 14px;
    }
    
    thead th,
    tbody td {
        padding: 12px 10px;
    }
    
    .actions {
        flex-direction: column;
        gap: 5px;
        align-items: flex-start;
    }
}
    </style>
</head>
<body>

<div class="container">
    <div class="header-section">
        <h2>Event List</h2>
        <a href="event-form.jsp" class="add-btn">+ Add New Event</a>
    </div>

    <div class="table-wrapper">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Event Name</th>
                    <th>Event Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
<%
    List<Event> events = (List<Event>) request.getAttribute("events");
    if (events != null && !events.isEmpty()) {
        for (Event e : events) {
%>
                <tr>
                    <td><%= e.getId() %></td>
                    <td><%= e.getEventName() %></td>
                    <td><%= e.getEventDate() %></td>
                    <td>
                        <div class="actions">
                            <a href="event-edit.jsp?id=<%= e.getId() %>&name=<%= e.getEventName() %>&date=<%= e.getEventDate() %>" 
                               class="edit-link">
                                Edit
                            </a>
                            
                            <form action="events" method="post" style="display:inline; margin:0;">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="<%= e.getId() %>">
                                <button type="submit" class="delete-btn" 
                                        onclick="return confirm('Delete this event?');">
                                    Delete
                                </button>
                            </form>
                        </div>
                    </td>
                </tr>
<%
        }
    } else {
%>
                <tr>
                    <td colspan="4" class="empty-state">
                        <p>No events found</p>
                        <a href="event-form.jsp" class="add-btn">Create Your First Event</a>
                    </td>
                </tr>
<%
    }
%>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
