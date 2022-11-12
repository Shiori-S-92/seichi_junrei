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

<script>
  $(document).on('turbolinks:load', function() {
    $('.jscroll-div').jscroll({ // 追加したdivのclass名と合わせる
      contentSelector: '.jscroll',
      nextSelector: '.next a',  // 次ページリンクのセレクタ
      loadingHtml: '読み込み中',
      padding: 10
    });
  });
</script>

Rails.start()
Turbolinks.start()
ActiveStorage.start()
