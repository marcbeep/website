---
layout: default
permalink: writings
title: Writings
description: A collection of Marc Beepath's writings, thoughts, and insights on software engineering, technology, and personal experiences.
---

<div class="writings">

<h1 class="animate-in">Writings</h1>
<div class="writings-intro animate-in" style="--delay: 60ms;">
  <p>These notes are the most honest version of myself I can provide. They are a snapshot into whatever I’m thinking most about at the minute. But beware, my opinions change frequently.</p>
  <p>You should interpret these as me speaking to myself.</p>
</div>

{% assign posts_by_year = site.categories.writings | group_by_exp: "post", "post.date | date: '%Y'" | sort: "name" | reverse %}
{% for year in posts_by_year %}
  <div class="writings-year-group animate-in" style="--delay: {{ forloop.index0 | times: 60 | plus: 120 }}ms;">
    <h2 class="writings-year">{{ year.name }}</h2>
    {% for post in year.items %}
      <a href="{{ post.url }}" class="writing-row">
        <span class="writing-row-title">{{ post.title }}</span>
        <span class="writing-row-date">{{ post.date | date: "%b %-d" }}</span>
      </a>
    {% endfor %}
  </div>
{% endfor %}

</div>
