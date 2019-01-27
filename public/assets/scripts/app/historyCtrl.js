app.controller('historyCtrl', function($scope, $rootScope, $routeParams, $location, $http, Data, $route) {
	$( ".start" ).datepicker(
    		{ 
    			dateFormat: "dd/mm/yy",
    			
            	defaultDate: "01/04/2018"
            }
    	);
    $( ".start" ).datepicker().datepicker("setDate", new Date());
	$scope.submit = function(){
		var data= {};
		data.date=$('.start').val();
		data.id = localStorage.getItem('user') ? JSON.parse(localStorage.getItem('user')).id : '';
		data.apikey = localStorage.getItem('user') ? JSON.parse(localStorage.getItem('user')).apikey : '';
		data.db_name = localStorage.getItem('user') ? JSON.parse(localStorage.getItem('user')).db_name : '';
		$rootScope.loader = true;
		Data.post('gethistory', {
			customer : data
		}).then(function(results) {
			$rootScope.loader = false;
			Data.toast(results);
			if (results.status == "success") {
				$scope.rows = results.data;
			}
		});
		
		
	};
	
});