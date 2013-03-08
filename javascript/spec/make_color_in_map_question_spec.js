describe("MakeColorInMapQuestion", function() {

    var template_id, html;
    beforeEach(function() {
        template_id = "make-color-in-map-template";
        html = document.getElementById(template_id).innerHTML;
    });

    it("generate question string", function(){

//        var question = new DutchAuctionQuestion(html, function(array){
//            return array;
//        });
//        result="<p>竞价游戏\n"
//                +"出价最低且没有其他人跟他出的价格相同的人获胜\n"
//                +"竞价开始<ul><li>张三出价3</li><li>李四出价14</li><li>王五出价2</li><li>刘六出价4</li><li>赵大出价5</li><li>钱二出价4</li><li>孙甲出价9</li><li>李乙出价2</li><li>周丙出价4</li><li>吴丁出价3</li><li>郑戊出价10</li><li>王己出价8</li><li>李庚出价11</li><li>吴辛出价5</li><li>谢壬出价13</li><li>周癸出价9</li></ul></p>"
//        expect(result).toBe(question._content());
        var question = MakeColorInMapQuestion.new_question(html);
        console.log(question._content());
        console.log(question._answer());
    });


});