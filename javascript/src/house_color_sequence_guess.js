function HouseColorSequenceGuessQuestion(template_id, shuffle){
    this.template_id = template_id;
    this.shuffle = shuffle;
    this.locals = {H1:"黑房子", H2:"绿房子", H3:"白房子", H4:"红房子"};
}

HouseColorSequenceGuessQuestion.prototype.render = function(){
    var html = document.getElementById(this.template_id).innerHTML;
    var fn = jade.compile(html);
    return fn(this.locals);
}

HouseColorSequenceGuessQuestion.prototype.answer = function(){
    return this.locals.H3+"黄房子"+this.locals.H4+this.locals.H2+this.locals.H1
}