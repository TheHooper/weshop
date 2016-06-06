package com.hooper.hoshop.dto.output;

/**
 * Created by 47123 on 2016/6/5.
 */
public class EasyPageOutput {
    private Object rows;

    private int total;

    public Object getRows() {
        return rows;
    }

    public void setRows(Object rows) {
        this.rows = rows;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
}
