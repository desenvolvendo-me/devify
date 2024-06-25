document.addEventListener("DOMContentLoaded", function() {
    const form = document.querySelector("form");

    form.addEventListener("submit", function(event) {
        const techField = document.querySelector("input[name='student_profile[technology_other_details]']");
        const mostStudiedLangField = document.querySelector("input[name='student_profile[most_studied_language_other_details]']");
        const studyDurationField = document.querySelector("input[name='student_profile[study_duration_details]']");
        const webFrameworkStudyDurationField = document.querySelector("input[name='student_profile[web_framework_study_duration_details]']");

        // Verificar se os campos "Outro" estão formatados corretamente
        if (techField && techField.value && !techField.value.includes(',')) {
            alert("Por favor, separe as tecnologias com vírgulas.");
            event.preventDefault();
        }
        if (mostStudiedLangField && mostStudiedLangField.value && !mostStudiedLangField.value.includes(',')) {
            alert("Por favor, separe as linguagens mais estudadas com vírgulas.");
            event.preventDefault();
        }

        // Garantir que os valores de duração sejam números inteiros
        if (studyDurationField && studyDurationField.value && isNaN(parseInt(studyDurationField.value))) {
            alert("Por favor, insira um número válido para a duração do estudo.");
            event.preventDefault();
        }
        if (webFrameworkStudyDurationField && webFrameworkStudyDurationField.value && isNaN(parseInt(webFrameworkStudyDurationField.value))) {
            alert("Por favor, insira um número válido para a duração do estudo do framework.");
            event.preventDefault();
        }
    });
});
