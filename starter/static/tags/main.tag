<!-- © Devon Rueckner 2016 -->
<main>

  <div class="wrapper">

    <h1>What to Watch?</h1>

    <div class="main">

      <div class="col saved { hidden: !app.saved.length }">
        <h2>Yup <span class="count">({ app.saved.length })</span></h2>
        <saved></saved>
      </div>

      <div class="col available">
        <h2>Maybe <span class="count">({ app.available.length })</span></h2>
        <available></available>
      </div>

      <div class="col filter">
        <h2>Nope <span class="count">({ app.movies.length - app.available.length - app.saved.length })</h2>
        <search></search>
        <chart></chart>
        <h3>Minimum Scores</h3>
        <ratings></ratings>
        <h3 class="{ hidden: !app.shelved.length }">Shelved</span></h3>
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
    width: 800px;
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

  @media screen and (max-width: 800px) {
    .main {
      flex-direction: column-reverse;
    }
  }

  </style>

</main>
