<!-- © Devon Rueckner 2016 -->
<main>

  <div class="wrapper">

    <h1>What to Watch?</h1>

    <div class="main">

      <div class="saved">
        <h2>Saved</h2>
        <pinned></pinned>
      </div>

      <div class="available">
        <h2>Available</h2>
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


  </div>
  <moviedetails class="hidden"></moviedetails>

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
    margin-right: 40px;
    display: flex;
    flex-direction: column;
    width: 300px;
  }

  .available {
    flex-grow: 3;
  }

  .saved {
    flex-grow: 0;
  }

  @media screen and (max-width: 800px) {
    .main {
      flex-direction: column-reverse;
    }
  }

  </style>

</main>
