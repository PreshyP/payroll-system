// app/javascript/packs/salary_deduction_form.js

import { Turbo } from "@hotwired/turbo-rails"

document.addEventListener('turbo:load', () => {
  const staffIdField = document.getElementById('staff_id_field');
  if (staffIdField) {
    staffIdField.addEventListener('change', () => {
      const staffId = staffIdField.value;
      if (staffId !== '') {
        // AJAX request to fetch staff details
        fetch(`/staffs/${staffId}.json`)
          .then(response => response.json())
          .then(data => {
            document.getElementById('staff_name_field').value = data.name;
            document.getElementById('lastname_field').value = data.lastname;
            // Populate other fields similarly
          })
          .catch(error => {
            console.error('Failed to fetch staff details', error);
            alert('Failed to fetch staff details.');
          });
      } else {
        // Clear fields if staff_id is empty
        document.getElementById('staff_name_field').value = '';
        document.getElementById('lastname_field').value = '';
        // Clear other fields similarly
      }
    });
  }
});
