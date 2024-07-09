document.addEventListener('DOMContentLoaded', () => {
    const form = document.getElementById('loan-form');

    form.addEventListener('submit', function(event) {
        event.preventDefault(); // Evita el envío del formulario para validaciones
        
        let isValid = true;
        const fields = [
            {id: 'loan_address', name: 'address', errorMessage: 'Address is required'},
            {id: 'loan_loan_term', name: 'loan_term', errorMessage: 'Loan term must be between 1 and 12', validate: value => value >= 1 && value <= 12},
            {id: 'loan_purchase_price', name: 'purchase_price', errorMessage: 'Purchase price is required'},
            {id: 'loan_repair_budget', name: 'repair_budget', errorMessage: 'Repair budget is required'},
            {id: 'loan_arv', name: 'arv', errorMessage: 'After repair value is required'},
            {id: 'loan_name', name: 'name', errorMessage: 'Name is required'},
            {id: 'loan_email', name: 'email', errorMessage: 'Email is required'},
            {id: 'loan_phone', name: 'phone', errorMessage: 'Phone number is required and must be numbers only', validate: value => /^\d+$/.test(value)}
        ];
        
        fields.forEach(field => {
            const input = document.getElementById(field.id);
            const errorDiv = document.getElementById(`${field.name}-error`);

            if (!input.value || (field.validate && !field.validate(input.value))) {
                isValid = false;
                input.classList.add('border-red-500');
                errorDiv.textContent = field.errorMessage;
                errorDiv.classList.remove('hidden');
            } else {
                input.classList.remove('border-red-500');
                errorDiv.classList.add('hidden');
            }
        });

        if (isValid) {
            alert('Formulario enviado correctamente');
            this.submit(); // Elimina esta línea si no deseas que se envíe el formulario en caso de éxito
        } else {
            alert('Por favor, corrige los errores en el formulario.');
        }
    });
});
