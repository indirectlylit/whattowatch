<!-- © Devon Rueckner 2016 -->
<ratings>

  <div>
    <label for="critics">Critics</label>
    <div class="range-group">
      <input type="range" name="critics" min="0" max="100" step="1" value="{ app.critics_min }" oninput={ updateCritMin }>
      <div class="value">{ app.critics_min }</div>
    </div>
  </div>
  <div>
    <label for="audience">Audience</label>
    <div class="range-group">
      <input type="range" name="audience" min="0" max="100" step="1" value="{ app.audience_min }" oninput={ updateAudMin }>
      <div class="value">{ app.audience_min }</div>
    </div>
  </div>

  <script>

  updateCritMin() {
    app.ctrl.setCritMin(this.critics.value);
  }

  updateAudMin() {
    app.ctrl.setAudMin(this.audience.value);
  }


  </script>


  <style scoped>
  :scope {
    display: block;
  }

  .range-group {
    display: flex;
  }

  input {
    width: 100%;
  }

  .value {
    display: inline-block;
    margin-left: 1em;
    width: 3em;
  }

  </style>

</ratings>
