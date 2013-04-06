function WhenToCleanFormQuestion(html, shuffle){
    this.html = html;
    this.shuffle = shuffle;
    this.locals ={}
}

WhenToCleanFormQuestion.prototype = new QuestionBase();

//common interface
WhenToCleanFormQuestion.new_question = function(html){
    return new WhenToCleanFormQuestion(html, function(array){
        array.sort(function(){return (Math.round(Math.random())-0.5);})
    })
}

var new_question = WhenToCleanFormQuestion.new_question;



WhenToCleanFormQuestion.prototype._answer = function(){
    return "点创建活动按钮 或 点创建按钮时";
}

