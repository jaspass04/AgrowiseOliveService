package agrowise;

import java.util.Date;

public class Event {

    private String eventName; // Primary key
    private String fieldName;
    private Date date;
    private String description;
    private String username; // Associated username

    // Constructor
    public Event(String eventName, String fieldName, Date date, String description, String username) {
        this.eventName = eventName;
        this.fieldName = fieldName;
        this.date = date;
        this.description = description;
        this.username = username;
    }

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

    public String getFieldName() {
        return fieldName;
    }

    public void setFieldName(String fieldName) {
        this.fieldName = fieldName;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
