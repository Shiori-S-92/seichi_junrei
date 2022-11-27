// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application"
import '@fortawesome/fontawesome-free/js/all'

Rails.start()
Turbolinks.start()
ActiveStorage.start()
window.$ = window.jQuery = require('jquery');
/* global $ */

// # ↓↓↓ 無限スクロール ↓↓↓
/*
$(document).on('turbolinks:load', function() {
  $('.jscroll-div').jscroll({ // 追加したdivのclass名と合わせる
    contentSelector: '.jscroll',
    nextSelector: '.next a',  // 次ページリンクのセレクタ
    loadingHtml: '読み込み中',
    padding: 10
  });
});
*/

import "packs/swiper";
// # ↓↓↓ swiper
//= require swiper/swiper-bundle.js
//= require swiper.js

// # 上段は、node_modules/swiper/以下のファイルを読み込む（node_modulesは省略できる）
// # 下段は、assets/javascript/application.jsと同一ディレクトリに存在するswiper.jsを読み込む