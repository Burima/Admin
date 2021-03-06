﻿
//converting all the areas in json list
eval("var areaList = " + Areas);

$(document).ready(function () {

    //char alone 
    $(".charAlone").on(" keydown ", function (event) { return isCharField(event); });

    //if area is not selected show modal
    //for select City and Area
    if (AreaID == 0) {
        fnChangeLocation();
    }

    if (showMessage) {
        $('#modalShowMessage').modal('show');
    }


    //view all apartments
    $('#divApartments').show();
    $('#divAddApartment').hide();
    $('#divEditApartment').hide();


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

    //form validator
    $("#form-add-an-apartment").validate();
    $("#form-edit-apartment").validate();
    //Add Apartment button
    $('#btnAddApartment').click(function () {
        if ($("#form-add-an-apartment").valid() == true) {
            showProgress(false, "Adding your Apartment...");
            $("#form-add-an-apartment").submit();
        }
    });

    //delete apartment
    $('.btnDeleteApartment').click(function () {
        var trId = $(this).closest('tr').attr('id');
        var apartmentName = $(this).closest('tr:first a').html();
        alert(apartmentName);

        $('#spnApartmentName-ConfirmDeletion').html(apartmentName);
        $('#hdnApartmentID-ConfirmDeletion').val(trId);
        $('#modalConfirmDeletion').modal('show');
        //fnDeleteApartment(trId);

    });

    $('modalConfirmDeletion .btnYes').click(function () {
        alert($('#hdnApartmentID-ConfirmDeletion').val());
    });


    //click on addblocks

    $('.btnShowModalBlocks').click(function () {
        // alert($(this).closest('tr').attr('id'));
        $('#divAddBlock').empty();
        $('#hdnApartmentID').val($(this).closest('tr').attr('id'));
        var blocks = $(this).parent().find('.hdnBlocks').val(); //getting all the blocks from hidden field      
        eval("var blockList = " + blocks); //asigning to a variable
        //iterationg each block and generating html for existing blocks
        $.each(blockList, function (i, block) {
            $("#divAddBlock").append("<div class='form-group input-group'><input type='text' class='form-control col-md-4 existing-block' name=" + "'" + this.BlockName + "'" + " value=" + "'" + this.BlockName + "'" + " disabled><a class='input-group-addon glyphicon glyphicon-edit anchoreditblock'></a><input type='hidden' class='hdnBlockID' value=" + this.BlockID + "></div>");
        });

        //on click of edit icon of existing blog
        $('.anchoreditblock').click(function () {//edit button click
            $(this).parent().find(".existing-block").removeAttr('disabled');
            var SearchInput = $(this).parent().find(".existing-block");
            var strLength = SearchInput.val().length;
            SearchInput.focus();
            SearchInput[0].setSelectionRange(strLength, strLength);//set focus at the end of text
        });

        //after editing a existing blog
        $(".existing-block").change(function () {
            $(this).addClass('edited-block');
        });

        //Show the modal
        $("#myModal").modal('show');
    });

    //add new block in Blocks modal
    $("#addnewblock").click(function () {
        $("#divAddBlock").append("<div class='form-group input-group'><input type='text' class='form-control col-md-4 new-block ' ><a class='input-group-addon glyphicon glyphicon-plus-sign anchoreditblock'style=''></a></div>")

    });

    //Save Blocks
    $("#modalblocksave").click(function () {
        var obj = new Array();//creating a new block array object 
        //adding new blocks
        $('input.new-block[type="text"]').each(function () {
            var Block = new Object();
            Block.BlockName = $(this).val();
            Block.BlockID = 0;
            Block.ApartmentID = $('#hdnApartmentID').val();
            obj.push(Block);
        });

        //adding existing and edited blocks
        $('input.edited-block[type="text"]').each(function () {
            var Block = new Object();
            Block.BlockName = $(this).val();
            Block.BlockID = $(this).parent().find('.hdnBlockID').val();
            Block.ApartmentID = $('#hdnApartmentID').val();
            obj.push(Block);
        });

        var jsonmodels = { Blocksarray: JSON.stringify(obj) }
        $.ajax({
            url: SaveBlocskUrl,
            data: jsonmodels,
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response == "Success") {
                    alert('blocks updated successfully');
                    $("#myModal").modal('hide');//Hide the modal
                    window.location = ApartmentsUrl;
                } else {
                    alert('Something went wrong. Please try again later !');
                    $("#myModal").modal('show');//Show the modal
                }
            },
        });
        // $("#saveblockmodal").submit();
    });
});

//delete apartment
function fnDeleteApartment(apartmentID) {
    showProgress(false, "Deleting Apartment. Please wait...");
    var jsonmodel = { Blocksarray: JSON.stringify(apartmentID) }
    $.ajax({
        url: DeleteApartmentUrl,
        data: jsonmodel,
        type: 'POST',
        dataType: 'json',
        success: function (response) {
            if (response == "Success") {
                alert('blocks updated successfully');
                $("#myModal").modal('hide');//Hide the modal
                window.location = ApartmentsUrl;
            } else {
                alert('Something went wrong. Please try again later !');
                $("#myModal").modal('show');//Show the modal
            }
        },


    });
}



////show the limit of char left
//function charlimit() {
//    $("form :input").each(function () {
//        var input = $(this); // This is the jquery object of the input, do what you will
//        if (input.parent().find("span.span-char-left").length) {
//            input.parent().find("span.span-char-left").text((input.attr("maxlength")) - (input.val().trim().length));
//        }
//        //alert(input.attr("type"));
//    });
//};

////keyup event for all inputs
//function inputkeyup() {
//    $("form :input").each(function () {
//        var input = $(this);
//        input.keyup(function () {
//            if (input.parent().find("span.span-char-left").length) {
//                input.parent().find("span.span-char-left").text((input.attr("maxlength")) - (input.val().trim().length));
//            }
//        });
//    })
//};



//function fnAddApartment() {
//    var jmodel = { ApartmentName: JSON.stringify($("#txtApartmentName").val()), HouseNo: JSON.stringify($("#txtHouseNo").val()), Description: JSON.stringify($("#txtDescription").val()) };

//    showProgress(false, "Adding Apartment. Please wait...");
//    $.ajax({
//        url: AddApartmentUrl,
//        type: 'POST',
//        data: jmodel,
//        dataType: 'JSON',
//        success: function (response, textStatus, XMLHttpRequest) {
//            if (response.toUpperCase() == "SUCCESS") {
//                alert('s');
//                location.href = ApartmentsUrl;
//            } else if (response.toUpperCase() == "FAILED") {
//                alert('f');
//                //Adding of new Apartment failed
//            } else if (response.toUpperCase() == "SelectArea") {
//                alert('a');
//                //Area is not selected
//            }
//            hideProgress();
//        },
//        error: function (xhr, status) {
//            alert('error');
//            hideProgress();
//        }
//    });
//}



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
                //alert(response.CreatedOn);
                var createdOnDateFromServer = response.CreatedOn;
                if (createdOnDateFromServer != null) {
                    //Now let's convert it to js format
                    //Example: Fri Dec 03 2010 16:37:32 GMT+0530 (India Standard Time)
                    var parsedDate = new Date(parseInt(createdOnDateFromServer.substr(6)));
                    var jsDate = new Date(parsedDate); //Date object
                    createdOn = (fnCheckNumber(jsDate.getMonth() + 1)) + "/" + fnCheckNumber(jsDate.getDate()) + "/" + fnCheckNumber(jsDate.getFullYear());
                }
                //var createdOn = new Date(parseInt(response.CreatedOn.substr(6), 10));
                //alert(createdOn);
                $('#divApartments').hide();
                $('#divAddApartment').hide();
                $('#divEditApartment').show();
                //Fill apartment details
                $('#hdnEditApartmentID').val(response.ApartmentID);
                $('#txtEditApartmentName').val(response.ApartmentName);
                $('#txtEditHouseNo').val(response.HouseNo);
                $('#txtEditDescription').val(response.Description);
                //$('#hdnEditAreaID').val(response.AreaID);
                //$('#hdnEditCreatedOn').val(createdOn);
                //$('#hdnEditCreatedBy').val(response.CreatedBy);
                //$('#hdnEditOwnerID').val(response.OwnerID);
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
//update apartment
$('#btnEditApartment').click(function () {
    if ($("#form-edit-apartment").valid() == true) {
        showProgress(false, "Updating your Apartment...");
        $('#form-edit-apartment').submit();
    }
});




//fuction to check anumber and reconfigure date time to desire (eg: 1 as 01)
function fnCheckNumber(number) {
    if (number < 10)
        return "0" + number;
    else
        return number;
}

//show change location modal
function fnChangeLocation() {
    //prevent click outside and make all keyboard false 
    $("#modalSelectCityAndArea").modal({ backdrop: 'static', keyboard: false });
    //show the modal
    $('#modalSelectCityAndArea').modal('show');
}

/*------------------------------------------- redandent code with houses need to replace in master js---------------------------------*/
//Change Area when changing City
$("select[name='CityID']").change(function () {
    var ddlvalue = $('#ddlCity').val();//get the selected value of ddlCityID
    $('#divArea').removeClass('hidden');//make divArea visible
    $('#ddlArea').empty();//Restart the Areas in a City
    $('#ddlArea').append(
                  $('<option value="" disabled selected></option>').html("--Select Area--")
              );//Appending default value
    $.each(areaList, function (i, area) {
        //if CityID of area matches with city selected in the ddlCityID dropdown
        //then fill the area dropdown with the corresponding City
        if (ddlvalue == area.CityID) {
            $('#ddlArea').append(
            $('<option></option>').val(area.AreaID).html(area.AreaName)
           );

        } else {
            //alert('area is not covered by LYS in this city');

        }

    });
});

//bind locations to session after btnSaveLocation click
$('#btnSaveLocation').click(function () {
    //if ($('#update-location-form').valid()) {
    //    fnSaveLocation();
    //}
    if ($("#ddlCity").val() > 0) {
        //relese border red
        $('#ddlCity').css('border-color', '#e5e6e7');
        //check Area is selected or not
        if ($("#ddlArea").val() > 0) {
            //relese border red
            $('#ddlArea').css('border-color', '#e5e6e7');

            //id both city and area is selested update location
            fnSaveLocation();
        } else {
            //area not selected
            $('#ddlArea').css('border-color', 'red');
        }

    } else {
        //city not selected
        $('#ddlCity').css('border-color', 'red');
    }
});

function fnSaveLocation() {
    var jmodel = { CityID: $("#ddlCity").val(), AreaID: $("#ddlArea").val(), CityName: $("#ddlCity :selected").text(), AreaName: $("#ddlArea :selected").text() };

    showProgress(false, "Updating Location. Please wait...");
    $.ajax({
        url: UpdateLocationUrl,
        type: 'POST',
        data: jmodel,
        dataType: 'JSON',
        success: function (response, textStatus, XMLHttpRequest) {
            if (response.toUpperCase() == "SUCCESS") {
                $('#modalSelectCityAndArea').modal('hide');
                location.href = ApartmentsUrl;
            } else if (response.toUpperCase() == "FAILED") {
                alert('something went wrong. Please try again!');
                //Adding of new Apartment failed
            }
            hideProgress();
        },
        error: function (xhr, status) {
            alert('error');
            hideProgress();
        }
    });
}
/*-------------------------------------------------------------- End redandant code -----------------------------------------*/