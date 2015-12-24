var City = cityname;
var Area = areaname;
var Latitude, Longitude;
var InitialLatitude, InitialLongitude;

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
    $('#divHostels').show();
    $('#divAddHostel').hide();
    $('#divEditHostel').hide();

    //Initialize data table
    $('.dataTables-hostels').dataTable({
        /* Disable initial sort */
        "aaSorting": []
    });

    $('.btn-show-add-hostel').click(function () {
        $('#divHostels').hide();
        $('#divAddHostel').show();
        $('#divEditHostel').hide();
        initialize(false);
    });

    //Char Limit function
    charlimit();
    inputkeyup();

    //form validator
    $("#form-add-a-hostel").validate();
    $("#form-edit-hostel").validate();
    //Add Apartment button
    $('#btnAddHostel').click(function () {
        if ($("#form-add-a-hostel").valid() == true) {
            showProgress(false, "Adding your Hostel...");
            $("#form-add-a-hostel").submit();
        }
    });
   
   
});

$('#txtAddress').blur(function () {
    if ($('#txtAddress').val() != "") {
        
        $('#txtAddress').css('border-color', '#e5e6e7');
        var address = $('#txtAddress').val();
        address = address + " " + Area + " " + City;
        updateMarker(address,false);
    }
    else {
        $('#txtAddress').css('border-color', 'red');
    }
});

$('#txtEditAddress').blur(function () {
    if ($('#txtEditAddress').val() != "") {

        $('#txtEditAddress').css('border-color', '#e5e6e7');
        var address = $('#txtEditAddress').val();
        address = address + " " + Area + " " + City;
        updateMarker(address,true);
    }
    else {
        $('#txtEditAddress').css('border-color', 'red');
    }
});
var geocoder;
function updateMarker(address, bEdit) {
    var map;
    geocoder = new google.maps.Geocoder();
    geocoder.geocode({ 'address': address }, function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            var mapOptions = {
                zoom: 15,
            }
            var image = '../Images/marker-green.png';
            if (bEdit) {
                map = new google.maps.Map(document.getElementById('map-edit-canvas'), mapOptions);
            } else {
                map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
            }
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
            if (bEdit) {
                $('#spnEditLatitude').text(Latitude);
                $('#spnEditLongitude').text(Longitude);
                $('#hdnEditLatitude').val(Latitude);
                $('#hdnEditLongitude').val(Longitude);
            } else {
                $('#spnLatitude').text(Latitude);
                $('#spnLongitude').text(Longitude);
                $('#hdnLatitude').val(Latitude);
                $('#hdnLongitude').val(Longitude);
            }
            (function (marker) {
                google.maps.event.addListener(marker, "dragend", function (e) {
                    var lat, lng, address;
                    geocoder.geocode({ 'latLng': marker.getPosition() }, function (results, status) {
                        if (status == google.maps.GeocoderStatus.OK) {
                            lat = marker.getPosition().lat();
                            lng = marker.getPosition().lng();
                            address = results[0].formatted_address;
                            if (bEdit) {
                                $('#spnEditLatitude').text(lat);
                                $('#spnEditLongitude').text(lng);
                                $('#hdnEditLatitude').val(lat);
                                $('#hdnEditLongitude').val(lng);
                            } else {
                                $('#spnLatitude').text(lat);
                                $('#spnLongitude').text(lng);
                                $('#hdnLatitude').val(lat);
                                $('#hdnLongitude').val(lng);
                            }
                           
                        }
                    });
                });
                google.maps.event.addListener(marker, "click", function (e) {
                    infowindow.open(map, marker);
                });
            })(marker);

        } else {
            alert('Geocode was not successful for the following reason: ' + status);
        }
    });


}

//initialize the map
function initialize(bEdit) {
   
    var address = Area + " " + City;
    var map;
    geocoder = new google.maps.Geocoder();
    geocoder.geocode({ 'address': address }, function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            var mapOptions = {
                zoom: 15,
            }
            var image = '/Images/marker-green.png';
            if (bEdit) {
                map = new google.maps.Map(document.getElementById('map-edit-canvas'), mapOptions);
            }else{
                map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
            }
             
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

            if (bEdit) {
                $('#spnEditLatitude').text(marker.getPosition().lat());
                $('#spnEditLongitude').text(marker.getPosition().lng());
                $('#hdnEditLatitude').val(marker.getPosition().lat());
                $('#hdnEditLongitude').val(marker.getPosition().lng());
            } else {
                $('#spnLatitude').text(marker.getPosition().lat());
                $('#spnLongitude').text(marker.getPosition().lng());
                $('#hdnLatitude').val(marker.getPosition().lat());
                $('#hdnLongitude').val(marker.getPosition().lng());
            }
        }
    });
}
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
                location.href = HostelsUrl;
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

//update apartment
$('#btnEditHostel').click(function () {
    if ($('#form-edit-hostel').valid() == true) {
        showProgress(false, "Updating your Hostel...");
        $('#form-edit-hostel').submit();
    }
});

function fnGetHostelByID(element) {
    var trId = $(element).closest('tr').attr('id');
    var jmodel = { pgDetailID: JSON.stringify(trId) };
   
    showProgress(false, "Getting Hostel Details. Please wait...");
    $.ajax({
        url: GetHostelByIDUrl,
        type: 'POST',
        data: jmodel,
        dataType: 'JSON',
        success: function (response, textStatus, XMLHttpRequest) {
            if (response != null) {
                //alert(response.CreatedOn);
                $('#divHostels').hide();
                $('#divAddHostel').hide();
                $('#divEditHostel').show();
                //Fill apartment details
                $('#hdnEditHostelID').val(response.PGDetailID);
                $('#txtEditHostelName').val(response.PGName);
                $('#txtEditDescription').val(response.Description);
                $('#txtEditAddress').val(response.Address);
                $('#txtEditLandmark').val(response.Landmark);
                $('#hdnEditLatitude').val(response.Latitude);
                $('#hdnEditLongitude').val(response.Longitude);

                initialize(true);
                //set char limit 
               // charlimit();
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


//fuction to check anumber and reconfigure date time to desire (eg: 1 as 01)
function fnCheckNumber(number) {
    if (number < 10)
        return "0" + number;
    else
        return number;
}



