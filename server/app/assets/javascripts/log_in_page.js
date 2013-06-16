/**
 * Created with JetBrains RubyMine.
 * User: fortunezhang
 * Date: 13-5-30
 * Time: 上午10:37
 * To change this template use File | Settings | File Templates.
 */

function show_regist_from() {

    $("#regist").show();
    $("#log_in").hide();
    $("#log").css("background-image", "url(/assets/blue1.png)");

}

function show_log_in_form() {
    $("#regist").hide();
    $("#log_in").show();
    $("#log").css("background-image", "url(/assets/blue2.png)");

}

