<!-- © Devon Rueckner 2016 -->
<main>

  <div class="wrapper">
    <div class="main">
      <h1>What to Watch?</h1>
      <h3>Saved</h3>
      <pinned></pinned>
      <h3>Available</h3>
      <available></available>
    </div>
    <div class="filter">
      <h2>Filter</h2>
      <search></search>
      <h3>Minimum Scores</h3>
      <ratings></ratings>
      <h3>Shelved</h3>
      <shelved></shelved>
    </div>
  </div>
  <moviedetails class="hidden"></moviedetails>

  <script></script>


  <style scoped>
  :scope {
  }

  .wrapper {
    display: flex;
    flex-direction: row-reverse;
  }

  .filter {
    margin-right: 40px;
    display: flex;
    flex-direction: column;
    flex-grow: 1;
    max-width: 500px;
  }

  .main {
    flex-grow: 3;
  }

  shelved {
    display: block;
    flex-grow: 1;
    overflow: auto;
  }

  </style>

</main>
