<!-- © Devon Rueckner 2016 -->
<main>

  <div class="main">
    <h1>What to Watch?</h1>
    <pinned></pinned>
    <grid></grid>
  </div>
  <div class="filter">
    <h2>Filter</h2>
    <search></search>
    <h3>Minimum Scores</h3>
    <ratings></ratings>
    <h3>Shelved</h3>
    <shelved></shelved>
  </div>

  <script></script>


  <style scoped>
  :scope {
    display: flex;
    flex-direction: row-reverse;
  }

  .filter {
    width: 35%;
    margin-right: 40px;
    display: flex;
    flex-direction: column;
  }

  .main {
    flex-grow: 1;
  }

  shelved {
    display: block;
    flex-grow: 1;
    overflow: auto;
  }

  </style>

</main>
