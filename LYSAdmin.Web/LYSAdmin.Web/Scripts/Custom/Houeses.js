
var City = cityname;
var Area = areaname;
var Latitude, Longitude;
var InitialLatitude, InitialLongitude;

//converting all the areas in json list
eval("var areaList = " + Areas);

$(document).ready(function () {

    $('#addNewPG').click(function () {
        fnEnableNewPGInsertion();
    });
    $('#showAllPGs').click(function () {
        fnEnableShowingAllPGs();
    });
    //if area is not selected show modal
    //for select City and fnOpenBasicAmenities()
    if (AreaID == 0) {
        fnChangeLocation();
    }
   
    //set char limli of all the inputs
    charlimit();
    inputkeyup();

    
    //apartmet seletion change
    $("select[name='ApartmentID']").change(function () {
        //visible div block
        $('#divBlocks').removeClass('hidden');

        var blocks = $(this).find(':selected').attr('blocks');
        eval("var blockList = " + blocks);

        /* number of items in features array
           by default it will contain [] so length will two if there is no blocks
        */
        if (Object.keys(blocks).length > 2) {
            //make no block found invisible
            $('#spnNoBlockFound').addClass("hidden");
            $('#ddlBlocks').removeClass('hidden');
            //add all the block to the ddl for the selected apartment
            //default option
            $('#ddlBlocks').empty();
            $('#ddlBlocks').append(
                   $('<option value="" disabled selected></option>').html("--Select Block--")
               );
            $.each(blockList, function (i, block) {
                $('#ddlBlocks').append(
                $('<option></option>').val(block.BlockID).html(block.BlockName)
               );
            });
        } else {
            $('#spnNoBlockFound').removeClass("hidden");
            $('#ddlBlocks').addClass('hidden');
        }
    });

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
                                         '<div class="col-md-3"><input type="text" placeholder="Deposit" class="form-control deposit required" id="Rooms' + i  + '.Deposit" name="Rooms[' + (i - 1) + '].Deposit"/></div></div>';

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
            initialize();
            $('#linkcollapseLocality').attr('href', '#collapseLocality'); //activate collapseable functionality through linking it with the target id 
            $('#collapseLocality').addClass('in');//open Locality panel
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

    //btnSaveAllInformation click event
    $('#btnSaveAllInformation').click(function () {
        alert(fnValidateAllRequiredfield());
    });


    /*---------------------- end button click events for every forms ----------------------------------------------------*/

    //dropzone
    Dropzone.options.myAwesomeDropzone = {

        autoProcessQueue: false,
        parallelUploads: 100,
        maxFiles: 100,
        paramName: "files",

        // Dropzone settings
        init: function () {
            var myDropzone = this;

            this.element.querySelector("button[type=submit]").addEventListener("click", function (e) {
                e.preventDefault();
                e.stopPropagation();
                myDropzone.processQueue();
            });
            this.on("sendingmultiple", function () {
            });
            this.on("successmultiple", function (files, response) {
            });
            this.on("errormultiple", function (files, response) {
            });
        }

    }

    //autofill of address
    $(".locality").click(function (e) {
        e.preventDefault();
    });
    var geocoder;
    var map;
    var contentString = '<div id="form-group">'+
        '<div id="row">' +
        '<div class="col-md-8"><h4>Is this your final selected location?</h4></div>'+
        '<div class="col-md-4"><button type="button" id= "btnLocationConfirmed" onclick=fnOpenBasicAmenities() class="btn btn-primary" >Yes</button></div>' +
      '</div>'+
        '</div>';
    var infowindow = new google.maps.InfoWindow({
        content: contentString
    });
    function updateMarker(address) {
        geocoder = new google.maps.Geocoder();
        geocoder.geocode({ 'address': address }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                var mapOptions = {
                    zoom: 15,
                }
                var image = '/Images/marker-green.png';
                map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
                map.setCenter(results[0].geometry.location);
                Latitude = results[0].geometry.location.lat();
                Longitude = results[0].geometry.location.lng();
                var marker = new google.maps.Marker({
                    map: map,
                    position: results[0].geometry.location,
                    animation: google.maps.Animation.DROP,
                    draggable: true,
                    icon: image
                });
                
                $('#spnLatitude').text(Latitude);
                $('#spnLongitude').text(Longitude);
                $('#hdnLatitude').val(Latitude);
                $('#hdnLongitude').val(Longitude);
                (function (marker) {
                    google.maps.event.addListener(marker, "dragend", function (e) {
                        var lat, lng, address;
                        geocoder.geocode({ 'latLng': marker.getPosition() }, function (results, status) {
                            if (status == google.maps.GeocoderStatus.OK) {
                                lat = marker.getPosition().lat();
                                lng = marker.getPosition().lng();
                                address = results[0].formatted_address;
                                $('#spnLatitude').text(lat);
                                $('#spnLongitude').text(lng);
                                $('#hdnLatitude').val(lat);
                                $('#hdnLongitude').val(lng);
                            }
                        });
                    });
                    google.maps.event.addListener(marker, "click", function (e) {
                        infowindow.open(map,marker);
                    });
                })(marker);

            } else {
                alert('Geocode was not successful for the following reason: ' + status);
            }
        });


    }
    //initialize the map
    function initialize() {
        //fnUpdateLocation();
        var address = Area + " " + City;
        geocoder = new google.maps.Geocoder();
        geocoder.geocode({ 'address': address }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                var mapOptions = {
                    zoom: 15,
                }
                var image = '/Images/marker-green.png';
                var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
                map.setCenter(results[0].geometry.location);
                InitialLatitude = results[0].geometry.location.lat();
                InitialLongitude = results[0].geometry.location.lng();
                var marker = new google.maps.Marker({
                    map: map,
                    position: results[0].geometry.location,
                    animation: google.maps.Animation.DROP,
                    draggable: false,
                    icon: image
                });
               
                (function (marker) {
                    google.maps.event.addListener(marker, 'click', function () {
                      
                        infowindow.open(map, marker);
                    });
                })(marker);
                $('#spnLatitude').text(marker.getPosition().lat());
                $('#spnLongitude').text(marker.getPosition().lng());
                $('#hdnLatitude').val(marker.getPosition().lat());
                $('#hdnLongitude').val(marker.getPosition().lng());
            }
        });
    }

});


//btnLocationConfirmed click event     
//This method is used to open Basic Amenities accordian on selecting area
function fnOpenBasicAmenities() {
    $('#collapseLocality').removeClass('in');
    $('#linkcollapseBasicAmenities').attr('href', '#collapseBasicAmenities');
    $('#collapseBasicAmenities').addClass('in');
}


//show change location modal
function fnChangeLocation() {
    //prevent click outside and make all keyboard false 
  $("#modalSelectCityAndArea").modal({ backdrop: 'static', keyboard: false });
    //show the modal
   $('#modalSelectCityAndArea').modal('show');
}

//show the limit of char left
function charlimit() {
    $("form :input").each(function () {
        var input = $(this); // This is the jquery object of the input, do what you will
        if (input.parent().find("span.span-char-left").length) {
            input.parent().find("span.span-char-left").text((input.attr("maxlength")) - (input.val().trim().length));
        }
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
$('input[name=IsPGorHostel]').click(function () {

    if ($('input:radio[name=IsPGorHostel]:checked').val()==1) {
        $('#lblSelectPG').removeClass('hidden');
        //get all PG in the same Area under same owner
        showProgress(false, "Getting PGs. Please wait...");
        $.ajax({
            url: GetPGsByOwnerIDandAreaIDUrl,
            type: 'GET',           
            dataType: 'JSON',
            success: function (response, textStatus, XMLHttpRequest) {
                var pgList = $.parseJSON(response);
                
                if (pgList.length > 0) {
                    fnEnableShowingAllPGs();
                    $('#ddlSelectPG').empty();//Restart the Areas in a City
                    $('#ddlSelectPG').append(
                                  $('<option value="0" disabled selected></option>').html("--Select PG--")
                              );//Appending default value
                    $.each(pgList, function (i, pg) {                        
                        $('#ddlSelectPG').append($('<option></option>').val(pg.PGDetailID).html(pg.PGName));
                    });
                } else {
                    fnEnableNewPGInsertion();
                }
                hideProgress();
            },
            error: function (xhr, status) {
                alert('error');
                hideProgress();
            }
        });
    } else {
        $('#addNewPG').addClass('hidden');//make add new PG icon invisible
        $('#showAllPGs').addClass('hidden');
        $('#lblSelectPG').addClass('hidden');
        $('#ddlSelectPG').addClass('hidden');
        $('#txtPGName').addClass('hidden');
    }
});

//this funtion enables new PG insetion inputbox and hides the selectPG ddl
function fnEnableNewPGInsertion() {
    $('#addNewPG').addClass('hidden');//make add new PG icon invisible
    $('#showAllPGs').removeClass('hidden');
    $("#ddlSelectPG").val("0");//reset seleted value 
    $('#lblSelectPG').text("Enter new PG or Hostel Name");//customize the text
    $('#ddlSelectPG').addClass('hidden');//make ddl selectPG invisible
    $('#txtPGName').removeClass('hidden');//make the input box for new pg visible    
}

//this funtion enables selectPG ddl  and hides the new PG insetion inputbox
function fnEnableShowingAllPGs() {   
    $('#addNewPG').removeClass('hidden');//make add new PG icon visible
    $('#showAllPGs').addClass('hidden');
    $('#lblSelectPG').text("Select PG or Hostel in your Saved Area");//set label text
    $('#ddlSelectPG').removeClass('hidden');//make ddlSelectPG visible if PG is found
    $('#txtPGName').val("");//make new PGName empty (if we are selecting the pg PGName should be empty)
    $('#txtPGName').addClass('hidden');//hide txtPGName
}

//this function will validate all required field value
function fnValidateAllRequiredfield() {
    var flag = false;
    $("#collapseDetailInformation .required").each(function () {

        var id = $(this).attr("id");
        var value = $("#" + id).val();
        alert($(this).html());
        if (value.trim() == "") {
            console.log("no value detected" + id + "----------" + value);
            $("#" + id).css("border", "1px solid red");
            flag = true;
        }
        else {
            $("#" + id).css("border", "1px solid #e5e6e7");
            flag = false;
        }
    });

    if (flag) {
        return false;
    }
}


