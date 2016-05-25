package com.hooper.hoshop.dto.output.Category;

/**
 * Created by 47123 on 2016/5/14.
 */
public class DataTablePageOutput {
    private Object data;
    private int recordsTotal;
    private int recordsFiltered;

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public int getRecordsTotal() {
        return recordsTotal;
    }

    public void setRecordsTotal(int recordsTotal) {
        this.recordsTotal = recordsTotal;
    }

    public int getRecordsFiltered() {
        return recordsFiltered;
    }

    public void setRecordsFiltered(int recordsFiltered) {
        this.recordsFiltered = recordsFiltered;
    }
}
