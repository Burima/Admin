$(document).ready(function () {
    //Initialize data table
    $('.dataTables-apartments').dataTable({
        /* Disable initial sort */
        "aaSorting": []
    });

    $('.btn-show-add-apartment').click(function () {
        $('#divApartments').hide();
        $('#divAddApartment').show();
        $('#divEditApartment').hide();
        
    });

    //Char Limit function
    charlimit();
    inputkeyup();

    //Add button
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

//Edit Apartment
function fnGetApartmentByID(element) {
   
        var trId = $(element).closest('tr').attr('id');        
        var jmodel = { apartmentID: JSON.stringify(trId) };
        
        showProgress(false, "Getting Apartment Details. Please wait...");
        $.ajax({
            url: GetApartmentByIDUrl,
            type: 'POST',
            data: jmodel,
            dataType: 'JSON',
            success: function (response, textStatus, XMLHttpRequest) {
                if (response != null) {
                    alert(response.CreatedOn);
                    var createdOn = new Date(parseInt((response.CreatedOn).replace("/Date(", "").replace(")/", ""), 10));
                    //var createdOn = new Date(parseInt(response.CreatedOn.substr(6), 10));
                    alert(createdOn);
                    $('#divApartments').hide();
                    $('#divAddApartment').hide();
                    $('#divEditApartment').show();
                    //Fill apartment details
                    $('#hdnEditApartmentID').val(response.ApartmentID);
                    $('#txtEditApartmentName').val(response.ApartmentName);
                    $('#txtEditHouseNo').val(response.HouseNo);
                    $('#txtEditDescription').val(response.Description);
                    $('#hdnEditAreaID').val(response.AreaID);
                    $('#hdnEditCreatedOn').val(createdOn);
                    $('#hdnEditCreatedBy').val(response.CreatedBy);
                    $('#hdnEditOwnerID').val(response.OwnerID);
                    //set char limit 
                    charlimit();
                } else {
                    alert("Error! Please try again later...");
                }

                hideProgress();
            },
            error: function (xhr, status) {
                alert("Error! Please try again later...");
                hideProgress();
            }
        });        
}

