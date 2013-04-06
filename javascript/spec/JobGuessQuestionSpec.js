describe("JobGuessQuestionBuilder", function() {

    var template_id, html, new_question;
    beforeEach(function() {
        template_id = 'job-guess-template';
        html = document.getElementById(template_id).innerHTML;
        new_question = JobGuessQuestionBuilder.new_question;

    });

    it("generate question string", function(){

        var question = new JobGuessQuestionBuilder(html, function(array){
            return array;
        })
        var result = "<p>一次聚会上，麦吉遇到了张三、李四和王五三个人，\n"
            +"他想知道他们三人分别是干什么的，但三人只提供了以下信息：\n"
            +"三人中一位是律师、一位是推销员、一位是医生；\n"
            +"王五比医生年龄大，张三和推销员不同岁，推销员比李四年龄小。\n"
            +"</p>";
        expect(result).toBe(question._content());
    });

    it("should generate specific variables", function(){

        var question = new JobGuessQuestionBuilder(html, function(array){
           return array;
        });
        var result = question._variables();
        expect(result).hasOwnProperty("P1");
        expect(result).hasOwnProperty("P2");
        expect(result).hasOwnProperty("P3");
        expect(result.P1).toBe("张三")
        expect(result.P2).toBe("李四");
        expect(result.P3).toBe("王五");
    });

    it("should generate random variables", function(){
        var question = new_question(html);
        var result1 = question._variables();
        var result2 = question._variables();
        var result3 = question._variables();
        expect(result1.P1 == result2.P1
            && result1.P2 == result2.P2
            && result1.P3 == result2.P3
            && result3.P1 == result2.P2
            && result3.P2 == result2.P2
            && result3.P3 == result3.P3).toBe(false);
    });

    it("should get answer by shuffle", function(){

        var question = new JobGuessQuestionBuilder(html, function(array){
            return array;
        });
        var result = question._answer();
        expect(result).toBe("医生,张三,律师,李四,推销员,王五");
    });

});