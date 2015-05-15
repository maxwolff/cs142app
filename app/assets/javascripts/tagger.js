function Tagger(dragElement, feedbackDiv, form1, form2, form3, form4){
    this.xcord = document.getElementById(form1);
    this.ycord = document.getElementById(form2);
    this.deltax = document.getElementById(form3);
    this.deltay = document.getElementById(form4);
    this.feedbackDiv = document.getElementById(feedbackDiv);
    this.dragElement = document.getElementById(dragElement);
    this.feedbackDiv = document.getElementById(feedbackDiv);
    this.dragElement.style.position = "relative";
    this.feedbackDiv.style.position = "absolute";
    this.feedbackDiv.style.border = "1px solid blue";
    this.isMouseDown = false;
    var obj = this;

    this.dragElement.onmousedown = function(event) {
        
        event.preventDefault();
        obj.mouseDown(event);
    }
}

Tagger.prototype.mouseDown = function(event) {
    var obj = this;
    this.isMouseDown = true;
    this.X1 = event.pageX - this.dragElement.offsetLeft;
    this.Y1 = event.pageY - this.dragElement.offsetTop;
    document.body.onmousemove = function(event) {
        obj.mouseMove(event);
    }
    document.body.onmouseup = function(event) {
        obj.mouseUp(event);
    }
}

Tagger.prototype.mouseMove = function(event) {
    if (!this.isMouseDown) {
        return;
    }
    this.X2= event.pageX - this.dragElement.offsetLeft;
    this.Y2 = event.pageY - this.dragElement.offsetTop;

    var diffX = this.X2 - this.X1;
    var diffY = this.Y2 - this.Y1;

    this.feedbackDiv.style.left = this.X1 + "px";
    this.feedbackDiv.style.top = this.Y1 + "px";
    this.feedbackDiv.style.width = diffX + "px";
    this.feedbackDiv.style.height = diffY + "px";
    console.log(diffX, diffY);
}

Tagger.prototype.mouseUp = function(event) {
    this.isMouseDown = false;

    this.xcord.value = this.X1;
    this.ycord.value = this.Y1;
    this.deltax.value = this.X2 - this.X1;
    this.deltay.value = this.Y2 - this.Y1
}