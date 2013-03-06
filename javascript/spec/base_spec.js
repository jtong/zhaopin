describe("QuestionBase", function() {


    beforeEach(function() {

    });

    it("merge all context to one", function(){
        var question = new QuestionBase();
        var content_1 = {"p1":"v1", "p2":"v2"};
        var content_2 = {"p3":"v3"};
        var context = question._build_context([content_1, content_2]);
        expect(context.p1).toBe("v1");
        expect(context.p2).toBe("v2");
        expect(context.p3).toBe("v3");
    });


});