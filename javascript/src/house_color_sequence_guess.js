function HouseColorSequenceGuessQuestion(html, shuffle){
    this.html = html;
    this.shuffle = shuffle;
    this.locals = {H1:"黑房子", H2:"绿房子", H3:"白房子", H4:"红房子"};
}


//common interface
var new_question = HouseColorSequenceGuessQuestion.new_question;

HouseColorSequenceGuessQuestion.new_question = function(html){
    return new HouseColorSequenceGuessQuestion(html, function(array){
        array.sort(function(){return (Math.round(Math.random())-0.5);})
    })
}
//extends
HouseColorSequenceGuessQuestion.prototype = new QuestionBase();

//public

//private
HouseColorSequenceGuessQuestion.prototype._answer = function(){
    return this.locals.H3+"黄房子"+this.locals.H4+this.locals.H2+this.locals.H1
}