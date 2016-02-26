<!-- © Devon Rueckner 2016 -->
<moviedetails>

  <div class="overlay">
    <div class="close clickable">
      ✖
    </div>
    <div class="content">
      <div><img src="/static/posters/{ app.selected }.jpg"></div>
      <div class="details">
        <h2>{ app.movie_map[app.selected].title }</h2>
        <div>
          { app.movie_map[app.selected].mpaa_rating },
          { app.movie_map[app.selected].year }
        </div>
        <br>
        <div>
          <span class="score">
            { app.movie_map[app.selected].critics_score }
          </span>
          from the critics
        </div>
        <div>
          <span class="score">
            { app.movie_map[app.selected].audience_score }
          </span>
          from the audience
        </div>
        <div if={ app.movie_map[app.selected].details }>
          <p>
            Links:
            <a target="_blank" href="{ app.movie_map[app.selected].details.imdb_link} ">IMDB</a>
            <a target="_blank" href="{ app.movie_map[app.selected].details.rt_link} ">Rotten Tomatoes</a>
          </p>
          <br>
          <p>
            { app.movie_map[app.selected].details.synopsis }
          </p>
        </div>
      </div>
    </div>

    <script></script>


    <style scoped>
    :scope {}

    .overlay {
      position: fixed;
      top: 0;
      left: 0;
      height: 100%;
      width: 100%;
      z-index: 10;
      background-color: rgba(0, 0, 0, 0.75);
    }

    .content {
      background-color: #4C4C4C;
      width: 80%;
      margin: auto;
      top: 10vw;
      position: relative;
      padding: 20px;
      display: flex;
      max-height: 80vh;
    }

    img {
      width: 35vw;
    }

    .close {
      position: fixed;
      right: 10px;
      top: 10px;
      margin: 10px;
      font-size: x-large;
    }

    .details {
      margin-left: 20px;
      overflow-y: auto;
      overflow-x: hidden;
    }

    </style>

</moviedetails>
