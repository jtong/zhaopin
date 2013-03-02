describe("HouseColorSequenceGuessQuestion", function() {

    var template_id, html;
    beforeEach(function() {
        template_id = "house-color-sequence-template";
        html = document.getElementById(template_id).innerHTML;
    });

    it("generate question string", function(){

        var question = new HouseColorSequenceGuessQuestion(html, function(array){
            return array;
        })
        var result = "<p>在一条街上有五栋房子并排，颜色各为：白绿黑红黄。但不知道排列顺序，仅知道：\n"
                    +"老张是一个白发老头，住黑房子。\n"
                    +"老李是秃子的邻居，住绿房子。\n"
                    +"老王是看门人，住白房子。\n"
                    +"老刘的房子在看门人家的右边，秃子的左边。\n"
                    +"老赵是个秃子，住红房子，他家右边第二个房子的主人是个白发老头。\n"
                    +"问从左至右房子的颜色是什么？\n"
                    +"</p>";
        expect(result).toBe(question._content());
    });

    it("should get answer by shuffle", function(){

        var question = new HouseColorSequenceGuessQuestion(html, function(array){
            return array;
        });
        var result = question._answer();
        expect(result).toBe("白房子黄房子红房子绿房子黑房子");
    });
});