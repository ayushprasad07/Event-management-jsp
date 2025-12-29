package dao;

import java.sql.*;
import java.util.*;
import model.Event;

public class EventDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/eventdb";
    private String jdbcUsername = "root";
    private String jdbcPassword = "Ayush@2110";

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    // INSERT
    public void insertEvent(Event event) throws Exception {
        String sql = "INSERT INTO events(event_name, event_date) VALUES (?, ?)";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, event.getEventName());
            ps.setDate(2, event.getEventDate());
            ps.executeUpdate();
        }
    }

    // SELECT
    public List<Event> selectAllEvents() throws Exception {
        List<Event> events = new ArrayList<>();
        String sql = "SELECT * FROM events";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                events.add(new Event(
                        rs.getInt("id"),
                        rs.getString("event_name"),
                        rs.getDate("event_date")
                ));
            }
        }
        return events;
    }

    // UPDATE
    public void updateEvent(Event event) throws Exception {
        String sql = "UPDATE events SET event_name=?, event_date=? WHERE id=?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, event.getEventName());
            ps.setDate(2, event.getEventDate());
            ps.setInt(3, event.getId());
            ps.executeUpdate();
        }
    }

    // DELETE
    public void deleteEvent(int id) throws Exception {
        String sql = "DELETE FROM events WHERE id=?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }
}
