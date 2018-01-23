var api = '/api/Users';

$(document).ready(function () {
    getData();
});

//get data
function getData() {
    var pageSize = $('#pageSize').val();
    var keyword = $('#keyword').val();
    var pageNumber = $('#pagenumber').val();
    var uri = api + '?pageNumber=' + pageNumber + '&pageSize=' + pageSize + '&keyword=' + keyword;
    $.getJSON(uri)
        .done(function (data, status, xhr) {
            var paging = JSON.parse(xhr.getResponseHeader('Paging-Headers'));
            renderHTML(data, paging);
        })
        .fail(function (jqxhr, textStatus, error) {
            var err = textStatus + ", " + error;
            console.log("Request Failed: " + err);
            console.log("Lỗi Server.");
        });
}

// reset filter
function resetFilter() {
    var pageSize = $('#pageSize').val(10);
    var keyword = $('#keyword').val(null);
    var pageNumber = $('#pagenumber').val(1);
    getData();
}

// edit item
function edit(id) {
    $('#form-modal-label').html('Cập nhật');
    getItem(id);
}

// save item
function save() {
    if (isDataValid()) {
        var obj = collectData();
        saveItem(api, obj.ID, obj);
    } else {
        return;
    }
}

// delete item
function remove(id) {
    deleteItem(api + '/' + id);
}

// render html
function renderHTML(data, paging) {
    var result = "";
    if (data != null && data.length > 0) {
        $.each(data, function (key, item) {
            result +=
                '<tr class="">' +
                '<td class=""><img src="' + item.PhotoImage + '" style="height:50px; width:70px;" class="img-thumbnail"/></td>' +
                '<td class="">' + item.Username + '</td> ' +
                '<td class="">' + item.FirstName + ' ' + item.LastName + '</td> ' +
                '<td class="">' + item.Phone + '</td> ' +
                '<td class="">' + item.Email + '</td> ' +
                '<td class="">' + item.Active + '</td> ' +
                '<td class="">' + new Date(item.Created).toLocaleDateString() + '</td> ' +
                '<td class="text-right"><button class="btn btn-xs btn-success" data-toggle="modal" data-target="#form-modal" data-backdrop="static" data-keyboard="false" onclick="edit(' + item.ID + ')"><span class="fa fa-pencil"></span></button> <button class="btn btn-xs btn-danger" onclick="remove(' + item.ID + ')"><span class="fa fa-trash"></span></button></td> ' +
                '</tr>';
        });

        var fromItem = ((paging.currentPage * paging.pageSize) - paging.pageSize) + 1;
        var toItem = (paging.currentPage - 1 + (paging.currentPage * paging.pageSize));

        if (toItem > paging.totalCount) {
            toItem = paging.totalCount;
        }

        $('#crud-tabe-info').html('Hiển thị ' + fromItem + ' đến  ' + toItem + '  trên tổng số ' + paging.totalCount + ' bản ghi');
        var pagging = '<li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>';
        for (var i = 1; i <= paging.totalPages; i++) {
            if (i == paging.currentPage) {
                pagging += '<li class="paginate_button active"  tabindex="' + i + '"><a href="#" onclick="return false;">' + i + '</a></li>';
            } else {
                pagging += '<li class="paginate_button" tabindex="' + i + '"><a href="#" onclick="$(\'#pagenumber\').val(' + i + ');getData();return false;">' + i + '</a></li>';
            }
        }
        pagging += '<li class="disabled"><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>';
        $('#crud-pagging').html(pagging);
    } else {
        result = '<td colspan="8">Không có dữ liệu</td>';
    }
    $('#tbody').html(result);
}

// validate form
function isDataValid() {
    var check = false;
    if ($('#Username').val() == null || $('#Username').val().trim().length <= 0) {
        alert('Tên đăng nhập không được để trống.');
        $('#Username').focus();
    } else {
        if ($('#Password').val() == null || $('#Password').val().trim().length <= 0) {
            alert('Mật khẩu không được để trống.');
            $('#Password').focus();
        } else {
            if ($('#Email').val() == null || $('#Email').val().trim().length <= 0) {
                alert('Địa chỉ email không được để trống.');
                $('#Email').focus();
            } else {
                check = true;
            }
        }
    }
    return check;
}

//collect data
function collectData() {
    var obj = {
        ID: $('#ID').val() || 0,
        Username: $('#Username').val(),
        Password: $('#Password').val(),
        LastName: $('#LastName').val(),
        FirstName: $('#FirstName').val(),
        BirthDate: $('#BirthDate').val(),
        Gender: $('#Gender').val(),
        Address: $('#Address').val(),
        Phone: $('#Phone').val(),
        Email: $('#Email').val(),
        Photo: $('#Photo').val() || 1,
        Attempt: $('#Attempt').val() || 3,
        Notes: $('#Notes').val() || "Không",
        Active: $('#Active').val() || true,
        Deleted: $('#Deleted').val() || false,
        Created: $('#Created').val(),
        CreatedBy: $('#CreatedBy').val(),
        Modified: $('#Modified').val(),
        ModifiedBy: $('#ModifiedBy').val(),
    };
    return obj;
}

// get item
function getItem(id) {
    $.ajax({
        url: api + '/' + id,
        type: "GET",
        async: false,
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            bindData(data);
        },
        error: function (result) {
            alert('Lỗi Server.');
            console.log(result);
        }
    });
}

// bind data
function bindData(data) {
    if (data != null) {
        $('#ID').val(data.ID);
        $('#Username').val(data.Username);
        $('#Password').val(data.Password);
        $('#LastName').val(data.LastName);
        $('#FirstName').val(data.FirstName);
        $('#BirthDate').val(data.BirthDate);
        $('#Gender').val(data.Gender);
        $('#Address').val(data.Address);
        $('#Phone').val(data.Phone);
        $('#Email').val(data.Email);
        $('#Photo').val(data.Photo);
        $('#Attempt').val(data.Attempt);
        $('#Notes').val(data.Notes);
        $('#Active').val(data.Active + '');
        $('#Deleted').val(data.Deleted + '');
        $('#Created').val(data.Created);
        $('#CreatedBy').val(data.CreatedBy);
        $('#Modified').val(data.Modified);
        $('#ModifiedBy').val(data.ModifiedBy);

        $('#ConfirmPassword').val(data.Password);
        $('#PhotoPath').attr('src', data.Image.Path);
    }
}

function selectImageClick() {
    var imageAPI = '/api/Images';
    $.getJSON(imageAPI)
        .done(function (data, status, xhr) {
            renderImagesBoxHTML(data);
        })
        .fail(function (jqxhr, textStatus, error) {
            var err = textStatus + ", " + error;
            console.log("Request Failed: " + err);
            console.log("Lỗi Server.");
        });
}

function renderImagesBoxHTML(data) {
    var result = '';
    $.each(data, function (key, item) {
        result +=
            '<div class="col-sm-2"><a onclick="selectImage(' + item.ID + ', \'' + item.Path + '\')" title="' + item.FileName + '" ondblclick="imageSelected()">' +
            '<img class="img-thumbnail" alt="' + item.FileName + '" id="cat-image-' + item.ID + '" src="' + item.Path + '" />' +
            '</a></div>';
    });
    $('#crud-images-list').html(result);
}