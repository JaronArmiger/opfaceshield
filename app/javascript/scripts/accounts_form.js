
$(document).ready( function() {
  const otherDiv = $("#other-div");
  otherDiv.hide();
  $("#account_institution_type").change( function() {
  	const selected = $(this).val();
  	if (selected === "Other") {
 	  otherDiv.show();
  	}
  });
});
