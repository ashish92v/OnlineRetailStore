package com.onlineretail.util;

public class Result<T> {
    private T value;
    private Integer error;

    private Result(T value, Integer error) {
        this.value = value;
        this.error = error;
    }

    public static <U> Result<U> ok(U value) {
        return new Result<U>(value, null);
    }

    public static <U> Result<U> error(Integer error) {
        return new Result<U>(null, error);
    }

    public boolean isError() {
        return error != null;
    }

    public T getValue() {
        return value;
    }

    public Integer getError() {
        return error;
    }
}