<!-- © Devon Rueckner 2016 -->
<savedmovie class="{ hidden: !app.isSaved(id) }">

  <div class="info clickable" onclick="{ select }">
    <thumbnail></thumbnail>
  </div>
  <div class="removeBtn clickable" onclick="{ unsave }">
    ✖
  </div>


  <script>
  unsave() {
    app.ctrl.unsave(this.id);
  }

  select() {
    app.ctrl.select(this.id);
  }

  </script>


  <style scoped>
  :scope {
    display: flex;
    margin-right: 10px;
    margin-bottom: 10px;
  }

  .info {}

  .clickable {
    margin-left: 5px;
    margin-right: 5px;
  }

  </style>

</savedmovie>
