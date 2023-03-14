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

// slice the identifier
* identifier ^slicing.rules = #openAtEnd
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type.assigner.reference"
* identifier contains svnr 1..1

// define what svnr looks like
* identifier[svnr].type.coding.system = HL7V2
* identifier[svnr].type.coding.code = HL7V2#SS (exactly)
* identifier[svnr].type.coding.display = "Social Security Number" (exactly)
* identifier[svnr].system 1..1
* identifier[svnr].system = "urn:oid:1.2.40.0.10.1.4.3.1" (exactly)
* identifier[svnr].system ^short = "OID for the Social Security Number in Austria"
* identifier[svnr].assigner.display = "Dachverband der österreichischen Sozialversicherungsträger" (exactly)
* identifier[svnr].assigner.reference = "https://www.gesundheit.gv.at/OID_Frontend/..."

Invariant: inv1
Description: "Birthdate cannot be after today"
Expression: "/f:Patient/f:birthDate &lt;=current-date()"
Severity: #error