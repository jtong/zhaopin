describe("ClockTimeChangeQuestion", function() {

    var template_id, html;
    beforeEach(function() {
        template_id = "clock-time-change-question-template";
        html = document.getElementById(template_id).innerHTML;
    });

    it("generate question string", function(){


        var question = ClockTimeChangeQuestion.new_question(html);
        console.log(question._content());
        console.log(question.locals);
        console.log(question._answer());
        question.locals = {
            H1:9,M1:2,
            H2:1.5,M2:1,
            H3:8,M3:3
        }
        console.log(question._answer());
        expect(question._answer()).toBe("2,23");
    });


});