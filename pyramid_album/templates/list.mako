# -*- coding: utf-8 -*- 
<%inherit file="layout.mako"/>

<div class="w3-container w3-teal">
  <h1>Pyramid Album</h1>
</div>

<%doc>
  cerner_2^5_2020
</%doc>

<div class="w3-row-padding w3-margin-top">
  % for pyramid in pyramids:
  <div class="w3-third">
    <div class="w3-card">
      <img src="${pyramid['image']}" class="w3-hover-grayscale" style="width:100%">
      <div class="w3-container">
        <h5>${pyramid['name']}</h5>
      </div>
    </div>
  </div>
  % endfor
</div>