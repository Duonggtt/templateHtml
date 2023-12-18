(function($) {

	"use strict";

	var fullHeight = function() {

		$('.js-fullheight').css('height', $(window).height());
		$(window).resize(function(){
			$('.js-fullheight').css('height', $(window).height());
		});

	};
	fullHeight();

	$('#sidebarCollapse').on('click', function () {
      $('#sidebar').toggleClass('active');
  });

})(jQuery);



$(document).ready(function() {
    // Handle click on navbar links
    $(".navbar a").click(function() {
        $(".navbar a").removeClass("active");
        $(this).addClass("active");
    });

    // Handle scroll to change navbar color and highlight section
    $(window).scroll(function() {
        var scrollPosition = $(this).scrollTop();

        $(".section").each(function() {
            var target = $(this);
            var sectionTop = target.offset().top - 50;
            var sectionBottom = sectionTop + target.outerHeight();

            // Check if the scroll position is within the section
            if (scrollPosition >= sectionTop && scrollPosition < sectionBottom) {
                $(".navbar a").removeClass("active");
                $(".navbar a[href='#" + target.attr('id') + "']").addClass("active");
            }
        });
    });
});
