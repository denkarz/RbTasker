$(document).ready( function () {
    $('.new_todo').hide()
    icheck();
    $("#select_id").select2({
        minimumResultsForSearch: -1
    });
    $('#link_id').click(function (evt) {
        let selected = document.getElementsByName('todo[project_id]')[0]
        let project_id = selected.options[selected.selectedIndex].value
        let text = $.trim($('#input_id').val())
        if (text === '' || project_id === '-1') evt.preventDefault()
        else $('#link_id').attr('href','/custom_controller/create?project_id='+ project_id +'&amp;text=' + text)
    })
    $('#add_link').click(function (evt) {
        if ($('.new_todo').hasClass('shadow')) evt.preventDefault()
        else $('.new_todo').show().toggleClass("shadow");
    })
    $('#close_id').click(function () {
         $('.new_todo').hide().toggleClass("shadow");
    })
    $('li').click(function (evt) {
        let param = this.getElementsByTagName('input')[0].value
        window.location = '/custom_controller/update' + param
        }
    )
    $('li .icheck-me').on("ifChanged", function () {
        let param2 = this.parentNode.parentElement.getElementsByTagName('input')[0].value
        window.location = '/custom_controller/update' + param2
    })
})

function icheck() {
    if($(".icheck-me").length > 0){
        $(".icheck-me").each(function(){
            var $el = $(this);
            var skin = ($el.attr('data-skin') !== undefined) ? "_" + $el.attr('data-skin') : "",
                color = ($el.attr('data-color') !== undefined) ? "-" + $el.attr('data-color') : "";
            var opt = {
                checkboxClass: 'icheckbox' + skin + color,
                radioClass: 'iradio' + skin + color,
            }
            $el.iCheck(opt);
        });
    }
}