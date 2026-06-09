---
layout: default
title: Home
---

<div class="home">

<div class="home-hero animate-in">
  <h1>Hey, I'm Marc</h1>
  <p class="home-intro">Software Engineer from Trinidad and Tobago, based in London. I build <a href="/projects">products</a>, <a href="/writings">write</a>, and make <a href="/films">short films</a>.</p>
</div>

<figure class="home-photo animate-in" style="--delay: 80ms;">
  <img src="{{ '/assets/index/home.png' | relative_url }}" alt="Lisbon, 2024">
  <span class="photo-caption">Lisbon, 2024</span>
</figure>

<div class="latest-grid">
  {% assign latest_project = site.projects | sort: "date" | last %}
  {% if latest_project %}
  <a href="{{ latest_project.url }}" class="latest-card animate-in" style="--delay: 160ms;">
    <div class="latest-card-top">
      <span class="latest-label">Latest Project</span>
      <span class="latest-arrow"><svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="7" y1="17" x2="17" y2="7"/><polyline points="7 7 17 7 17 17"/></svg></span>
    </div>
    <div>
      <p class="latest-title">{{ latest_project.title | truncate: 40 }}</p>
      {% if latest_project.date %}<p class="latest-date">{{ latest_project.date | date: "%b %Y" }}</p>{% endif %}
    </div>
  </a>
  {% else %}
  <div class="latest-card animate-in" style="--delay: 160ms;">
    <div class="latest-card-top">
      <span class="latest-label">Latest Project</span>
      <span class="latest-arrow"><svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="7" y1="17" x2="17" y2="7"/><polyline points="7 7 17 7 17 17"/></svg></span>
    </div>
    <div>
      <p class="latest-title">Coming soon</p>
    </div>
  </div>
  {% endif %}

  {% assign latest_post = site.categories.writings | first %}
  {% if latest_post %}
  <a href="{{ latest_post.url }}" class="latest-card animate-in" style="--delay: 240ms;">
    <div class="latest-card-top">
      <span class="latest-label">Latest Writing</span>
      <span class="latest-arrow"><svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="7" y1="17" x2="17" y2="7"/><polyline points="7 7 17 7 17 17"/></svg></span>
    </div>
    <div>
      <p class="latest-title">{{ latest_post.title | truncate: 40 }}</p>
      <p class="latest-date">{{ latest_post.date | date: "%b %Y" }}</p>
    </div>
  </a>
  {% else %}
  <div class="latest-card animate-in" style="--delay: 240ms;">
    <div class="latest-card-top">
      <span class="latest-label">Latest Writing</span>
      <span class="latest-arrow"><svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="7" y1="17" x2="17" y2="7"/><polyline points="7 7 17 7 17 17"/></svg></span>
    </div>
    <div>
      <p class="latest-title">Coming soon</p>
    </div>
  </div>
  {% endif %}

  {% assign yt = site.data.latest_film %}
  {% if yt.id %}
  <a href="{{ yt.url }}" target="_blank" rel="noopener noreferrer" class="latest-card animate-in" style="--delay: 320ms;">
    <div class="latest-card-top">
      <span class="latest-label">Latest Film</span>
      <span class="latest-arrow"><svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="7" y1="17" x2="17" y2="7"/><polyline points="7 7 17 7 17 17"/></svg></span>
    </div>
    <div>
      <p class="latest-title">{{ yt.title | truncate: 40 }}</p>
      {% if yt.published_at %}<p class="latest-date">{{ yt.published_at | date: "%b %Y" }}</p>{% endif %}
    </div>
  </a>
  {% else %}
  <a href="https://youtube.com/@marcbeep" target="_blank" rel="noopener noreferrer" class="latest-card animate-in" style="--delay: 320ms;">
    <div class="latest-card-top">
      <span class="latest-label">Latest Film</span>
      <span class="latest-arrow"><svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="7" y1="17" x2="17" y2="7"/><polyline points="7 7 17 7 17 17"/></svg></span>
    </div>
    <div>
      <p class="latest-title">YouTube</p>
    </div>
  </a>
  {% endif %}
</div>

<h2 class="section-label animate-in" style="--delay: 360ms;">Stuff I've done</h2>
<div class="timeline">
  <div class="timeline-row animate-in" style="--delay: 400ms;">
    <span class="timeline-date">2025</span>
    <p class="timeline-content">Platform Engineer at <a href="https://liveflow.com">LiveFlow</a></p>
  </div>
  <div class="timeline-row animate-in" style="--delay: 440ms;">
    <span class="timeline-date">2024</span>
    <p class="timeline-content">Software Engineer at <a href="https://ultamation.com">Ultamation</a> &middot; MSc Advanced Computer Science</p>
  </div>
  <div class="timeline-row animate-in" style="--delay: 480ms;">
    <span class="timeline-date">2024</span>
    <p class="timeline-content">Graduated BSc Computer Science, University of Liverpool</p>
  </div>
  <div class="timeline-row animate-in" style="--delay: 520ms;">
    <span class="timeline-date">2023</span>
    <p class="timeline-content">Software Engineering Intern at <a href="https://octopus.energy">Octopus Energy</a></p>
  </div>
  <div class="timeline-row animate-in" style="--delay: 560ms;">
    <span class="timeline-date">2023</span>
    <p class="timeline-content">Founded <a href="/wildroutes">Wildroutes</a> &middot; Won Design Your Future startup competition</p>
  </div>
  <div class="timeline-row animate-in" style="--delay: 600ms;">
    <span class="timeline-date">2021</span>
    <p class="timeline-content">Directed <a href="/goodbyeforever">Goodbye Forever</a> and <a href="/wrecked">Wrecked</a> (T&amp;T Film Festival selection)</p>
  </div>
  <div class="timeline-row animate-in" style="--delay: 640ms;">
    <span class="timeline-date">2020</span>
    <p class="timeline-content">National scholarship for Computer Science &middot; Duke of Edinburgh Gold</p>
  </div>
</div>

<h2 class="section-label animate-in" style="--delay: 680ms;">Folks I've worked with</h2>
<div class="recs animate-in" style="--delay: 720ms;">
  <div class="recs-track" id="recs-track">
    <div class="recs-slide">
      <div class="rec-card">
        <div class="rec-head">
          <div class="rec-person">
            <img class="rec-avatar" src="https://api.dicebear.com/9.x/notionists/svg?seed=Oliver%20Hall" alt="">
            <div>
              <p class="rec-name">Oliver Hall</p>
              <p class="rec-role">Managing Director &middot; Ultamation Ltd.</p>
            </div>
          </div>
          <a href="https://www.linkedin.com/in/oliverhall/" target="_blank" rel="noopener noreferrer" class="rec-linkedin" aria-label="Oliver Hall on LinkedIn"><svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="7" y1="17" x2="17" y2="7"/><polyline points="7 7 17 7 17 17"/></svg></a>
        </div>
        <p class="rec-quote"><span class="rec-quote-mark">&ldquo;</span>Marc demonstrated a keen ability to understand complex problems, develop technical strategies to address those challenges, and also align those strategies with the business needs. On top of that, he's also an incredibly personable guy which, on the one hand makes him a pleasure to work with, but on the other means he's a great communicator, able to share his technical knowledge and approach with the broader team.</p>
        <p class="rec-date">Jul 2025</p>
      </div>
    </div>
    <div class="recs-slide">
      <div class="rec-card">
        <div class="rec-head">
          <div class="rec-person">
            <img class="rec-avatar" src="https://api.dicebear.com/9.x/notionists/svg?seed=Jane%20Colesby" alt="">
            <div>
              <p class="rec-name">Jane Colesby</p>
              <p class="rec-role">Career Studio Lead &middot; University of Liverpool</p>
            </div>
          </div>
          <a href="https://www.linkedin.com/in/janecolesby/" target="_blank" rel="noopener noreferrer" class="rec-linkedin" aria-label="Jane Colesby on LinkedIn"><svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="7" y1="17" x2="17" y2="7"/><polyline points="7 7 17 7 17 17"/></svg></a>
        </div>
        <p class="rec-quote"><span class="rec-quote-mark">&ldquo;</span>His communication skills are excellent &mdash; he worked with students from so many different academic and cultural backgrounds and treated them all with empathy and respect. Marc is an excellent team player, willing to support his colleagues with sharing information and advice on his approaches. The wider team always expressed how impressed they were with Marc's contribution to their events, in public speaking and networking skills.</p>
        <p class="rec-date">Jul 2024</p>
      </div>
    </div>
    <div class="recs-slide">
      <div class="rec-card">
        <div class="rec-head">
          <div class="rec-person">
            <img class="rec-avatar" src="https://api.dicebear.com/9.x/notionists/svg?seed=Alistair%20Duncan" alt="">
            <div>
              <p class="rec-name">Alistair Duncan</p>
              <p class="rec-role">Lead Software Engineer &middot; KrakenFlex</p>
            </div>
          </div>
          <a href="https://www.linkedin.com/in/adunweb/" target="_blank" rel="noopener noreferrer" class="rec-linkedin" aria-label="Alistair Duncan on LinkedIn"><svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="7" y1="17" x2="17" y2="7"/><polyline points="7 7 17 7 17 17"/></svg></a>
        </div>
        <p class="rec-quote"><span class="rec-quote-mark">&ldquo;</span>Marc requires little direction to deliver front-end tasks. He breaks down requirements systematically, asks thoughtful questions and meets deadlines ahead of schedule. I was consistently impressed with Marc's solutions during code reviews and pairing sessions. In addition to his strong technical skills, Marc is simply a pleasure to work with. He has an outgoing, friendly personality and a great sense of humour that made him well-liked across the team.</p>
        <p class="rec-date">Aug 2023</p>
      </div>
    </div>
  </div>

  <div class="recs-controls">
    <button class="recs-btn" id="recs-prev" aria-label="Previous recommendation"><svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="15 18 9 12 15 6"/></svg></button>
    <div class="recs-dots" id="recs-dots"></div>
    <button class="recs-btn" id="recs-next" aria-label="Next recommendation"><svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 18 15 12 9 6"/></svg></button>
  </div>
</div>

</div>

<script src="{{ '/assets/js/home.js' | relative_url }}"></script>
