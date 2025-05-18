package com.wedding.model;

public class Caterer extends Vendor {
    private String cuisine;
    private int maxCapacity;

    public Caterer() {
        super();
        setType("Caterer");
    }

    public Caterer(String id, String name, double price, String contactInfo,
                   String description, String cuisine, int maxCapacity) {
        super(id, name, "Caterer", price, contactInfo, description);
        this.cuisine = cuisine;
        this.maxCapacity = maxCapacity;
    }

    public String getCuisine() {
        return cuisine;
    }

    public void setCuisine(String cuisine) {
        this.cuisine = cuisine;
    }

    public int getMaxCapacity() {
        return maxCapacity;
    }

    public void setMaxCapacity(int maxCapacity) {
        this.maxCapacity = maxCapacity;
    }

    @Override
    public String displayDetails() {
        return super.displayDetails() + "\nCuisine: " + cuisine +
                "\nMaximum Capacity: " + maxCapacity + " guests";
    }

    @Override
    public String toFileString() {
        return super.toFileString() + "," + cuisine + "," + maxCapacity;
    }

    public static Caterer fromFileString(String fileString) {
        String[] parts = fileString.split(",");
        if (parts.length >= 8) {
            Caterer caterer = new Caterer();
            caterer.setId(parts[0]);
            caterer.setName(parts[1]);
            caterer.setType(parts[2]);
            caterer.setPrice(Double.parseDouble(parts[3]));
            caterer.setContactInfo(parts[4]);
            caterer.setDescription(parts[5]);
            caterer.setCuisine(parts[6]);
            caterer.setMaxCapacity(Integer.parseInt(parts[7]));
            return caterer;
        }
        return null;
    }
}