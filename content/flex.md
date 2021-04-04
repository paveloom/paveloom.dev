+++
# Flex
description = "This page contains an overview to @paveloom's media collection called Flex."
template = "pages.html"
title = "Flex"
[extra]
css = "flex.css"
+++

<div id="page">
  <div id="main">
    <div id="intro">
      <p>
        It is a collection of movies and TV series encrypted with
        {{ link(name="Rclone", link="https://rclone.org/", inline=true) }} and stored on
        {{ link(name="Google Drive", link="https://drive.google.com/drive/folders/1HIa7kt2RWpxU2cosdmNks1amEp2B75LO?usp=sharing", inline=true) }}.
      </p>
      <p>
        You can access it using the following <i>obfuscated</i> passwords:<br>
        <code>
          password = <i>yF2mm69Xht-wHw2Qm3S9vNyHBdogN8u8pqkeoLZlFMdLcyr3Epc</i><br>
          password2 = <i>8DoifxzXGh35jTUBoJq1dobyiomPFLyORzf7eVeMmBg89PyziCs</i><br>
        </code>
      </p>
    </div>
    <h2 class="header"><span>Movies</span></h2>
    <div class="content">
      <div class="card">
        <b>A</b><br>
        <ul>
          <li>Alien Resurrection</li>
        </ul>
      </div>
      <div class="card">
        <b>B</b><br>
        <ul>
          {{
            popup(
              name="Back to the Future",
              items=[
                "Back to the Future",
                "Back to the Future Part II",
                "Back to the Future Part III"
              ]
            )
          }}
          <li>Barnyard</li>
          <li>Beetlejuice</li>
          <li>Bruce Almighty</li>
        </ul>
      </div>
      <div class="card">
        <b>C</b><br>
        <ul>
          <li>Chungking Express</li>
        </ul>
      </div>
      <div class="card">
        <b>G</b><br>
        <ul>
          <li>Ghostbusters (1984)</li>
          <li>Girl, Interrupted</li>
        </ul>
      </div>
      <div class="card">
        <b>H</b><br>
        <ul>
          {{
            popup(
              name="Harry Potter",
              items=[
                "Harry Potter and the Philosopher's Stone",
                "Harry Potter and the Chamber of Secrets",
                "Harry Potter and the Prisoner of Azkaban",
                "Harry Potter and the Goblet of Fire",
                "Harry Potter and the Order of the Phoenix",
                "Harry Potter and the Half-Blood Prince",
                "Harry Potter and the Deathly Hallows — Part I",
                "Harry Potter and the Deathly Hallows — Part II"
              ]
            )
          }}
          <li>How the Grinch Stole Christmas! (1966)</li>
        </ul>
      </div>
      <div class="card">
        <b>J</b><br>
        <ul>
          {{
            popup(
              name="Jumanji",
              items=[
                "Jumanji: Welcome to the Jungle",
                "Jumanji: The Next Level"
              ]
            )
          }}
        </ul>
      </div>
      <div class="card">
        <b>M</b><br>
        <ul>
          <li>Moana</li>
        </ul>
      </div>
      <div class="card">
        <b>P</b><br>
        <ul>
          {{
            popup(
              name="Predator",
              items=[
                "Predator (1987)",
                "Predator 2"
              ]
            )
          }}
          <li>Princess Mononoke</li>
        </ul>
      </div>
      <div class="card">
        <b>S</b><br>
        <ul>
          <li>Spirited Away</li>
        </ul>
      </div>
      <div class="card">
        <b>T</b><br>
        <ul>
          <li>The Abyss</li>
          <li>The Christmas Chronicles</li>
          <li>The Fifth Element</li>
          {{
            popup(
              name="Twin Peaks: Fire Walk with Me",
              items=[
                "Complete Version (Fanedit by Папа Джонсон)",
                "Teresa Banks and the Last Seven Days of Laura Palmer (Fanedit by Q2)"
              ]
            )
          }}
        </ul>
      </div>
      <div class="card">
        <b>Y</b><br>
        <ul>
          <li>Yes Man</li>
        </ul>
      </div>
    </div>
    <h2 class="header"><span>Series</span></h2>
    <div class="content">
      <div class="card">
        <b>A</b><br>
        <ul>
          {{
            popup(
              name="Avatar: The Last Airbender",
              items=[
                'This is a <a href="https://www.reddit.com/r/RemasteringATLA/comments/5hr9w2/atla_remastered_in_1080p" rel="nofollow noopener">fan-made remaster</a>.'
              ]
            )
          }}
        </ul>
      </div>
      <div class="card">
        <b>B</b><br>
        <ul>
          <li>Big Time Rush</li>
        </ul>
      </div>
      <div class="card">
        <b>H</b><br>
        <ul>
          {{
            popup(
              name="Hellsing Ultimate",
              items=["Without <i>Hellsing: The Dawn</i>"]
            )
          }}
        </ul>
      </div>
      <div class="card">
        <b>I</b><br>
        <ul>
          <li>iCarly</li>
        </ul>
      </div>
      <div class="card">
        <b>R</b><br>
        <ul>
          {{
            popup(
              name="Rick and Morty",
              items=["Season 4"]
            )
          }}
        </ul>
      </div>
      <div class="card">
        <b>S</b><br>
        <ul>
          <li>Serial Experiments Lain</li>
          {{
            popup(
              name="Sherlock",
              items=["Seasons 1-3"]
            )
          }}
        </ul>
      </div>
      <div class="card">
        <b>T</b><br>
        <ul>
          {{
            popup(
              name="The Simpsons",
              items=["Season 1"]
            )
          }}
          {{
            popup(
              name="Twin Peaks",
              items=["Seasons 1-2"]
            )
          }}
          {{
            popup(
              name="Teenage Mutant Ninja Turtles (2003)",
              items=["Seasons 1-3"]
            )
          }}
        </ul>
      </div>
    </div>
    <div id="footer">
      <a href="https://paveloom.github.io/" id="back-link">←&nbsp;Back</a>
    </div>
  </div>
</div>
