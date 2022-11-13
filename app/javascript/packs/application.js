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

// ↓↓↓ 無限スクロール ↓↓↓
$(document).on('turbolinks:load', function() {
  $('.jscroll-div').jscroll({ // 追加したdivのclass名と合わせる
    contentSelector: '.jscroll',
    nextSelector: '.next a',  // 次ページリンクのセレクタ
    loadingHtml: '読み込み中',
    padding: 10
  });
});



// ↓↓↓ 複数画像のスライド ↓↓↓

// $(function() {
//   $('.images').slick({
//       dots: true,
//   });
// });

//上部画像の設定
$('.gallery').slick({
  infinite: true, //スライドをループさせるかどうか。初期値はtrue。
  fade: true, //フェードの有効化
  arrows: true,//左右の矢印あり
  prevArrow: '<div class="slick-prev"></div>',//矢印部分PreviewのHTMLを変更
  nextArrow: '<div class="slick-next"></div>',//矢印部分NextのHTMLを変更
});

//選択画像の設定
$('.choice-btn').slick({
  infinite: true, //スライドをループさせるかどうか。初期値はtrue。
  slidesToShow: 8, //表示させるスライドの数
  focusOnSelect: true, //フォーカスの有効化
  asNavFor: '.gallery', //連動させるスライドショーのクラス名
});

//下の選択画像をスライドさせずに連動して変更させる設定。
$('.gallery').on('beforeChange', function(event, slick, currentSlide, nextSlide) {
  var index = nextSlide; //次のスライド番号
  //サムネイルのslick-currentを削除し次のスライド要素にslick-currentを追加
  $(".choice-btn .slick-slide").removeClass("slick-current").eq(index).addClass("slick-current");
});

