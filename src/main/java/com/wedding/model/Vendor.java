package com.wedding.model;

import java.io.Serializable;

public class Vendor implements Serializable {
    private String id;
    private String name;
    private String type;
    private double price;
    private String contactInfo;
    private String description;

    // Default constructor
    public Vendor() {
    }

    // Parameterized constructor
    public Vendor(String id, String name, String type, double price, String contactInfo, String description) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.price = price;
        this.contactInfo = contactInfo;
        this.description = description;
    }

    // Getters and Setters (Encapsulation)
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getContactInfo() {
        return contactInfo;
    }

    public void setContactInfo(String contactInfo) {
        this.contactInfo = contactInfo;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    // Method to display vendor details (will be overridden by subclasses)
    public String displayDetails() {
        return "Vendor: " + name + " (" + type + ") - $" + price + " - Contact: " + contactInfo;
    }

    // Method to convert vendor to string format for storage in text file
    public String toFileString() {
        return id + "," + name + "," + type + "," + price + "," + contactInfo + "," + description;
    }

    // Method to create vendor from string format from text file
    public static Vendor fromFileString(String fileString) {
        String[] parts = fileString.split(",");
        if (parts.length >= 6) {
            return new Vendor(
                    parts[0],
                    parts[1],
                    parts[2],
                    Double.parseDouble(parts[3]),
                    parts[4],
                    parts[5]
            );
        }
        return null;
    }

    @Override
    public String toString() {
        return displayDetails();
    }
}