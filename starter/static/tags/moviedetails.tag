<!-- © Devon Rueckner 2016 -->
<moviedetails>

  <div class="overlay" onkeyup="{ keyup }">
    <div class="close clickable" onclick="{ close }">
      ✖
    </div>
    <div class="content">
      <div><img src="/static/posters/{ app.selected }.jpg"></div>
      <div class="details">
        <h2>{ app.movie_map[app.selected].title }</h2>
        <ul>
          <li>Rated: { app.movie_map[app.selected].mpaa_rating }</li>
          <li>Year: { app.movie_map[app.selected].year }</li>
          <li if={ app.movie_map[app.selected].details && app.movie_map[app.selected].details.actors }>
            Actors:  { app.movie_map[app.selected].details.actors.join(', ') }
          </li>
          <li if={ app.movie_map[app.selected].details }>
            Runtime: { app.movie_map[app.selected].details.runtime } min
          </li>
          <li>{ app.movie_map[app.selected].critics_score } from the critics</li>
          <li>{ app.movie_map[app.selected].audience_score } from the audience</li>
          <li if={ app.movie_map[app.selected].details }>
            Links:
            <span if="{ app.movie_map[app.selected].details.imdb_id }"><a target="_blank" href="http://www.imdb.com/title/tt{ app.movie_map[app.selected].details.imdb_id }/">IMDB</a>,</span>
            <a target="_blank" href="{ app.movie_map[app.selected].details.rt_link }">Rotten Tomatoes</a>
          </li>
        </ul>
        <div if={ app.movie_map[app.selected].details }>
          { app.movie_map[app.selected].details.synopsis }
        </div>
      </div>
    </div>

    <script>
    close() {
      app.ctrl.select(null);
    }

    // Can't seem to get keyboard events from just this div
    // so put the handler on the window as workaround.
    window.onkeyup = function(e) {
      // enter or escape
      if (e.keyCode == 13 || e.keyCode == 27) {
        app.ctrl.select(null);
      }
    };


    </script>


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
      top: 10vh;
      position: relative;
      padding: 20px;
      display: flex;
      max-height: 80vh;
    }

    img {
      height: 60vh;
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
