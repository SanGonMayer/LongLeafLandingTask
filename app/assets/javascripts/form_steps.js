document.addEventListener('DOMContentLoaded', () => {
    const steps = document.querySelectorAll('.form-step');
    let currentStep = 0;

    function showStep(stepIndex, animateInClass = 'animate__fadeIn', animateOutClass = 'animate__fadeOut') {
        const current = steps[currentStep];
        const next = steps[stepIndex];

        if (stepIndex > currentStep) {
            animateOutClass = 'animate__slideOutLeft';
            animateInClass = 'animate__slideInRight';
        } else if (stepIndex < currentStep) {
            animateOutClass = 'animate__slideOutRight';
            animateInClass = 'animate__slideInLeft';
        }

        current.classList.add('animate__animated', animateOutClass);
        current.style.animationDuration = '0.4s';
        current.classList.remove('active');

        current.addEventListener('animationend', function handleAnimationEnd() {
            current.classList.remove('animate__animated', animateOutClass);
            current.classList.add('hidden');
            current.removeEventListener('animationend', handleAnimationEnd);

            next.classList.add('animate__animated', animateInClass);
            next.style.animationDuration = '0.4s';
            next.classList.add('active');
            next.classList.remove('hidden');

            next.addEventListener('animationend', function handleNextAnimationEnd() {
                next.classList.remove('animate__animated', animateInClass);
                next.removeEventListener('animationend', handleNextAnimationEnd);
            });
        });

        currentStep = stepIndex;
    }

    window.nextStep = function() {
        if (currentStep < steps.length - 1) {
            showStep(currentStep + 1);
        }
    }

    window.prevStep = function() {
        if (currentStep > 0) {
            showStep(currentStep - 1);
        }
    }

    // Initialize the first step as active
    //showStep(currentStep);
});
