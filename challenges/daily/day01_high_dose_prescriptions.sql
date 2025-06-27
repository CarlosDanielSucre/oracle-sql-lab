/*🧠 PL/SQL CHALLENGE – DAY 1 (Core Level)
📌 Objective:
Practice cursor loops, records, and basic conditional logic.

🧪 Challenge: Top Prescriptions Filter
You have a table called PRESCRIPTION:*/

CREATE TABLE prescription (
    id            NUMBER,
    patient_name  VARCHAR2(100),
    drug_name     VARCHAR2(100),
    dose_mg       NUMBER,
    status        VARCHAR2(20)
);

/*
Write a PL/SQL block that:

Declares a cursor to select all prescriptions where status = 'ACTIVE'

Loops through the cursor using a record

Prints only those where dose_mg > 100

At the end, print: "High dose prescriptions completed."
*/

DECLARE
  CURSOR status_actives IS
    SELECT * FROM prescription WHERE status = 'ACTIVE';

  v_prescription_record prescription%ROWTYPE;

BEGIN 
  OPEN status_actives;

  LOOP
    FETCH status_actives INTO v_prescription_record;
    EXIT WHEN status_actives%NOTFOUND;

    -- Only print if dose is greater than 100
    IF v_prescription_record.dose_mg > 100 THEN
      DBMS_OUTPUT.PUT_LINE('Prescription ID: ' || v_prescription_record.id ||
                           ', Dose: ' || v_prescription_record.dose_mg ||
                           ', Patient: ' || v_prescription_record.patient_name);
    END IF;
  END LOOP;

  CLOSE status_actives;

  DBMS_OUTPUT.PUT_LINE('High dose prescriptions completed.');
END;
/
