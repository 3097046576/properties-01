package com.my.excption;

public class AccExistenceException extends RuntimeException{

    public AccExistenceException() {
    }

    public AccExistenceException(String message) {
        super(message);
    }

    public AccExistenceException(String message, Throwable cause) {
        super(message, cause);
    }

    public AccExistenceException(Throwable cause) {
        super(cause);
    }

    public AccExistenceException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
