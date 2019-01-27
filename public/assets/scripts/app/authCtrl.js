app.controller('authCtrl', function ($scope, $rootScope, $routeParams, $location, $http, Data, $route) {
	//initially set those objects to null to avoid undefined error
	/*$('.acno').inputmask({
		"mask" : "HSB-999999"
	});*/
	if (localStorage.getItem('user')) {
		$rootScope.loader = true;
	} else {
		$rootScope.loader = false;
	}
	$scope.$route = $route;
	$scope.login = {};
	$scope.signup = {};
	$scope.get = true;
	$scope.doLogin = function (customer) {
		$rootScope.loader = true;
		Data.post('login', customer)
			.then(function (results) {
				if (results.success) {
					localStorage.setItem('token', JSON.stringify(results.success.token));
					$location.path('dashboard');
				}
				$rootScope.loader = false;

			}).catch(function (error, a, b) {
				Data.toast({
					status: 'error',
					message: 'Internal Server Error'
				});
			});
	};
	$scope.signup = {
		email: '',
		password: '',
		user: '',
		cpassword: ''
	};
	$scope.signUp = function (customer) {
		Data.post('register', customer
		).then(function (results) {
			if (results.success) {
				Data.toast({
					status: 'success',
					message: results.success.name + " is register successfully"
				});
				$location.path('dashboard');
			}
		}).catch(function (error, a, b) {
			Data.toast({
				status: 'error',
				message: 'Internal Server Error'
			});
		});;
	};
	$scope.logout = function () {
		$rootScope.loader = true;
		Data.post('logout', {})
			.then(function (results) {
				if (results.success) {
					localStorage.removeItem('token');
					Data.toast({
						status: 'info',
						message: results.success.name + ' logged out successfully'
					});
					$location.path('login');
				}
				$rootScope.loader = false;

			}).catch(function (error, a, b) {
				Data.toast({
					status: 'error',
					message: 'Internal Server Error'
				});
			});
	};

	$scope.deposit = function (data) {
		data.accHolder = $scope.accHolder;
		data.senderId = JSON.parse(localStorage.getItem('user')).sms_sender_id;
		data.agent = JSON.parse(localStorage.getItem('user')).name;
		if (!data.amount) {
			Data.toast({
				status: 'error',
				message: 'Enter An Amount'
			});
		} else {
			Data.post('deposit', data).then(function (results) {
				Data.toast(results);
				$location.path("/login");
			}).catch(function (err) {
				Data.toast(err);
			});
		}

	};
	$scope.doac = function (data) {
		//data.acno = data.acno.split('_')[0];
		data.acno = data.acno.toUpperCase();

		data.id = localStorage.getItem('user') ? JSON.parse(localStorage.getItem('user')).id : '';
		data.apikey = localStorage.getItem('user') ? JSON.parse(localStorage.getItem('user')).apikey : '';
		data.db_name = localStorage.getItem('user') ? JSON.parse(localStorage.getItem('user')).db_name : '';
		$rootScope.loader = true;
		Data.post('getaccount', {
			customer: data
		}).then(function (results) {
			$rootScope.loader = false;
			Data.toast(results);
			$scope.accHolder = results;
			if (results.status == "success") {
				$scope.get = false;
			}
		});

	};
	angular.element(document).ready(function () {
		$('.navbar-toggle').on('click', function () {
			$('.navbar-collapse').toggleClass('right');
			$('.navbar-toggle').toggleClass('indexcity');
		});
	});
});
