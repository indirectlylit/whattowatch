<!-- © Devon Rueckner 2016 -->
<shelvedmovie class="{ hidden: !app.isShelved(id) }">

  <div class="info clickable" onclick="{ select }">
    <div>
      <div class="title">{ title }</div>
      <div>{ mpaa_rating }, { year }</div>
    </div>
  </div>
  <div class="removeBtn clickable" onclick="{ unshelve }">
    ✖
  </div>

  <script>
  unshelve() {
    app.ctrl.unshelve(this.id);
  }

  select() {
    app.ctrl.select(this.id);
  }

  </script>


  <style scoped>
  :scope {
    display: flex;
    justify-content: space-between;
  }

  .info {
    margin-right: 10px;
    margin-bottom: 5px;
  }

  .removeBtn {
    padding-right: 10px;
    padding-left: 5px;
    margin-bottom: 5px;
  }

  </style>

</shelvedmovie>
