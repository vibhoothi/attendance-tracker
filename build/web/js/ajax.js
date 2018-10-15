$(document).ready(function () {
    $('#getResult').bind("click", function () {

        var operation = $("input[name='operation']:checked").val();
        var first = $('#first').val();
        var second = $('#second').val();

        $.post('CalculatorServlet', {
            operation: operation,
            first: first,
            second: second
        }, function (responseText) {
            $('#calculatorAjaxResponse').text(responseText);
        });
    });
});


$(document).ready(function () {

    setInterval('show()', 1000);


});

function show() {


    $.get('CurrentDateServlet', {}, function (responseText) {
        $('#CurrentDateServletResponse').text(responseText);
    });


}
