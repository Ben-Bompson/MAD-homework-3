class MatchCard{
  String face = '';
  bool faceUp = false;

  MatchCard(String str){
    this.face = str;
  }

  bool isFaceUp() {
    return faceUp;
  }

  void flip(){
    if (isFaceUp()) {
      faceUp = false;
    }
    else {
      faceUp = true;
    }
  }

  String getFace() {
    return face;
  }

  void setFace(String str) {
    this.face = str;
  }
}