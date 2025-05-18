package com.wedding.util;

import com.wedding.model.Vendor;
import java.util.ArrayList;
import java.util.List;

public class VendorLinkedList {
    private VendorNode head;
    private int size;

    public VendorLinkedList() {
        this.head = null;
        this.size = 0;
    }

    // Add a vendor to the end of the list
    public void add(Vendor vendor) {
        VendorNode newNode = new VendorNode(vendor);

        if (head == null) {
            head = newNode;
        } else {
            VendorNode current = head;
            while (current.getNext() != null) {
                current = current.getNext();
            }
            current.setNext(newNode);
        }
        size++;
    }

    // Get vendor by ID
    public Vendor getById(String id) {
        VendorNode current = head;
        while (current != null) {
            if (current.getVendor().getId().equals(id)) {
                return current.getVendor();
            }
            current = current.getNext();
        }
        return null;
    }

    // Update a vendor
    public boolean update(Vendor updatedVendor) {
        VendorNode current = head;
        while (current != null) {
            if (current.getVendor().getId().equals(updatedVendor.getId())) {
                current.setVendor(updatedVendor);
                return true;
            }
            current = current.getNext();
        }
        return false;
    }

    // Delete a vendor by ID
    public boolean delete(String id) {
        if (head == null) {
            return false;
        }

        if (head.getVendor().getId().equals(id)) {
            head = head.getNext();
            size--;
            return true;
        }

        VendorNode current = head;
        while (current.getNext() != null) {
            if (current.getNext().getVendor().getId().equals(id)) {
                current.setNext(current.getNext().getNext());
                size--;
                return true;
            }
            current = current.getNext();
        }
        return false;
    }

    // Search vendors by type
    public List<Vendor> searchByType(String type) {
        List<Vendor> results = new ArrayList<>();
        VendorNode current = head;

        while (current != null) {
            if (current.getVendor().getType().equalsIgnoreCase(type)) {
                results.add(current.getVendor());
            }
            current = current.getNext();
        }

        return results;
    }

    // Search vendors by name (partial match)
    public List<Vendor> searchByName(String name) {
        List<Vendor> results = new ArrayList<>();
        VendorNode current = head;

        while (current != null) {
            if (current.getVendor().getName().toLowerCase().contains(name.toLowerCase())) {
                results.add(current.getVendor());
            }
            current = current.getNext();
        }

        return results;
    }

    // Get all vendors
    public List<Vendor> getAllVendors() {
        List<Vendor> allVendors = new ArrayList<>();
        VendorNode current = head;

        while (current != null) {
            allVendors.add(current.getVendor());
            current = current.getNext();
        }

        return allVendors;
    }

    // Get size of the list
    public int size() {
        return size;
    }

    // Check if the list is empty
    public boolean isEmpty() {
        return head == null;
    }
}