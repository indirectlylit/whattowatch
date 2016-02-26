<!-- © Devon Rueckner 2016 -->
<search>

  <input type="text" name="searchBox" placeholder="title, actors, year…" onkeyup={ keyup }>
  <button title="Clear (esc)" onclick={ reset } class="clickable">✖</button>

  <script>

    reset() {
      this.searchBox.value = "";
      this.searchBox.focus();
    }

    keyup(e) {
      switch(e.keyCode) {
        case 13: // 'enter' handled by 'onsubmit' event
          return;
        case 27: // 'esc'
          this.searchBox.value = "";
          return;
      }
    }

  </script>


  <style scoped>

    :scope {
      display: flex;
    }

    input {
      width: 100%;
    }

    button {
      padding-left: 1em;
      border: none;
      background: none;
    }

  </style>

</search>