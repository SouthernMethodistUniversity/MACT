// class to encapsulate style features
// fill, stroke, strokeWeight

class Style {

    fillCol = 0;
    strokeCol = 0;
    strokeWt = 0;

    isFillOn = true;
    isStrokeOn = true;

    constructor(fillCol, strokeCol, strokeWt) {
        this.fillCol = fillCol;
        this.strokeCol = strokeCol;
        this.strokeWt = strokeWt;
    }


    setFillState(isFillOn) {
        this.isFillOn = isFillOn;
    }

    setStrokeState(isStrokeOn) {
        this.isStrokeOn = isStrokeOn;
    }

    getFillState() {
        return this.isFillOn;
    }

    getStrokeState() {
        return this.isStrokeOn;
    }
}