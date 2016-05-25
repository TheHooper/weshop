/**
 * @(#)ParameterException.java 2011-12-20 Copyright 2011 it.kedacom.com, Inc.
 * All rights reserved.
 */

package com.hooper.hoshop.common.exception;

/**

 */

public class SystemException extends RuntimeException {

    /** serialVersionUID */
    private static final long serialVersionUID = 6417641452178955756L;

    public SystemException() {
        super();
    }

    public SystemException(String message) {
        super(message);
    }

    public SystemException(Throwable cause) {
        super(cause);
    }

    public SystemException(String message, Throwable cause) {
        super(message, cause);
    }
}
