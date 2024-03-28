package com.caroline.findingdoctors1.util;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;

@Target({ ElementType.FIELD, ElementType.METHOD, ElementType.PARAMETER })
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = DayShiftValidator.class)
public @interface ValidDayShift {
    String message() default "Invalid day shift";
    Class<?>[] groups() default {};
    Class<?>[] payload() default {};
}
