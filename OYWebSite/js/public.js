
function toAlphaPosition(current) {
    document.getElementById(current).scrollIntoView();
}
function mouseover(current, flag) {
    if (flag == "top") {
        $('#' + current).css('border-bottom', '1px solid #dd224f');
    }
    $('#' + current).children('span').css('background', '#dd224f');
    $('#' + current).children('a').css('color', '#dd224f');
}

function mouseout(current, flag) {
    if (flag == "top") {
        $('#' + current).css('border-bottom', 'none');
    }
    $('#' + current).children('span').css('background', 'none');
    $('#' + current).children('a').css('color', 'black');
}