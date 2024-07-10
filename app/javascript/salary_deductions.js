// app/assets/javascripts/salary_deductions.js
// app/assets/javascripts/salary_deduction.js

document.addEventListener('DOMContentLoaded', function() {
  const totalDaysWorkedInput = document.getElementById('salary_deduction_total_days_worked');
  const hoursWorkedInput = document.getElementById('salary_deduction_hrs_worked');
  const taxFeeInput = document.getElementById('salary_deduction_tax_fee');
  const pensionFeeInput = document.getElementById('salary_deduction_pension_fee');
  const netPayInput = document.getElementById('salary_deduction_net_pay');
  const staffIdInput = document.getElementById('salary_deduction_staff_id');
  const staffNameInput = document.getElementById('salary_deduction_staff_name');

  function calculateNetPay() {
    const totalDaysWorked = parseFloat(totalDaysWorkedInput.value) || 0;
    const hoursWorked = parseFloat(hoursWorkedInput.value) || 0;
    const taxFee = parseFloat(taxFeeInput.value) || 0;
    const pensionFee = parseFloat(pensionFeeInput.value) || 0;

    // Perform your calculation here
    const netPay = (totalDaysWorked * hoursWorked) - taxFee - pensionFee;
    
    // Set the calculated net pay in the netPayInput field
    netPayInput.value = netPay.toFixed(2); // Format to two decimal places
  }

  // Add event listeners to input fields to trigger calculation
  totalDaysWorkedInput.addEventListener('input', calculateNetPay);
  hoursWorkedInput.addEventListener('input', calculateNetPay);
  taxFeeInput.addEventListener('input', calculateNetPay);
  pensionFeeInput.addEventListener('input', calculateNetPay);

  // Event listener for staff ID change to fetch staff details
  staffIdInput.addEventListener('change', function() {
    var staffId = staffIdInput.value;
    if (staffId) {
      // AJAX request to fetch staff details
      $.ajax({
        url: '/staffs/' + staffId + '.json', // Replace with your endpoint to fetch staff details
        type: 'GET',
        dataType: 'json',
        success: function(data) {
          staffNameInput.value = data.staff_name;
          // Populate other fields as needed based on the response data
        },
        error: function(xhr, status, error) {
          console.error('Error fetching staff details:', error);
        }
      });
    } else {
      // Clear fields if no staff ID is selected
      staffNameInput.value = '';
      // Clear other fields as needed
    }
  });
});
