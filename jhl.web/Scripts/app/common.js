function resetForm() {
    $('#crud-form').trigger('reset');
    $('#form-modal-label').html('Thêm mới');
}

function saveItem(uri, id, obj) {
    var type = 'POST';
    var data = obj;
    var message = "Thêm mới thành công.";

    // for edit data
    if (id != null && id != 0 && id != '') {
        type = "PUT";
        uri = uri + '/' + id;
        message = "Cập nhật thành công.";
    }

    // save data
    $.ajax({
        url: uri,
        type: type,
        async: false,
        dataType: "json",
        data: JSON.stringify(data),
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            alert(message);
            resetForm();
            $('#form-modal').modal('hide');
            getData();
        },
        error: function (response) {
            if (response != null && response.responseJSON) {
                var modelState = response.responseJSON.ModelState;
                var errors = [];
                for (var key in modelState) {
                    if (modelState.hasOwnProperty(key)) {
                        for (var i = 0; i < modelState[key].length; i++) {
                            errors.push(modelState[key][i]);
                        }
                    }
                }
                $('#crud-error-message').html(errors.join('<br />'));
                $('#crud-error').show();
            }
            alert('Lỗi Server.');
        }
    })
}

function deleteItem(uri) {
    if (confirm('Bạn có chắc chắn muốn xóa?')) {
        $.ajax({
            url: uri,
            type: "DELETE",
            async: false,
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                alert('Xóa dữ liệu thành công.');
                getData();
            },
            error: function (result) {
                alert('Lỗi Server.');
                console.log(result);
            }
        });
    }
}

