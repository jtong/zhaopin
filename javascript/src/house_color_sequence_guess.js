function HouseColorSequenceGuessQuestion(html, shuffle){
    this.html = html;
    this.shuffle = shuffle;
    this.locals = {H1:"黑房子", H2:"绿房子", H3:"白房子", H4:"红房子"};
}

HouseColorSequenceGuessQuestion.prototype.render = function(){
    var fn = jade.compile(this.html);
    return fn(this.locals);
}

HouseColorSequenceGuessQuestion.prototype.answer = function(){
    return this.locals.H3+"黄房子"+this.locals.H4+this.locals.H2+this.locals.H1
}