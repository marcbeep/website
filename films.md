---
layout: default
permalink: films
title: Films
description: A collection of Marc Beepath's films.
---

<div class="films">

<h1 class="animate-in">Films</h1>
<p class="films-intro animate-in" style="--delay: 60ms;">Making films is a massive hobby of mine. More on <a href="https://youtube.com/@marcbeep" target="_blank" rel="noopener noreferrer">YouTube</a>.</p>

{% assign yt = site.data.latest_film %}
{% if yt.id %}
<section class="film-latest animate-in" style="--delay: 120ms;">
  <div class="film-latest-head">
    <h2 class="films-label">Latest Film</h2>
    <span class="film-latest-sep" aria-hidden="true">·</span>
    <a href="{{ yt.url }}" class="film-latest-title" target="_blank" rel="noopener noreferrer">{{ yt.title }}</a>
  </div>
  <div class="film-latest-embed{% if yt.vertical %} is-vertical{% endif %}">
    <iframe src="https://www.youtube-nocookie.com/embed/{{ yt.id }}?rel=0&modestbranding=1" title="{{ yt.title }}" allow="accelerometer; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
  </div>
</section>
{% endif %}

<h2 class="films-label animate-in" style="--delay: 180ms;">Notable Films</h2>
<div class="projects">
  <div class="projects-list">
  {% assign sorted_films = site.films | sort: "date" | reverse %}
  {% for film in sorted_films %}
    <a href="{{ film.url }}" class="project-row animate-in" style="--delay: {{ forloop.index0 | times: 60 | plus: 220 }}ms;">
      <div class="project-row-main">
        <div class="project-row-head">
          <span class="project-emoji">{{ film.emoji | default: "🎬" }}</span>
          <span class="project-name">{{ film.title }}</span>
        </div>
        {% if film.description %}<p class="project-excerpt">{{ film.description }}</p>{% endif %}
      </div>
      <div class="project-row-meta">
        {% if film.date %}<span class="project-year">{{ film.date | date: "%Y" }}</span>{% endif %}
        <span class="project-arrow"><svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="7" y1="17" x2="17" y2="7"/><polyline points="7 7 17 7 17 17"/></svg></span>
      </div>
    </a>
  {% endfor %}
  </div>
</div>

</div>
