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


// // ↓↓↓ 住所自動入力 ↓↓↓

// //= require jquery
// //= require jquery_ujs
// //= require activestorage
// //= require turbolinks
// //= require jquery.jpostal
// //= require_tree .

// $(function() {
//   $(document).on('turbolinks:load', () => {
//     $('#post_postal_code').jpostal({
//       postcode : [
//         '#post_postal_code'
//       ],
//       address: {
//         "#post_prefecture_code": "%3", // # 都道府県が入力される
//         "#post_city"           : "%4%5", // # 市区町村と町域が入力される
//         "#post_street"         : "%6%7" // # 大口事務所の番地と名称が入力される
//       }
//     });
//   });
// });


// // # 入力項目フォーマット
// // #   %3  都道府県
// // #   %4  市区町村
// // #   %5  町域
// // #   %6  大口事業所の番地 ex)100-6080
// // #   %7  大口事業所の名称
