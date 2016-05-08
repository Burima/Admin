
var City = cityname;
var Area = areaname;
var Latitude, Longitude;
var InitialLatitude, InitialLongitude;
var blocks;
//converting all the areas in json list
eval("var areaList = " + Areas);

$(document).ready(function () {
    //newly added house info..soon after popup for house images will appear

    if (AddedHouseID != 0) {
        $('#modalUploadHouseImages').modal('show');
    }
    //if area is not selected show modal
    //for select City and fnOpenBasicAmenities()
    if (AreaID == 0) {
        fnChangeLocation();
    }

    //set char limli of all the inputs
    charlimit();
    inputkeyup();

    //view all apartments
    $('#divHouses').show();
    $('#divAddHouse').hide();


    //Initialize data table
    $('.dataTables-houses').dataTable({
        /* Disable initial sort */
        "aaSorting": []
    });

    $('.btn-show-add-house').click(function () {
        $('#divHouses').hide();
        $('#divAddHouse').show();
    });

    //File Upload response from the server
    Dropzone.options.dropzoneForm = {
        maxFiles: 5,
        init: function () {
            this.on("maxfilesexceeded", function (data) {
                var res = eval('(' + data.xhr.responseText + ')');
            });
            this.on("addedfile", function (file) {
                // Create the remove button
                var removeButton = Dropzone.createElement("<button>Remove file</button>");
                // Capture the Dropzone instance as closure.
                var _this = this;
                // Listen to the click event
                removeButton.addEventListener("click", function (e) {
                    // Make sure the button click doesn't submit the form:
                    e.preventDefault();
                    e.stopPropagation();
                    // Remove the file preview.
                    _this.removeFile(file);
                    // If you want to the delete the file on the server as well,
                    // you can do the AJAX request here.
                });
                // Add the button to the file preview element.
                file.previewElement.appendChild(removeButton);
            });
        }
    };

    /***********************DropZone Manually creation*****************************/
    
    //on selecting number of rooms in houses
    $("select[name='NoOfRooms']").change(function () {
        var val = $(this).find(':selected').attr('value');
        if (val > 0) {
            var divRoomDetails = $('#divRoomdetails');
            divRoomDetails.removeClass('hidden');
            divRoomDetails.empty();
            divRoomDetails.append('<div><h4>Room Details</h4></div>');
            for (var i = 1; i <= val; i++) {
                var newroom = '<div class="row margin-bottom-2-pc">' +
                                         '<label class="col-md-2">Room <span>' + i + '</span></label>' +
                                         '<div class="col-md-3">' +
                                             '<select class="number-of-beds form-control " tabindex="1" name="Rooms[' + (i - 1) + '].NoOfBeds">' +
                                                 '<option value="" disabled selected>Beds</option>' +
                                                 '<option value="0">0</option>' +
                                                 '<option value="1">1</option>' +
                                                 '<option value="2">2</option>' +
                                                 '<option value="3">3</option>' +
                                                 '<option value="4">4</option>' +
                                                 '<option value="5">5</option>' +
                                                 '<option value="6">6</option>' +
                                             '</select>' +
                                         '</div>' +
                                         '<input type="hidden" name="Rooms[' + (i - 1) + '].RoomID" value="' + i + '">' +
                                         '<div class="col-md-3"><input type="text" placeholder="Mothly Rent" class="form-control monthly-rent required" id="Rooms' + i + '.MonthlyRent"    name="Rooms[' + (i - 1) + '].MonthlyRent"/></div>' +
                                         '<div class="col-md-3"><input type="text" placeholder="Deposit" class="form-control deposit required" id="Rooms' + i + '.Deposit" name="Rooms[' + (i - 1) + '].Deposit"/></div></div>';

                divRoomDetails.append(newroom);
            }

        }
    });


    /*---------------------- button click events for every forms ----------------------------------------------------*/

    //btnNextBasicInformation
    $('#btnNextBasicInformation').click(function () {
        if ($('#add-house-information-form').valid()) {
            //hide BasicInformation upon valid data
            $('#collapseBasicInformation').removeClass('in');
            //google api function

            //initialization of the map based on area and city
            // initialize();
            $('#linkcollapseBasicAmenities').attr('href', '#collapseBasicAmenities'); //activate collapseable functionality through linking it with the target id 
            $('#collapseBasicAmenities').addClass('in');//open Locality panel
        }
    });

    //btnNextLocality click event
    $('#btnNextLocality').click(function (e) {
        if ($('#txtAddress').val() != "") {
            $('#txtAddress').css('border-color', '#e5e6e7');
            e.preventDefault();
            var address = document.getElementById('txtAddress').value;
            address = address + " " + Area + " " + City;
            updateMarker(address);
        }
        else {
            $('#txtAddress').css('border-color', 'red');
        }
    });


    //btnNextAmenities
    $('#btnNextAmenities').click(function () {
        $('#collapseBasicAmenities').removeClass('in');
        $('#linkcollapseDetailInformation').attr('href', '#collapseDetailInformation');
        $('#collapseDetailInformation').addClass('in');
    });



    //autofill of address
    $(".locality").click(function (e) {
        e.preventDefault();
    });


});


//btnLocationConfirmed click event     
//This method is used to open Basic Amenities accordian on selecting area
function fnOpenBasicAmenities() {
    $('#collapseLocality').removeClass('in');
    $('#linkcollapseBasicAmenities').attr('href', '#collapseBasicAmenities');
    $('#collapseBasicAmenities').addClass('in');
}

// Setup the buttons for all transfers
// The "add files" button doesn't need to be setup because the config
// `clickable` has already been specified.
$(".start").click(function () {
    myDropzone.enqueueFiles(myDropzone.getFilesWithStatus(Dropzone.ADDED));
});
$(".cancel").click(function () {
    myDropzone.removeAllFiles(true);
});

//show change location modal
function fnChangeLocation() {
    //prevent click outside and make all keyboard false 
    $("#modalSelectCityAndArea").modal({ backdrop: 'static', keyboard: false });
    //show the modal
    $('#modalSelectCityAndArea').modal('show');
}




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

$("select[name='PGDetailID']").change(function () {
    //visible div block
    $('#txtHouseName').attr("readonly", false);
    $('#txtDisplayName').attr("readonly", false);
    $('#txtDescription').attr("readonly", false);
    $('#btnNextBasicInformation').attr("disabled", false);
   
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
                location.href = HousesUrl;
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

//on Selection of ISPG radio button ddlSelectPG txtPGName
function fnGetAllPGs() {
    //get all PG in the same Area under same owner
    showProgress(false, "Getting PGs. Please wait...");
    $.ajax({
        url: GetPGsByOwnerIDandAreaIDUrl,
        type: 'GET',
        dataType: 'JSON',
        success: function (response, textStatus, XMLHttpRequest) {
            var pgList = $.parseJSON(response);

            if (pgList.length > 0) {

                $('#ddlSelectPG').empty();//Restart the Areas in a City
                $('#ddlSelectPG').append(
                              $('<option value="0" disabled selected></option>').html("--Select PG--")
                          );//Appending default value
                $.each(pgList, function (i, pg) {
                    $('#ddlSelectPG').append($('<option></option>').val(pg.PGDetailID).html(pg.PGName));
                });
            } else {
                fnShowModalNewPGInsertion();
            }
            hideProgress();
        },
        error: function (xhr, status) {
            alert('error');
            hideProgress();
        }
    });

}

//this funtion enables new PG insetion inputbox and hides the selectPG ddl
function fnShowModalNewPGInsertion() {
    //$('#addNewPG').addClass('hidden');//make add new PG icon invisible
    //$('#showAllPGs').removeClass('hidden');
    //$("#ddlSelectPG").val("0");//reset seleted value 
    //$('#lblSelectPG').text("Enter new PG or Hostel Name");//customize the text
    //$('#ddlSelectPG').addClass('hidden');//make ddl selectPG invisible
    //$('#txtPGName').removeClass('hidden');//make the input box for new pg visible    
}


$("#UploadImage").click(function () {

    $.ajax({
        url: ImageUploadUrl,
        type: 'POST',
        dataType: 'json',
        success: function (response, textStatus, XMLHttpRequest) {
            if (response.toUpperCase() == "SUCCESS") {
                alert(response);
                $('#modalUploadHouseImages').modal('hide');

            }
        },
        error: function (xhr, status) {
            $('#modalUploadHouseImages').modal('hide');

        }
    });
});

$(".btnViewAmenities").click(function () {

    if ($(this).parents('.divRowHouse').find('.divAmenities').hasClass('hidden')) {
        $(this).parents('.divRowHouse').find('.divAmenities').removeClass('hidden');
    } else {
        $(this).parents('.divRowHouse').find('.divAmenities').addClass('hidden');
    }
   
});