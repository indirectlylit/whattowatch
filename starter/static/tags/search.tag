<!-- © Devon Rueckner 2016 -->
<search>

  <input type="text" name="searchBox" placeholder="search…" onkeyup={ keyup }>
  <button title="Clear (esc)" onclick={ reset } class="clickable">✖</button>

  <script>
  reset() {
    this.searchBox.value = "";
    app.ctrl.setSearch("");
    this.searchBox.focus();
  }

  keyup(e) {
    if (e.keyCode == 27) {
      this.searchBox.value = "";
    }
    this.throttledSet(this.searchBox.value);
  }

  this.throttledSet = _.throttle(function(val) {
    app.ctrl.setSearch(val);
  }, 150);

  </script>


  <style scoped>
  :scope {
    display: flex;
  }

  input {
    width: 100%;
    margin-right: -10px;
  }

  button {
    padding-left: 1em;
    border: none;
    background: none;
    position: relative;
    right: 20px;
  }

  </style>

</search>
