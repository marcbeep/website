---
title: Projects
layout: default
permalink: projects
description: A collection of Marc Beepath's projects.
---

<div class="projects">

<h1 class="animate-in">Projects</h1>
<p class="projects-intro animate-in" style="--delay: 60ms;">Things I've built and explored.</p>

<div class="projects-list">
{% assign sorted_projects = site.projects | sort: "date" | reverse %}
{% for project in sorted_projects %}
  <a href="{{ project.url }}" class="project-row animate-in" style="--delay: {{ forloop.index0 | times: 60 | plus: 120 }}ms;">
    <div class="project-row-main">
      <div class="project-row-head">
        {% if project.emoji %}<span class="project-emoji">{{ project.emoji }}</span>{% endif %}
        <span class="project-name">{{ project.title }}</span>
      </div>
      {% if project.description %}<p class="project-excerpt">{{ project.description }}</p>{% endif %}
      {% if project.tech_stack %}<div class="project-tags">{% for tech in project.tech_stack %}<span class="project-tag">{{ tech }}</span>{% endfor %}</div>{% endif %}
    </div>
    <div class="project-row-meta">
      {% if project.date %}<span class="project-year">{{ project.date | date: "%Y" }}</span>{% endif %}
      <span class="project-arrow"><svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="7" y1="17" x2="17" y2="7"/><polyline points="7 7 17 7 17 17"/></svg></span>
    </div>
  </a>
{% endfor %}
</div>

</div>
