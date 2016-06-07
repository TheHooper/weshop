/**
 * Created by 47123 on 2016/5/31.
 */
AddressApi = {
    urlPrefix: "",
    loadProvince: function (selectId) {
        $.ajax({
            type: "GET",
            url: AddressApi.urlPrefix + "/address/provinces",
            data: {},
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "json",
            success: function (data) {
                $(data).each(function (i, e) {
                    var op = $('<option value="' + e.provinceid + '">' + e.province + '</option>');
                    $('#' + selectId).append(op);
                })
            },
            error: function (msg) {

            }
        })
    },
    loadCity: function (provinceId, selectId) {
        $.ajax({
            type: "GET",
            url: AddressApi.urlPrefix + "/address/cities/" + provinceId,
            data: {},
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "json",
            success: function (data) {
                $('#' + selectId).html("");
                $(data).each(function (i, e) {
                    var op = $('<option value="' + e.cityid + '">' + e.city + '</option>');
                    $('#' + selectId).append(op);
                })
            },
            error: function (msg) {

            }
        })
    },
    loadArea: function (cityId, selectId) {
        $.ajax({
            type: "GET",
            url: AddressApi.urlPrefix + "/address/areas/" + cityId,
            data: {},
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "json",
            success: function (data) {
                $('#' + selectId).html("");
                $(data).each(function (i, e) {
                    var op = $('<option value="' + e.areaid + '">' + e.area + '</option>');
                    $('#' + selectId).append(op);
                })
            },
            error: function (msg) {

            }
        })
    },
    loadDefaultAddress: function (async, callbackfunction) {
        var result;
        $.ajax({
            type: "GET",
            async: async,
            url: AddressApi.urlPrefix + "/address/default/",
            data: {},
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "json",
            success: function (data) {
                result = data;
            },
            error: function (msg) {

            }
        })
        return result;
    },
    loadAddresses: function (async, callbackfunction) {
        var result;
        $.ajax({
            type: "GET",
            async: async,
            url: AddressApi.urlPrefix + "/address/addresses/",
            data: {},
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "json",
            success: function (data) {
                result = data;
            },
            error: function (msg) {

            }
        })
        return result;
    },
    bindAutoLoadEvent: function (pSelectId, cSelectId, aSelectId) {
        $('#' + pSelectId).on("change", function () {
            var pId = $('#' + pSelectId).val();
            $.ajax({
                type: "GET",
                url: AddressApi.urlPrefix + "/address/cities/" + pId,
                data: {},
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $('#' + cSelectId).html("");
                    $(data).each(function (i, e) {
                        var op = $('<option value="' + e.cityid + '">' + e.city + '</option>');
                        $('#' + cSelectId).append(op);
                    })
                    var cId = $('#' + cSelectId).val();
                    AddressApi.loadArea(cId, aSelectId);
                },
                error: function (msg) {

                }
            })
        })
        $('#' + cSelectId).on("change", function () {
            var cId = $('#' + cSelectId).val();
            AddressApi.loadArea(cId, aSelectId);
        })
    },
    addAddress: function (addressAddForm, callbackFunction) {
        $.ajax({
            type: "POST",
            url: AddressApi.urlPrefix + "/address/add",
            data: addressAddForm,
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "json",
            success: function (data) {
                if (data.code == 0) {
                    callbackFunction();
                }
            },
            error: function (msg) {

            }
        })
    }
}