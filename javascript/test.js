var jade = require('jade')

var fs = require("fs");

var _= require("underscore");

var htmlTemplateHead = "<html><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8'  /></head><body>"
var htmlTemplateTail = "</body></html>"

eval(fs.readFileSync('./src/base.js')+'');
eval(fs.readFileSync('./src/clock_time_change_question.js')+'');
eval(fs.readFileSync('./src/dutch_auction_question.js')+'');
eval(fs.readFileSync('./src/house_color_sequence_guess.js')+'');
eval(fs.readFileSync('./src/idea_approval_question.js')+'');
eval(fs.readFileSync('./src/job_guess_question.js')+'');
eval(fs.readFileSync('./src/make_color_in_map_question.js')+'');
eval(fs.readFileSync('./src/sharp_classify_question.js')+'');
eval(fs.readFileSync('./src/when_to_clean_form_question.js')+'');

var questionTemplates = [
          ClockTimeChangeQuestion.new_question(fs.readFileSync('./src/content_templates/clock_time_change_question.jade').toString()),
          DutchAuctionQuestion.new_question(fs.readFileSync('./src/content_templates/dutch_auction_question.jade').toString()),
          HouseColorSequenceGuessQuestion.new_question(fs.readFileSync('./src/content_templates/house_color_sequence_guess.jade').toString()),
          IdeaApprovalQuestionBuilder.new_question(fs.readFileSync('./src/content_templates/idea_approval_question.jade').toString()),
          JobGuessQuestionBuilder.new_question(fs.readFileSync('./src/content_templates/job_guess_question.jade').toString()),
          MakeColorInMapQuestion.new_question(fs.readFileSync('./src/content_templates/make_color_in_map_question.jade').toString()),
          SharpClassifyQuestion.new_question(fs.readFileSync('./src/content_templates/sharp_classify_question.jade').toString()),
          WhenToCleanFormQuestion.new_question(fs.readFileSync('./src/content_templates/when_to_clean_form_question.jade').toString())

        ];

        var number = 1;
        if(process.argv.length > 2) {
          number = process.argv[2];
        }
        
        for (var i = 0; i < number; i++) {
        questionTemplates.sort(function(){return (Math.round(Math.random())-0.5);});
        
        var questionArray = [];
        var answerArray = [];
        for(var index = 0; index < questionTemplates.length; index++) {
            var question = questionTemplates[index];
            questionArray.push("<h1>Question " + (index + 1) +"</h1>");
            questionArray.push(question._content());
            answerArray.push("<h1>Answer to Question " + (index + 1) +"</h1>");
            answerArray.push("<p>" + question._answer() + "</p>");
        }

        fs.writeFileSync("./question_sheet_" + (i + 1) +".html", htmlTemplateHead + questionArray.join(" ") + htmlTemplateTail)
        fs.writeFileSync("./answer_sheet_" + (i + 1) +".html", htmlTemplateHead + answerArray.join(" ") + htmlTemplateTail)
        }
        
        console.log(number);