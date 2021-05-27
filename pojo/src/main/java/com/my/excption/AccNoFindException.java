package com.my.excption;

public class AccNoFindException extends RuntimeException {

    public AccNoFindException() {
    }

    public AccNoFindException(String message) {
        super(message);
    }

    public AccNoFindException(String message, Throwable cause) {
        super(message, cause);
    }

    public AccNoFindException(Throwable cause) {
        super(cause);
    }

    public AccNoFindException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
