document.addEventListener('DOMContentLoaded', () => {
    const form = document.querySelector('form[action="/salary_deductions"]');
    const totalDaysWorkedInput = document.getElementById('salary_deduction_total_days_worked');
    const hoursWorkedInput = document.getElementById('salary_deduction_hrs_worked');
    const taxFeeInput = document.getElementById('salary_deduction_tax_fee');
    const pensionFeeInput = document.getElementById('salary_deduction_pension_fee');
    const netPayInput = document.getElementById('salary_deduction_net_pay');
  
    function calculateNetPay() {
      const totalDaysWorked = parseFloat(totalDaysWorkedInput.value) || 0;
      const hoursWorked = parseFloat(hoursWorkedInput.value) || 0;
      const taxFee = parseFloat(taxFeeInput.value) || 0;
      const pensionFee = parseFloat(pensionFeeInput.value) || 0;
  
      // Assuming you have a base pay calculation logic
      const basePay = (totalDaysWorked * 8 + hoursWorked) * 10; // Example calculation
      const netPay = basePay - taxFee - pensionFee;
  
      netPayInput.value = netPay.toFixed(2);
    }
  
    form.addEventListener('submit', (event) => {
      calculateNetPay();
      // Prevent form submission if needed
      // event.preventDefault();
    });
  
    // Optionally, you can add event listeners to update the net pay dynamically
    totalDaysWorkedInput.addEventListener('input', calculateNetPay);
    hoursWorkedInput.addEventListener('input', calculateNetPay);
    taxFeeInput.addEventListener('input', calculateNetPay);
    pensionFeeInput.addEventListener('input', calculateNetPay);
  });
  