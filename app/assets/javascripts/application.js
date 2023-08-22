//= require jquery
//= require jquery_ujs
//= require bootstrap

$(document).ready(() => {
  $(".category.image-upload").change(function () {
      const file = this.files[0];
      if (file) {
          let reader = new FileReader();
          reader.onload = function (event) {
              $(".preview-img-container #preview-image")
                .attr("src", event.target.result);
          };
          reader.readAsDataURL(file);
      }
  });
});