package com.caroline.findingdoctors1.util;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import com.caroline.findingdoctors1.models.User.DayShift;

public class DayShiftValidator implements ConstraintValidator {

    
    public void initialize(ValidDayShift constraintAnnotation) {
        // Aqui você pode inicializar a validação, se necessário
    }

    
    public boolean isValid(DayShift value, ConstraintValidatorContext context) {
        if (value == null) {
            return false; // Valor nulo é considerado inválido
        }
        
        // Aqui você pode implementar a lógica de validação para o enum DayShift
        // Por exemplo, vamos validar se o dia de turno não é SUNDAY
        return value != DayShift.SUNDAY;
    }
}
