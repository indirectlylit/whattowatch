<!-- © Devon Rueckner 2016 -->
<main>

  <div class="wrapper">

    <h1>What to Watch?</h1>

    <div class="main">

      <div class="col saved">
        <h2>Saved</h2>
        <pinned></pinned>
      </div>

      <div class="col available">
        <h2>Available</h2>
        <available></available>
      </div>

      <div class="col filter">
        <h2>Filter</h2>
        <search></search>
        <h3>Minimum Scores</h3>
        <ratings></ratings>
        <h3>Shelved</h3>
        <shelved></shelved>
      </div>

    </div>

  </div>
  <!-- hack - see https://github.com/riot/riot/issues/1020#issuecomment-156388012 -->
  <moviedetails each={app.selected ? [1]: []}></moviedetails>

  <script></script>


  <style scoped>
  :scope {}

  .wrapper {
    margin: auto;
    max-width: 1000px;
  }

  .main {
    display: flex;
    flex-direction: row-reverse;
  }

  .filter {
    display: flex;
    flex-direction: column;
    width: 250px;
  }

  .available {
    flex-grow: 3;
  }

  .saved {
    flex-grow: 0;
  }

  .col {
    margin-left: 30px;
    margin-right: 10px;
  }

  .col > h2,
  .col > h3 {
    margin-left: -10px;
  }

  @media screen and (max-width: 800px) {
    .main {
      flex-direction: column-reverse;
    }
  }

  </style>

</main>
