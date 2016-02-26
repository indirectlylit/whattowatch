<!-- © Devon Rueckner 2016 -->
<ratings>

  <div>
    <label for="critics">Critics</label>
    <div class="range-group">
      <input type="range" id="critics" min="0" value="10" max="100" step="1">
      <div class="value">32</div>
    </div>
  </div>
  <div>
    <label for="audience">Audience</label>
    <div class="range-group">
      <input type="range" id="audience" min="0" value="10" max="100" step="1">
      <div class="value">32</div>
    </div>
  </div>

  <script></script>


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
    margin-left: 0.5em;
  }

  </style>

</ratings>
