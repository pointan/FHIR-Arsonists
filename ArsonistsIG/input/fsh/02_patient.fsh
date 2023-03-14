/*#################################################
 * Type:        File for a FHIR Profile on a Resource
 * About:       Profile for a Patient
 * Created by:  Andreas Pointner
#################################################*/

Profile:      HL7ATPatient
Parent:       Patient
Id:           hl7at-patient
Title:        "HL7 AT Patient Profile"
Description:  "Profile for a patient in Austria. This is based on the FHIR Patient resource, and is designed to store all the info we need."

* identifier 3..*
* photo 0..0
* gender = AdministrativeGender#female (exactly)
* birthDate obeys inv1

Invariant: inv1
Description: "Birthdate cannot be after today"
Expression: "/f:Patient/f:birthDate &lt;=current-date()"
Severity: #error