//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require select2
//= require_tree .

$(document).ready(() => {
	$(".js-example-basic-multiple").select2();

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