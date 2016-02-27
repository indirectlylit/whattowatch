<!-- © Devon Rueckner 2016 -->
<availablemovie class="{ hidden: !app.isAvailable(id) }">

  <thumbnail class="clickable" onclick="{ select }"></thumbnail>
  <div class="info">
    <div class="clickable" onclick="{ select }">
      <div class="title">{ title }</div>
      <div>{ mpaa_rating }, { year }</div>
    </div>
    <br>
    <div>
      <div>{ critics_score } - Critics</div>
      <div>{ audience_score } - Audience</div>
    </div>

    <div class="buttons">
      <div class="clickable" onclick="{ nope }">✖</div>
      <div class="clickable" onclick="{ yep }">✔</div>
    </div>
  </div>


  <script>
  yep() {
    app.ctrl.save(this.id);
  }

  nope() {
    app.ctrl.shelve(this.id);
  }

  select() {
    app.ctrl.select(this.id);
  }

  </script>


  <style scoped>
  :scope {
    display: flex;
    margin-bottom: 10px;
  }

  .title {
    font-weight: bold;
  }

  .info {
    margin-left: 10px;
  }

  </style>

</availablemovie>
