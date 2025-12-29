package model;

import java.sql.Date;

public class Event {
    private int id;
    private String eventName;
    private Date eventDate;

    public Event() {}

    public Event(int id, String eventName, Date eventDate) {
        this.id = id;
        this.eventName = eventName;
        this.eventDate = eventDate;
    }

    public Event(String eventName, Date eventDate) {
        this.eventName = eventName;
        this.eventDate = eventDate;
    }

    public int getId() { return id; }
    public String getEventName() { return eventName; }
    public Date getEventDate() { return eventDate; }

    public void setId(int id) { this.id = id; }
    public void setEventName(String eventName) { this.eventName = eventName; }
    public void setEventDate(Date eventDate) { this.eventDate = eventDate; }
}
