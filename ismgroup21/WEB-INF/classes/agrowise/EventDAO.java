package agrowise;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class EventDAO {

    private static final DB db = new DB(); // Use a single DB instance

    // Fetch events for a specific user
    public List<Event> getEventsForUser(String username) {
        List<Event> events = new ArrayList<>();

        String query = "SELECT eventName, fieldName, date, description, username FROM events WHERE username = ?";
        try (Connection conn = db.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, username);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    String eventName = rs.getString("eventName");
                    String fieldName = rs.getString("fieldName");
                    Date date = rs.getDate("date");
                    String description = rs.getString("description");

                    events.add(new Event(eventName, fieldName, date, description, username));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return events;
    }

    // Add a new event
    public void addEvent(Event event) {
        String query = "INSERT INTO events (eventName, fieldName, date, description, username) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = db.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, event.getEventName());
            stmt.setString(2, event.getFieldName());
            stmt.setDate(3, new java.sql.Date(event.getDate().getTime()));
            stmt.setString(4, event.getDescription());
            stmt.setString(5, event.getUsername());

            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Update an existing event
    public void updateEvent(String eventName, String fieldName, Date date, String description, String username) {
        String query = "UPDATE events SET fieldName = ?, date = ?, description = ? WHERE eventName = ? AND username = ?";
        try (Connection conn = db.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, fieldName);
            stmt.setDate(2, new java.sql.Date(date.getTime()));
            stmt.setString(3, description);
            stmt.setString(4, eventName);
            stmt.setString(5, username);

            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Delete an event
    public void deleteEvent(String eventName, String username) {
        String query = "DELETE FROM events WHERE eventName = ? AND username = ?";
        try (Connection conn = db.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, eventName);
            stmt.setString(2, username);

            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
