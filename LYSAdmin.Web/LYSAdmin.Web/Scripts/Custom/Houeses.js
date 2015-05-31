$(document).ready(function () {
    charlimit();
    inputkeyup();

    //apartmet seletion change
    $("select[name='Apartment']").change(function () {
        //visible div block
        $('#divBlocks').removeClass('hidden');

        //var val = $(this).find("option[val='" + $(this).val() + "']").attr("val");
        //$(this).parents("form").find(".selectDenomonation").val(val);
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
    $("select[name='NumberOfRooms']").change(function () {
        var val = $(this).find(':selected').attr('value');
        if (val > 0) {
            var divRoomDetails=$('#divRoomdetails');
            divRoomDetails.removeClass('hidden');
            divRoomDetails.empty();
            divRoomDetails.append('<div><h4>Room Details</h4></div>');
            for (var i = 1; i <=val; i++) {
                var newroom = '<div class="row margin-bottom-2-pc">' +
                                         '<label class="col-md-2">Room <span>' + i + '</span></label>' +
                                         '<div class="col-md-3">' +
                                             '<select class="number-of-beds form-control" tabindex="1">' +
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
                                         '<div class="col-md-3"><input type="text" placeholder="Mothly Rent" class="form-control monthly-rent" /></div>' +
                                         '<div class="col-md-3"><input type="text" placeholder="Deposit" class="form-control deposit" /></div></div>';
                        
                divRoomDetails.append(newroom);
            }

        }
    });

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

    $(document).on("click", ".locality", function (e) {
        e.preventDefault();
        initialize();
    });
    var geocoder;
    var map;
    var infowindow;
    var latlng;
    function initialize() {
        geocoder = new google.maps.Geocoder();
        latlng = new google.maps.LatLng(21.1311084, 82.7792231);
        var mapOptions = {
            zoom: 4,
            center: latlng
        }
        map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
    }

    $(document).on("click", "#btnNext", function (e) {
        e.preventDefault();
        codeAddress();
    });
    function codeAddress() {
        var address = document.getElementById('txtAddress').value;
        geocoder.geocode({ 'address': address }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                var mapOptions = {
                    zoom: 15,
                }
                var image = '/Images/marker-green.png';
                map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
                map.setCenter(results[0].geometry.location);
                var marker = new google.maps.Marker({
                    map: map,
                    position: results[0].geometry.location,
                    animation: google.maps.Animation.DROP,
                    draggable: true,
                    icon: image
                });
                infowindow = new google.maps.InfoWindow();

            } else {
                alert('Geocode was not successful for the following reason: ' + status);
            }
        });
    }


    google.maps.event.addDomListener(window, 'load', initialize);


});

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

var cityOptions = {
    types: ['(regions)']
};
var city = document.getElementById('txtAddress');
var cityAuto = new google.maps.places.Autocomplete(city, cityOptions);
