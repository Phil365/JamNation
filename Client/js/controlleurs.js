(function () {
    jamNationsAdmin.controller('AccueilCtrl', ['$scope', '$http', '$location', '$ocLazyLoad', function ($scope, $http, $location, $ocLazyLoad) {
        $ocLazyLoad.load(['js/social.js', 'bower_components/ngtweet/dist/ngtweet.min.js']);

        $ocLazyLoad.load('//platform.twitter.com/widgets.js');
        var req = {
            method: 'GET',
            url: '../Api/public/membre',
        };

        $http(req).then(function (reponse) {
            $scope.membres = reponse.data;
        });

        var reqTextes = {
            method: 'GET',
            url: '../Api/public/textes',
        };

        $http(reqTextes).then(function (reponse) {
            $scope.textes = reponse.data;
        });
        var reqStudio = {
            method: 'GET',
            url: '../Api/public/studioInscris',
        };

        $http(reqStudio).then(function (reponse) {
            $scope.studios = reponse.data;
        });


        $scope.Admin = function () {

            $http(req).then(function (reponse) {

            });
        }

    }]);

    jamNationsAdmin.controller('GamejamCtrl', ['$scope', '$http', '$routeParams', function ($scope, $http, $routeParams) {

        var reqGamejam = {
            method: 'GET',
            url: '../Api/public/gamejam',
        };


        $scope.GamejamSponsors = [];
        var reqGamejamSponsor = function (i) {
            $http.get('../Api/public/gamejam/' + [i]).success(function (data) {
                $scope.GamejamSponsors[i] = data;
            }).error(function (data) {
                console.log("The request isn't working");
            });
        };
        $scope.GamejamSponsorsPrincipal = [];
        var reqGamejamSponsorsPrincipal = function (i) {
            $http.get('../Api/public/gamejam/' + [i] + '/principal').success(function (data) {
                $scope.GamejamSponsorsPrincipal[i] = data;
            }).error(function (data) {
                console.log("The request isn't working");
            });
        };

        $http(reqGamejam).then(function (reponse) {
            $scope.gamejams = reponse.data;
            for (var i = 1; i < reponse.data.length + 1; i++) {
                reqGamejamSponsor(i);
                reqGamejamSponsorsPrincipal(i);

            };
        });


        $scope.clearValue = function () {
            $scope.orderProp = undefined;
            $scope.filtreEquipe = undefined;
            $scope.searchText = undefined;

        };

    }]);
    jamNationsAdmin.controller('GamejamDetailsCtrl', ['$scope', '$http', '$routeParams', function ($scope, $http, $routeParams) {
        $scope.id = $routeParams.id;
        var reqDetailsGamejamMembres = {
            method: 'GET',
            url: '../Api/public/gamejam/' + $scope.id + '/info',
        };
        $http(reqDetailsGamejamMembres).then(function (reponse) {
            $scope.detailGamejammembres = reponse.data;
        });
        var reqJeuxGamejam = {
            method: 'GET',
            url: '../Api/public/jeux/' + $scope.id,
        };
        $http(reqJeuxGamejam).then(function (reponse) {
            $scope.JeuxGamejam = reponse.data;
        });
        $scope.GamejamSponsors = [];
        var reqGamejamSponsor = function (i) {
            $http.get('../Api/public/gamejam/' + $scope.id).success(function (data) {
                $scope.GamejamSponsors[i] = data;
            }).error(function (data) {
                console.log("The request isn't working");
            });
        };
        $scope.GamejamSponsorsPrincipal = [];
        var reqGamejamSponsorsPrincipal = function (i) {
            $http.get('../Api/public/gamejam/' + $scope.id + '/principal').success(function (data) {
                $scope.GamejamSponsorsPrincipal[i] = data;
            }).error(function (data) {
                console.log("The request isn't working");
            });
        };
        for (var i = 1; i < 2; i++) {
            reqGamejamSponsor(i);
            reqGamejamSponsorsPrincipal(i);

        };
    }]);
    jamNationsAdmin.controller('FooterCtrl', ['$scope', '$http', '$routeParams', function ($scope, $http, $routeParams) {
        var reqPartenaire = {
            method: 'GET',
            url: '../Api/public/partenaire',
        };

        $http(reqPartenaire).then(function (reponse) {
            $scope.partenaires = reponse.data;
        });
    }]);
    jamNationsAdmin.controller('HeaderCtrl', ['$scope', '$http', '$routeParams', '$ocLazyLoad', function ($scope, $http, $routeParams, $ocLazyLoad) {

        $scope.isOpen = false;
        $scope.demo = {
            isOpen: false,
            count: 0,
            selectedDirection: 'right'
        };

    }]);
    jamNationsAdmin.controller('SidenavCtrl', ['$scope', '$http', '$routeParams', '$ocLazyLoad', '$timeout', '$mdSidenav', '$log', function ($scope, $http, $routeParams, $ocLazyLoad, $timeout, $mdSidenav, $log) {

        $scope.isOpen = false;
        $scope.demo = {
            isOpen: false,
            count: 0,
            selectedDirection: 'right'
        };

        $scope.toggleLeft = buildDelayedToggler('left');

        /**
         * Supplies a function that will continue to operate until the
         * time is up.
         */
        function debounce(func, wait, context) {
            var timer;
            return function debounced() {
                var context = $scope,
                    args = Array.prototype.slice.call(arguments);
                $timeout.cancel(timer);
                timer = $timeout(function () {
                    timer = undefined;
                    func.apply(context, args);
                }, wait || 10);
            };
        }
        /**
         * Build handler to open/close a SideNav; when animation finishes
         * report completion in console
         */
        function buildDelayedToggler(navID) {
            return debounce(function () {
                // Component lookup should always be available since we are not using `ng-if`
                $mdSidenav(navID)
                    .toggle()
                    .then(function () {
                        //            $log.debug("toggle " + navID + " is done");
                    });
            }, 200);
        }

        function buildToggler(navID) {
            return function () {
                // Component lookup should always be available since we are not using `ng-if`
                $mdSidenav(navID)
                    .toggle()
                    .then(function () {
                        //            $log.debug("toggle " + navID + " is done");
                    });
            }
        }
    }]);

    jamNationsAdmin.controller('EquipeCtrl', ['$scope', '$http', '$routeParams', '$sce', function ($scope, $http, $routeParams, $sce) {
        var reqStudio = {
            method: 'GET',
            url: '../Api/public/studioInscris',
        };

        $http(reqStudio).then(function (reponse) {
            $scope.studios = reponse.data;
        });

    }]);
    jamNationsAdmin.controller('EquipeDetailsCtrl', ['$scope', '$http', '$routeParams', '$sce', function ($scope, $http, $routeParams, $sce) {
        $scope.id = $routeParams.id;
        var reqStudioMembres = {
            method: 'GET',
            url: '../Api/public/studioInscris/' + $scope.id,
        };

        $http(reqStudioMembres).then(function (reponse) {
            $scope.studiosMembres = reponse.data;
        });
        $scope.labels = ["Programmation", "Design", "Son", "Arts", "Animation"];
        var reqJeuxEquipe = {
            method: 'GET',
            url: '../Api/public/equipe/' + $scope.id + '/jeux',
        };
        $http(reqJeuxEquipe).then(function (reponse) {
            $scope.JeuxEquipe = reponse.data;
        });
        $scope.GamejamSponsors = [];
        var reqGamejamSponsor = function (i) {
            $http.get('../Api/public/equipe/' + $scope.id + '/commandite').success(function (data) {
                $scope.GamejamSponsors[i] = data;
            }).error(function (data) {
                console.log("The request isn't working");
            });
        };

        for (var i = 1; i < 2; i++) {
            reqGamejamSponsor(i);

        };

    }]);

    jamNationsAdmin.controller('ArchivesCtrl', ['$scope', '$http', '$routeParams', '$sce', function ($scope, $http, $routeParams, $sce) {
        var reqTextes = {
            method: 'GET',
            url: '../Api/public/textes/archives',
        };

        $http(reqTextes).then(function (reponse) {
            $scope.textes = reponse.data;
        });
        $scope.clearValue = function () {
            $scope.orderProp = undefined;
            $scope.searchText = undefined;

        };

    }]);
    jamNationsAdmin.controller('MembreCtrl', ['$scope', '$http', '$routeParams', '$mdToast', function ($scope, $http, $routeParams, $timeout, $mdSidenav, $log, $mdToast) {

        var reqMembre = {
            method: 'GET',
            url: '../Api/public/font_partie',
        };
        var reqEquipe = {
            method: 'GET',
            url: '../Api/public/equipe',
        };

        $http(reqMembre).then(function (reponse) {
            $scope.membres = reponse.data;

        });
        $http(reqEquipe).then(function (reponse) {
            $scope.equipes = reponse.data;

        });
        $scope.labels = ["Programmation", "Design", "Son", "Arts", "Animation"];
        $scope.clearValue = function () {
            $scope.orderProp = undefined;
            $scope.filtreEquipe = undefined;
            $scope.searchText = undefined;

        };


    }]);
    jamNationsAdmin.controller('CarteMembreCtrl', ['$scope', '$http', '$routeParams', function ($scope, $http, $routeParams, $timeout, $mdSidenav, $log) {
        $scope.id = $routeParams.id;
        var reqMembreCarte = {
            method: 'GET',
            url: '../Api/public/font_partie/' + $scope.id,
        };

        $http(reqMembreCarte).then(function (reponse) {
            $scope.cartemembres = reponse.data;
        });

        $scope.labels = ["Programmation", "Design", "Son", "Arts", "Animation"];
        $scope.clearValue = function () {
            $scope.orderProp = undefined;
            $scope.filtreEquipe = undefined;
            $scope.searchText = undefined;

        };


    }]);
    jamNationsAdmin.controller('MembreDetailsCtrl', ['$scope', '$http', '$routeParams', '$ocLazyLoad', function ($scope, $http, $routeParams, $ocLazyLoad) {
        $ocLazyLoad.load([' bower_components/angular-data-table/release/dataTable.css', 'bower_components/angular-data-table/release/material.css']);



        $scope.id = $routeParams.id;
        var reqDetailsMembres = {
            method: 'GET',
            url: '../Api/public/membre/' + $scope.id,
        };
        $http(reqDetailsMembres).then(function (reponse) {
            //            console.log(reponse);
            $scope.detailsmembre = reponse.data;

        });
        $scope.id = $routeParams.id;
        var reqDetailsMembresJeux = {
            method: 'GET',
            url: '../Api/public/membre/' + $scope.id + '/jeux',
        };
        $http(reqDetailsMembresJeux).then(function (reponse) {
            $scope.detailsmembreJeux = reponse.data;
        });
        $scope.labels = ["Programmation", "Design", "Son", "Arts", "Animation"];

        $scope.optionsee = {
            rowHeight: 50,
            headerHeight: 50,
            footerHeight: false,
            scrollbarV: false,
            selectable: false,
            columns: [
                {
                    name: "Nombre de jam",
                    prop: "nombreJam",
                    width: 150
                },

                {
                    name: "Nombre d'heure sans sommeil",
                    prop: "nuitBlanche",
                    width: 250
                }
            ]
        };
        $http.get('../Api/public/membre/' + $scope.id + '/gamejam').success(function (data) {
            $scope.dataee = data;
        });
    }]);

    jamNationsAdmin.filter('trustAsResourceUrl', ['$sce', function ($sce) {
        return function (val) {
            return $sce.trustAsResourceUrl(val);
        };
    }])
    jamNationsAdmin.controller('LeftCtrl', function ($scope, $timeout, $mdSidenav, $log) {
        $scope.close = function () {
            // Component lookup should always be available since we are not using `ng-if`
            $mdSidenav('left').close()
                .then(function () {
                    //          $log.debug("close LEFT is done");
                });
        };
    })

})();
