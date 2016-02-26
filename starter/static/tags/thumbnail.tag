<!-- © Devon Rueckner 2016 -->
<thumbnail>
  <div style="
    background: url(/static/thumb_sprites/sprite-{ app.sprites.thumb_indices[this.id][0] }.jpg);
    display: inline-block;
    width: { size(0) }px;
    height: { size(1) }px;
    background-position: -{ this.xPos() }px -{ this.yPos() }px;
    background-size: { 100 * app.sprites.sheet_size }% { 100 * app.sprites.sheet_size }%;
  "></div>

  <script>

  // retina
  size(i) {
    return app.sprites.thumb_size[i] / 2;
  }

  xPos() {
    return app.sprites.thumb_indices[this.id][2] * this.size(0);
  }

  yPos() {
    return app.sprites.thumb_indices[this.id][1] * this.size(1);
  }

  </script>


  <style scoped>
  :scope {
    display: block;
  }

  </style>

</thumbnail>
