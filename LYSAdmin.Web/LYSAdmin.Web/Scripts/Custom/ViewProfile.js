
        $(document).ready(function () {
            //if message show in  modal
            if (message != "") {
                $('#modalShowMessage').modal('show');
            }

            var $image = $(".image-crop > img")
            $($image).cropper({
                aspectRatio: 1.618,
                preview: ".img-preview",
                done: function (data) {
                    // Output the result data for cropping image.
                }
            });

            var $inputImage = $("#inputImage");
            if (window.FileReader) {
                $inputImage.change(function () {
                    var fileReader = new FileReader(),
                            files = this.files,
                            file;

                    if (!files.length) {
                        return;
                    }

                    file = files[0];

                    if (/^image\/\w+$/.test(file.type)) {
                        fileReader.readAsDataURL(file);
                        fileReader.onload = function () {
                            $inputImage.val("");
                            $image.cropper("reset", true).cropper("replace", this.result);
                        };
                    } else {
                        showMessage("Please choose an image file.");
                    }
                });
            } else {
                $inputImage.addClass("hide");
            }

            $("#saveImage").click(function () {
                var image_data = atob($image.cropper("getDataURL").split(',')[1]);
                // Use typed arrays to convert the binary data to a Blob
                var arraybuffer = new ArrayBuffer(image_data.length);
                var view = new Uint8Array(arraybuffer);
                for (var i = 0; i < image_data.length; i++) {
                    view[i] = image_data.charCodeAt(i) & 0xff;
                }
                try {
                    // This is the recommended method:
                    var blob = new Blob([arraybuffer], { type: 'application/octet-stream' });
                } catch (e) {
                    // The BlobBuilder API has been deprecated in favour of Blob, but older
                    // browsers don't know about the Blob constructor
                    // IE10 also supports BlobBuilder, but since the `Blob` constructor
                    //  also works, there's no need to add `MSBlobBuilder`.
                    var bb = new (window.WebKitBlobBuilder || window.MozBlobBuilder);
                    bb.append(arraybuffer);
                    var blob = bb.getBlob('application/octet-stream'); // <-- Here's the Blob
                }

                // Use the URL object to create a temporary URL
                var url = (window.URL || window.webkitURL).createObjectURL(blob);
                location.href = url; // <-- Download!
                document.getElementById("profile").src = url;
                // alert(url);
                url = url.split(':')[1].replace('%3A',':').replace('%3A',':');
                //alert(url);
                alert("New URL" +url);
                $('#profilePic').val(url);
                //by default set width and height to 48px so the image size not increase
                document.getElementById("profile").style.width = "48px";
                document.getElementById("profile").style.height = "48px";
            });

            $("#changePassword").click(function () {
                $("#modalChangePassword").modal({ backdrop: 'static', keyboard: false });
                //show the modal
                $('#modalChangePassword').modal('show');

            });

        });
      
$('#btnChangePassword').click(function () {
    fnSaveLocation();
});

function fnSaveLocation() {
    var jmodel = { Password: $("#txtNewPassword").val()};

    showProgress(false, "Updating Password. Please wait...");
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