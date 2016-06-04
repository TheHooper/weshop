package com.hooper.hoshop.common.exception;

/**
 * Created by 47123 on 2016/6/2.
 */
public class CheckOutExcpetion extends RuntimeException {
    /**
     * serialVersionUID
     */
    private static final long serialVersionUID = 2332608236621015980L;

    private String code;

    public CheckOutExcpetion() {
        super();
    }

    public CheckOutExcpetion(String message) {
        super(message);
    }

    public CheckOutExcpetion(String code, String message) {
        super(message);
        this.code = code;
    }

    public CheckOutExcpetion(Throwable cause) {
        super(cause);
    }

    public CheckOutExcpetion(String message, Throwable cause) {
        super(message, cause);
    }

    public CheckOutExcpetion(String code, String message, Throwable cause) {
        super(message, cause);
        this.code = code;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

}
