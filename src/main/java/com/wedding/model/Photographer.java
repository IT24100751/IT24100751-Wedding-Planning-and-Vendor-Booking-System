package com.wedding.model;

public class Photographer extends Vendor {
    private String specialization;
    private int experienceYears;

    public Photographer() {
        super();
        setType("Photographer");
    }

    public Photographer(String id, String name, double price, String contactInfo,
                        String description, String specialization, int experienceYears) {
        super(id, name, "Photographer", price, contactInfo, description);
        this.specialization = specialization;
        this.experienceYears = experienceYears;
    }

    public String getSpecialization() {
        return specialization;
    }

    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }

    public int getExperienceYears() {
        return experienceYears;
    }

    public void setExperienceYears(int experienceYears) {
        this.experienceYears = experienceYears;
    }

    @Override
    public String displayDetails() {
        return super.displayDetails() + "\nSpecialization: " + specialization +
                "\nExperience: " + experienceYears + " years";
    }

    @Override
    public String toFileString() {
        return super.toFileString() + "," + specialization + "," + experienceYears;
    }

    public static Photographer fromFileString(String fileString) {
        String[] parts = fileString.split(",");
        if (parts.length >= 8) {
            Photographer photographer = new Photographer();
            photographer.setId(parts[0]);
            photographer.setName(parts[1]);
            photographer.setType(parts[2]);
            photographer.setPrice(Double.parseDouble(parts[3]));
            photographer.setContactInfo(parts[4]);
            photographer.setDescription(parts[5]);
            photographer.setSpecialization(parts[6]);
            photographer.setExperienceYears(Integer.parseInt(parts[7]));
            return photographer;
        }
        return null;
    }
}