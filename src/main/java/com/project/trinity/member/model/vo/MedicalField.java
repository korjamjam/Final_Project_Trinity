package com.project.trinity.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MedicalField {
    private String medNo;        // MED_NO
    private String job;          // JOB
    private String medicalFieldId; // MEDICAL_FIELD_ID
}
