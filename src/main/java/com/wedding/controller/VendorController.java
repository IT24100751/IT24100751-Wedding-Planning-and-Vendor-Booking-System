package com.wedding.controller;

import com.wedding.model.*;
import com.wedding.service.VendorService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/vendors")
public class VendorController {

    private final VendorService vendorService;

    public VendorController() {
        this.vendorService = new VendorService();
    }

    // Show all vendors
    @GetMapping
    public String listVendors(Model model) {
        List<Vendor> vendors = vendorService.getAllVendors();
        model.addAttribute("vendors", vendors);
        return "vendor/list";
    }

    // Show vendor registration form
    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("vendor", new Vendor());
        return "vendor/register";
    }

    // Process vendor registration
    @PostMapping("/register")
    public String registerVendor(@RequestParam("type") String type,
                                 @RequestParam("name") String name,
                                 @RequestParam("price") double price,
                                 @RequestParam("contactInfo") String contactInfo,
                                 @RequestParam("description") String description,
                                 @RequestParam(value = "specialization", required = false) String specialization,
                                 @RequestParam(value = "experienceYears", required = false, defaultValue = "0") int experienceYears,
                                 @RequestParam(value = "cuisine", required = false) String cuisine,
                                 @RequestParam(value = "maxCapacity", required = false, defaultValue = "0") int maxCapacity,
                                 @RequestParam(value = "location", required = false) String location,
                                 @RequestParam(value = "capacity", required = false, defaultValue = "0") int capacity,
                                 @RequestParam(value = "outdoorOption", required = false, defaultValue = "false") boolean outdoorOption,
                                 RedirectAttributes redirectAttributes) {

        Vendor vendor;

        switch (type.toLowerCase()) {
            case "photographer":
                vendor = vendorService.createVendorByType(type, "", name, price, contactInfo, description,
                        specialization, String.valueOf(experienceYears));
                break;
            case "caterer":
                vendor = vendorService.createVendorByType(type, "", name, price, contactInfo, description,
                        cuisine, String.valueOf(maxCapacity));
                break;
            case "venue":
                vendor = vendorService.createVendorByType(type, "", name, price, contactInfo, description,
                        location, String.valueOf(capacity), String.valueOf(outdoorOption));
                break;
            default:
                vendor = new Vendor("", name, type, price, contactInfo, description);
                break;
        }

        vendorService.createVendor(vendor);
        redirectAttributes.addFlashAttribute("message", "Vendor registered successfully!");
        return "redirect:/vendors";
    }

    // Show vendor details
    @GetMapping("/{id}")
    public String viewVendor(@PathVariable("id") String id, Model model) {
        Vendor vendor = vendorService.getVendorById(id);
        if (vendor == null) {
            return "redirect:/vendors";
        }
        model.addAttribute("vendor", vendor);
        return "vendor/view";
    }

    // Show edit form
    @GetMapping("/{id}/edit")
    public String showEditForm(@PathVariable("id") String id, Model model) {
        Vendor vendor = vendorService.getVendorById(id);
        if (vendor == null) {
            return "redirect:/vendors";
        }
        model.addAttribute("vendor", vendor);
        return "vendor/edit";
    }

    // Process edit form
    @PostMapping("/{id}/edit")
    public String updateVendor(@PathVariable("id") String id,
                               @RequestParam("name") String name,
                               @RequestParam("price") double price,
                               @RequestParam("contactInfo") String contactInfo,
                               @RequestParam("description") String description,
                               @RequestParam(value = "specialization", required = false) String specialization,
                               @RequestParam(value = "experienceYears", required = false, defaultValue = "0") int experienceYears,
                               @RequestParam(value = "cuisine", required = false) String cuisine,
                               @RequestParam(value = "maxCapacity", required = false, defaultValue = "0") int maxCapacity,
                               @RequestParam(value = "location", required = false) String location,
                               @RequestParam(value = "capacity", required = false, defaultValue = "0") int capacity,
                               @RequestParam(value = "outdoorOption", required = false, defaultValue = "false") boolean outdoorOption,
                               RedirectAttributes redirectAttributes) {

        Vendor existingVendor = vendorService.getVendorById(id);
        if (existingVendor == null) {
            return "redirect:/vendors";
        }

        Vendor updatedVendor;
        String type = existingVendor.getType();

        switch (type.toLowerCase()) {
            case "photographer":
                updatedVendor = vendorService.createVendorByType(type, id, name, price, contactInfo, description,
                        specialization, String.valueOf(experienceYears));
                break;
            case "caterer":
                updatedVendor = vendorService.createVendorByType(type, id, name, price, contactInfo, description,
                        cuisine, String.valueOf(maxCapacity));
                break;
            case "venue":
                updatedVendor = vendorService.createVendorByType(type, id, name, price, contactInfo, description,
                        location, String.valueOf(capacity), String.valueOf(outdoorOption));
                break;
            default:
                updatedVendor = new Vendor(id, name, type, price, contactInfo, description);
                break;
        }

        vendorService.updateVendor(updatedVendor);
        redirectAttributes.addFlashAttribute("message", "Vendor updated successfully!");
        return "redirect:/vendors";
    }

    // Delete vendor
    @GetMapping("/{id}/delete")
    public String deleteVendor(@PathVariable("id") String id, RedirectAttributes redirectAttributes) {
        boolean deleted = vendorService.deleteVendor(id);
        if (deleted) {
            redirectAttributes.addFlashAttribute("message", "Vendor deleted successfully!");
        } else {
            redirectAttributes.addFlashAttribute("error", "Failed to delete vendor!");
        }
        return "redirect:/vendors";
    }

    // Search vendors
    @GetMapping("/search")
    public String searchVendors(@RequestParam(value = "query", required = false) String query,
                                @RequestParam(value = "type", required = false) String type,
                                Model model) {
        List<Vendor> results;

        if (type != null && !type.isEmpty()) {
            results = vendorService.searchVendorsByType(type);
            model.addAttribute("searchType", "type");
            model.addAttribute("searchValue", type);
        } else if (query != null && !query.isEmpty()) {
            results = vendorService.searchVendorsByName(query);
            model.addAttribute("searchType", "name");
            model.addAttribute("searchValue", query);
        } else {
            results = vendorService.getAllVendors();
        }

        model.addAttribute("vendors", results);
        return "vendor/search";
    }
}