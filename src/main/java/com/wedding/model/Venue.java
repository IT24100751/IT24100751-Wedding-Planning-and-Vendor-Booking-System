package com.wedding.model;

public class Venue extends Vendor {
    private String location;
    private int capacity;
    private boolean outdoorOption;

    public Venue() {
        super();
        setType("Venue");
    }

    public Venue(String id, String name, double price, String contactInfo,
                 String description, String location, int capacity, boolean outdoorOption) {
        super(id, name, "Venue", price, contactInfo, description);
        this.location = location;
        this.capacity = capacity;
        this.outdoorOption = outdoorOption;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public boolean hasOutdoorOption() {
        return outdoorOption;
    }

    public void setOutdoorOption(boolean outdoorOption) {
        this.outdoorOption = outdoorOption;
    }

    @Override
    public String displayDetails() {
        return super.displayDetails() + "\nLocation: " + location +
                "\nCapacity: " + capacity + " guests" +
                "\nOutdoor Option: " + (outdoorOption ? "Yes" : "No");
    }

    @Override
    public String toFileString() {
        return super.toFileString() + "," + location + "," + capacity + "," + outdoorOption;
    }

    public static Venue fromFileString(String fileString) {
        String[] parts = fileString.split(",");
        if (parts.length >= 9) {
            Venue venue = new Venue();
            venue.setId(parts[0]);
            venue.setName(parts[1]);
            venue.setType(parts[2]);
            venue.setPrice(Double.parseDouble(parts[3]));
            venue.setContactInfo(parts[4]);
            venue.setDescription(parts[5]);
            venue.setLocation(parts[6]);
            venue.setCapacity(Integer.parseInt(parts[7]));
            venue.setOutdoorOption(Boolean.parseBoolean(parts[8]));
            return venue;
        }
        return null;
    }
}