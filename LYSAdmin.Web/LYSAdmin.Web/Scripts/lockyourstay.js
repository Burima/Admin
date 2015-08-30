/* START :  Custom select box */
$(document).ready(function () {
    //required field validator for all elements in the application
    jQuery.extend(jQuery.validator.messages, {
        required: "Required"
    });   
});




/* END :  Custom select box */

//START: Number and character validation parts
//Backspace, Tab, Enter, Delete, Left, top, right, bottom
var Operable_keys = [8, 9, 13, 46, 37, 38, 39, 40];

function isCharField(event) {
    var obj = (event.srcElement) ? event.srcElement : event.target;
    $(obj).val($(obj).val().replace(/[^a-zA-Z ]/g, '').replace(/([~!@#$%^&*()_+=`{}\[\]\|\\:;'<>,.\/\\\?])+/g, '-').replace(/^(-)+|(-)+$/g, ''));
    var charCode = (event.keyCode) ? event.keyCode : event.which;
    if ((charCode >= 48 && charCode <= 57) || (charCode >= 96 && charCode <= 105))
        return false;
    return true;
}

function isNumberKey(evt) {
    var obj = (evt.srcElement) ? evt.srcElement : evt.target;
    $(obj).val($(obj).val().replace(/[^0-9]/g, '').replace(/([~!@#$%^&*()_+=`{}\[\]\|\\:;'<>,.\/? ])+/g, '-').replace(/^(-)+|(-)+$/g, ''));
    var charCode = (evt.which) ? evt.which : event.keyCode;
    if ((charCode >= 48 && charCode <= 57) || (charCode >= 96 && charCode <= 105) || ($.inArray(charCode, Operable_keys) != -1))
        return true;
    return false;
}

function addHyphen(obj, evt) {
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (!(charCode >= 37 && charCode <= 40)) {
        var z = $(obj).val().replace("-", "");
        if (z.length > 5)
            z = z.substring(0, 5) + "-" + z.substring(5);
        $(obj).val(z);
    }
}


//END: Number and character validation parts

