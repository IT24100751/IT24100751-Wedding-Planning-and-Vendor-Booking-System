package com.wedding.service;

import com.wedding.model.*;
import com.wedding.util.VendorLinkedList;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

public class VendorService {
    private static final String VENDORS_FILE = "vendors.txt";
    private VendorLinkedList vendorList;

    public VendorService() {
        vendorList = new VendorLinkedList();
        loadVendorsFromFile();
    }

    // Create a new vendor
    public Vendor createVendor(Vendor vendor) {
        // Generate a unique ID if not provided
        if (vendor.getId() == null || vendor.getId().isEmpty()) {
            vendor.setId(UUID.randomUUID().toString().substring(0, 8));
        }

        vendorList.add(vendor);
        saveVendorsToFile();
        return vendor;
    }

    // Get a vendor by ID
    public Vendor getVendorById(String id) {
        return vendorList.getById(id);
    }

    // Update an existing vendor
    public boolean updateVendor(Vendor vendor) {
        boolean updated = vendorList.update(vendor);
        if (updated) {
            saveVendorsToFile();
        }
        return updated;
    }

    // Delete a vendor by ID
    public boolean deleteVendor(String id) {
        boolean deleted = vendorList.delete(id);
        if (deleted) {
            saveVendorsToFile();
        }
        return deleted;
    }

    // Search vendors by type
    public List<Vendor> searchVendorsByType(String type) {
        return vendorList.searchByType(type);
    }

    // Search vendors by name
    public List<Vendor> searchVendorsByName(String name) {
        return vendorList.searchByName(name);
    }

    // Get all vendors
    public List<Vendor> getAllVendors() {
        return vendorList.getAllVendors();
    }

    // Load vendors from file
    private void loadVendorsFromFile() {
        try {
            if (!Files.exists(Paths.get(VENDORS_FILE))) {
                Files.createFile(Paths.get(VENDORS_FILE));
                return;
            }

            BufferedReader reader = new BufferedReader(new FileReader(VENDORS_FILE));
            String line;

            while ((line = reader.readLine()) != null) {
                if (!line.trim().isEmpty()) {
                    String[] parts = line.split(",");
                    if (parts.length >= 6) {
                        Vendor vendor;

                        switch (parts[2]) {
                            case "Photographer":
                                vendor = Photographer.fromFileString(line);
                                break;
                            case "Caterer":
                                vendor = Caterer.fromFileString(line);
                                break;
                            case "Venue":
                                vendor = Venue.fromFileString(line);
                                break;
                            default:
                                vendor = Vendor.fromFileString(line);
                                break;
                        }

                        if (vendor != null) {
                            vendorList.add(vendor);
                        }
                    }
                }
            }

            reader.close();
        } catch (IOException e) {
            System.err.println("Error loading vendors from file: " + e.getMessage());
        }
    }

    // Save vendors to file
    private void saveVendorsToFile() {
        try {
            BufferedWriter writer = new BufferedWriter(new FileWriter(VENDORS_FILE));
            List<Vendor> allVendors = vendorList.getAllVendors();

            for (Vendor vendor : allVendors) {
                writer.write(vendor.toFileString());
                writer.newLine();
            }

            writer.close();
        } catch (IOException e) {
            System.err.println("Error saving vendors to file: " + e.getMessage());
        }
    }

    // Factory method to create specific vendor types
    public Vendor createVendorByType(String type, String id, String name, double price,
                                     String contactInfo, String description, String... additionalInfo) {
        switch (type.toLowerCase()) {
            case "photographer":
                String specialization = additionalInfo.length > 0 ? additionalInfo[0] : "";
                int experience = additionalInfo.length > 1 ? Integer.parseInt(additionalInfo[1]) : 0;
                return new Photographer(id, name, price, contactInfo, description, specialization, experience);

            case "caterer":
                String cuisine = additionalInfo.length > 0 ? additionalInfo[0] : "";
                int maxCapacity = additionalInfo.length > 1 ? Integer.parseInt(additionalInfo[1]) : 0;
                return new Caterer(id, name, price, contactInfo, description, cuisine, maxCapacity);

            case "venue":
                String location = additionalInfo.length > 0 ? additionalInfo[0] : "";
                int capacity = additionalInfo.length > 1 ? Integer.parseInt(additionalInfo[1]) : 0;
                boolean outdoorOption = additionalInfo.length > 2 && Boolean.parseBoolean(additionalInfo[2]);
                return new Venue(id, name, price, contactInfo, description, location, capacity, outdoorOption);

            default:
                return new Vendor(id, name, type, price, contactInfo, description);
        }
    }
}