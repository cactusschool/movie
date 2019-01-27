var app = angular.module('myApp', ['ngRoute', 'ngAnimate', 'toaster']);

app.config(['$provide', '$routeProvider', '$httpProvider',
    function ($provide, $routeProvider, $httpProvider) {
        // Intercept http calls.
        $httpProvider.defaults.withCredentials = true;
        $provide.factory('MyHttpInterceptor', function ($q) {
            return {
                // On request success
                request: function (config) {
                    // console.log(config); // Contains the data about the request before it is sent.
                    if (localStorage.getItem('token')) {
                        config.headers.Authorization = "Bearer " + JSON.parse(localStorage.getItem('token'));
                    }
                    // Return the config or wrap it in a promise if blank.
                    return config || $q.when(config);
                },

                // On request failure
                requestError: function (rejection) {
                    // console.log(rejection); // Contains the data about the error on the request.

                    // Return the promise rejection.
                    return $q.reject(rejection);
                },

                // On response success
                response: function (response) {
                    // console.log(response); // Contains the data from the response.

                    // Return the response or promise.
                    return response || $q.when(response);
                },

                // On response failture
                responseError: function (rejection) {
                    // console.log(rejection); // Contains the data about the error.

                    // Return the promise rejection.
                    return $q.reject(rejection);
                }
            };
        });

        // Add the interceptor to the $httpProvider.
        $httpProvider.interceptors.push('MyHttpInterceptor');
        //	$httpProvider.defaults.headers.common = {};
        //$httpProvider.defaults.headers.post = {};
        //$httpProvider.defaults.withCredentials = true;
        //$httpProvider.defaults.headers.get = {};
        //$httpProvider.defaults.headers.put = {};
        //$httpProvider.defaults.headers.patch = {};
        $routeProvider.
            when('/login', {
                title: 'Login',
                templateUrl: 'public/assets/scripts/partials/login.html',
                controller: 'authCtrl'
            })
            .when('/logout', {
                title: 'Logout',
                templateUrl: 'partials/login.html',
                controller: 'logoutCtrl'
            })
            .when('/signup', {
                title: 'Signup',
                templateUrl: 'partials/signup.html',
                controller: 'authCtrl'
            })
            .when('/dashboard', {
                title: 'Dashboard',
                templateUrl: 'public/assets/scripts/partials/dashboard.html',
                controller: 'authCtrl',
                activetab: 'dashboard'
            })
            .when('/profile', {
                title: 'Profile',
                templateUrl: 'partials/profile.html',
                controller: 'authCtrl',
                activetab: 'profile'
            })
            .when('/history', {
                title: 'History',
                templateUrl: 'partials/history.html',
                controller: 'historyCtrl',
                activetab: 'history'
            })
            .when('/', {
                title: 'Login',
                templateUrl: 'partials/login.html',
                controller: 'authCtrl',
                role: '0'
            })
            .otherwise({
                redirectTo: '/login'
            });
    }])
    .run(function ($rootScope, $location, Data) {
        $rootScope.$on("$routeChangeStart", function (event, next, current) {
            $rootScope.authenticated = false;
            $rootScope.loader = true;

            if (localStorage.getItem('token')) {
                Data.post('get-details', {}).then(function (results) {
                    $rootScope.loader = false;
                    if (results.success) {
                        $rootScope.success = results.success;
                        if ($location.path() === '/login') {
                            $location.path("/dashboard");
                        }
                    } else {
                        var nextUrl = next.$$route.originalPath;
                        if (nextUrl == '/signup' || nextUrl == '/login') {

                        } else {
                            $location.path("/login");
                        }
                        localStorage.removeItem('token');
                        Data.toast({
                            status: 'info',
                            message: 'Logged out successfully'
                        });
                    }
                })
                    .catch(function (error) {
                        Data.toast({
                            status: 'error',
                            message: 'Some Error Happened'
                        });
                        var nextUrl = next.$$route.originalPath;
                        if (nextUrl == '/signup' || nextUrl == '/login') {

                        } else {
                            $location.path("/login");
                        }
                        localStorage.removeItem('token');
                    });
            } else {
                var nextUrl = next.$$route.originalPath;
                if (nextUrl == '/signup' || nextUrl == '/login') {

                } else {
                    $location.path("/login");
                }

            }


        });
    });