var $paymentMethod = 'paypal';
var $startingCoins = 5;
var $selectedCoins = $startingCoins;
function submitPaymentForm()
{
    var form = $('#' + $paymentMethod + '-form');
    form.submit();
    return false;
}
function changePaymentMethod(e)
{
    var $this = $(e);
    var value = $this.find('option:selected').val();
    $paymentMethod = value;
}
function updateInfoPane(val)
{
    var val2;
    var pane = $('#payment-infoPane-price');
    var pane2 = $('#payment-infoPane-dollars');
    pane.html(val);
    if (val==50) {val2=5;}
    if (val==100) {val2=10;}
    if (val==250) {val2=20;}
    if (val==500) {val2=40;}
    if (val==1000) {val2=80;}
    pane2.html(val2);
    $selectedCoins = val;
    var form = $('#' + $paymentMethod + '-form');
    if ($paymentMethod == 'paypal')
    {
        var input = form.find('input[name=amount]');
        input.val(val2);
    }
}
function strpos(haystack, needle, offset)
{
    var i = (haystack + '').indexOf(needle, (offset || 0));
    return i === -1 ? false : i;
}
function updateProductId(value)
{
    var current = $('#' + $paymentMethod + '-product-id').val();
    var pos = strpos(current, 'RevoTeam');
    var preKey = current.substr(0, pos + 6);
    var newProductId = preKey + value;
    $('#' + $paymentMethod + '-product-id').val(newProductId);
}
$(document).ready(function ()
{
    $('#selected-coins-input').keydown(function (event)
    {
        if (event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 27 || (event.keyCode == 65 && event.ctrlKey === true) || (event.keyCode >= 35 && event.keyCode <= 39))
        {
            return;
        }
        else {
            if ((event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105)) {
                event.preventDefault();
            }
        }
    });
    $('#selected-coins-input').keyup(function (event)
    {
        var currentValue = parseInt($('#selected-coins-input').val());
        if (typeof currentValue == 'undefined' || currentValue == 0 || currentValue < 1)
        {
            currentValue = 50;
            $('#selected-coins-input').val(1);
        }
        else if (currentValue > 500)
        {
            currentValue = 500;
            $('#selected-coins-input').val(1000);
        }
        else if (isNaN(currentValue) || currentValue == '')
        {
            currentValue = 50;
        }
        updateInfoPane(currentValue);
        updateProductId(currentValue);
        return true;
    });
    $('#payment-increase-coins').on('click', function (event)
    {
        var currentValue = parseInt($('#selected-coins-input').val());
        var newCoinValue = parseInt(currentValue);
        if (typeof currentValue == 'undefined' || currentValue == '' || isNaN(currentValue))
        {
            currentValue = 50;
        }
        if (currentValue == 100)
        {
            newCoinValue = 250;  
        }
        else if (currentValue < 1000)
        {
            newCoinValue = currentValue * 2;
        }
        $('#selected-coins-input').val(newCoinValue);
        updateInfoPane(newCoinValue);
        updateProductId(newCoinValue);
        return false;
    });
    $('#payment-decrease-coins').on('click', function (event)
    {
        var currentValue = parseInt($('#selected-coins-input').val());
        var newCoinValue = parseInt(currentValue);
        if (typeof currentValue == 'undefined' || currentValue == '' || isNaN(currentValue))
        {
            currentValue = 50;
            $('#selected-coins-input').val(1);
        }
        if (currentValue == 250)
        {
           newCoinValue = 100;        
        }
        else if (currentValue > 50)
        {
            newCoinValue = currentValue / 2;
        }
        $('#selected-coins-input').val(newCoinValue);
        updateInfoPane(newCoinValue);
        updateProductId(newCoinValue);
        return false;
    });
});