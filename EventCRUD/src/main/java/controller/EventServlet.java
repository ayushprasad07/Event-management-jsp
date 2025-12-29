package controller;

import dao.EventDAO;
import model.Event;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class EventServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private EventDAO dao;

    @Override
    public void init() {
        dao = new EventDAO();
    }

    // -------------------- POST --------------------
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        if (action == null) {
            res.sendRedirect("events");
            return;
        }

        try {
            switch (action) {
                case "insert":
                    insertEvent(req);
                    break;

                case "update":
                    updateEvent(req);
                    break;

                case "delete":
                    deleteEvent(req);
                    break;

                default:
                    break;
            }
            res.sendRedirect("events");

        } catch (Exception e) {
            throw new ServletException("Error processing event", e);
        }
    }

    // -------------------- GET --------------------
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            List<Event> events = dao.selectAllEvents();
            req.setAttribute("events", events);
            req.getRequestDispatcher("event-list.jsp").forward(req, res);
        } catch (Exception e) {
            throw new ServletException("Error fetching events", e);
        }
    }

    // -------------------- Helper Methods --------------------
    private void insertEvent(HttpServletRequest req) throws Exception {
        String name = req.getParameter("name");
        String dateStr = req.getParameter("date");

        if (name == null || dateStr == null || name.isEmpty()) {
            throw new Exception("Invalid event data");
        }

        dao.insertEvent(new Event(
                name,
                Date.valueOf(dateStr)
        ));
    }

    private void updateEvent(HttpServletRequest req) throws Exception {
        int id = Integer.parseInt(req.getParameter("id"));

        dao.updateEvent(new Event(
                id,
                req.getParameter("name"),
                Date.valueOf(req.getParameter("date"))
        ));
    }

    private void deleteEvent(HttpServletRequest req) throws Exception {
        int id = Integer.parseInt(req.getParameter("id"));
        dao.deleteEvent(id);
    }
}
