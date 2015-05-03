$(document).ready(function () {
    //Initialize data table
    $('.dataTables-apartments').dataTable();

    $('.btn-show-add-apartment').click(function () {
        $('#divApartments').hide();
        $('#divAddApartment').show();
        
    });

    charlimit();
    inputkeyup();
    $('#btnAddApartment').click(function () {
        if ($('#add-apartment-form').valid()) {
            //on form valid do a ajax call to add apartment
            fnAddApartment();
        }
    });

    //$.validator.unobtrusive.parse($("form"));
    //$('.btnSave').click(function () {
    //    $('#add-apartment-form').submit();
    //});
});

//show the limit of char left
function charlimit() {
    $("form :input").each(function () {
        var input = $(this); // This is the jquery object of the input, do what you will
        if (input.parent().find("span.span-char-left").length) {
            input.parent().find("span.span-char-left").text((input.attr("maxlength")) - (input.val().trim().length));
        }
        //alert(input.attr("type"));
    });
};

//keyup event for all inputs
function inputkeyup() {
    $("form :input").each(function () {
        var input = $(this);
        input.keyup(function () {
            if (input.parent().find("span.span-char-left").length) {
                input.parent().find("span.span-char-left").text((input.attr("maxlength")) - (input.val().trim().length));
            }
        });
    })
};



function fnAddApartment() {
    var jmodel = { ApartmentName: JSON.stringify($("#txtApartmentName").val()), HouseNo: JSON.stringify($("#txtHouseNo").val()), Description: JSON.stringify($("#txtDescription").val()) };

    showProgress(false, "Adding Apartment. Please wait...");
    $.ajax({
        url: AddApartmentUrl,
        type: 'POST',
        data: jmodel,
        dataType: 'JSON',
        success: function (response, textStatus, XMLHttpRequest) {
            if (response.toUpperCase() == "SUCCESS") {
                alert('s');
                location.href = ApartmentsUrl;
            } else if (response.toUpperCase() == "FAILED") {
                alert('f');
                //Adding of new Apartment failed
            } else if (response.toUpperCase() == "SelectArea") {
                alert('a');
                //Area is not selected
            }
            hideProgress();
        },
        error: function (xhr, status) {
            alert('error');
            hideProgress();
        }


    });


}