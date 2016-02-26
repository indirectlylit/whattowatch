<!-- © Devon Rueckner 2016 -->
<availablemovie class="{ hidden: !app.isAvailable(id) }">

  <thumbnail class="clickable"></thumbnail>
  <div class="info">
    <div>
      <div class="title">{ title }</div>
      <div>{ mpaa_rating }, { year }</div>
      <br>
      <div>{ critics_score } - Critics</div>
      <div>{ audience_score } - Audience</div>
    </div>
    <div class="buttons">
      <div class="clickable">✔</div>
      <div class="clickable">✖</div>
    </div>
  </div>


  <script></script>


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
