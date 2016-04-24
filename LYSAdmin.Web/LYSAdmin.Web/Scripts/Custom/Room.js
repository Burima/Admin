var City = cityname;
var Area = areaname;

//converting all the areas in json list
eval("var areaList = " + Areas);

$(document).ready(function () {

    //set char limli of all the inputs
    charlimit();
    inputkeyup();

    if (AreaID == 0) {
        fnChangeLocation();
    }
    //view all apartments
    $('#divRooms').show();
    $('#divAddRoom').hide();

    //Initialize data table
    $('.dataTables-houses').dataTable({
        /* Disable initial sort */
        "aaSorting": []
    });

    $('.btn-show-add-room').click(function () {
        $('#divRooms').hide();
        $('#divAddRoom').show();
    });

    $('#btnAddRoom').click(function () {
        if ($("#add-room-form").valid() == true) {
            showProgress(false, "Adding your Room...");
            $("#add-room-form").submit();
        }
    });
});

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

$('#btnSaveLocation').click(function () {
   
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
                location.href = RoomsUrl;
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
