+++
# Main page
+++

<div id="page">
  <div id="main">
    <h2 id="title"><span>{{ title() }}</span></h2>
    <div id="content">
      <p>Here is a handy list of all my accounts and where you can find me!</p>
      <p>
        <b>Social</b>:<br>
        {{ link(name="VK", link="https://vk.com/paveloom") }}
        {{ link(name="Twitter", link="https://twitter.com/paveloom") }}
        {{ link(name="Tumblr", link="https://paveloom.tumblr.com") }}
        {{ link(name="YouTube", link="https://www.youtube.com/Paveloom") }}
        {{ link(name="Instagram", link="https://www.instagram.com/paveloom") }}
        {{ link(name="Facebook", link="https://www.facebook.com/paveloom.one") }}
      </p>
      <p>
        <b>Work</b>:<br>
        {{ link(name="GitHub", link="https://github.com/Paveloom") }}
        {{ link(name="Ask", link="https://ask.fm/paveloom") }}
        {{ link(name="Stihi", link="https://stihi.ru/avtor/paveloom") }}
        {{ link(name="Proza", link="https://proza.ru/avtor/paveloom") }}
      </p>
      <p>
        <b>Passions</b>:<br>
        {{ link(name="Last.fm", link="https://www.last.fm/user/Paveloom") }}
        {{ link(name="Discogs", link="https://www.discogs.com/user/Paveloom") }}
        {{ link(name="KinoPoisk", link="https://www.kinopoisk.ru/user/5714665") }}
        {{ link(name="IMDb", link="https://www.imdb.com/user/ur106601753") }}
        {{ link(name="MyAnimeList", link="https://myanimelist.net/profile/Paveloom") }}
        {{ link(name="Goodreads", link="https://www.goodreads.com/paveloom") }}
        {{ link(name="Papers", link="https://www.mendeley.com/community/PRPs/documents") }}
        {{ link(name="Steam", link="https://steamcommunity.com/id/paveloom") }}
        {{ link(name="RAWG", link="https://rawg.io/@paveloom") }}
        <b>
          See also:
          {{ link(name="LibGen Uploads", link="@/libgen.md", inline=true) }},
          {{ link(name="Flex", link="@/flex.md", inline=true) }}
        </b>
      </p>
      <p>
        <b>Contacts</b>:<br>
        {{ link(name="Telegram", link="https://t.me/paveloom") }}
        {{ link(name="E-mail", link="mailto:paveloom@mail.ru", text="paveloom@mail.ru") }}
        {{ link(name="Skype", link="skype:paveloom?chat", text="paveloom") }}
      </p>
      <p>Enjoy!</p>
    </div>
  </div>
  <div id="footer">
    <div id="footnote">
      <span>/</span>
      {{ link(name="Inspired by Freako. Sorry, by the way.", link="https://www.youtube.com/Freako", inline=true) }}
    </div>
  </div>
</div>
