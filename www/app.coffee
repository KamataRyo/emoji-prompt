pseudoTerm = angular.module 'pseudoTerm', []

pseudoTerm.directive 'prompt', ->
    return {
        restrict: 'E'
        replace: true
        require: '^line'
        template: '<span class="prompt" content="{{content}}"></span>'
        scope: {
            content: '@content'
        }
    }
pseudoTerm.directive 'stdin', ->
    return {
        restrict: 'E'
        replace: true
        require: '^line'
        template: '<span class="stdin" data-streamSpeed="{{streamSpeed}} content="{{content}}"></span>'
        scope: {
            streamSpeed: '@streamSpeed'
            content: '@content'
        }
    }
pseudoTerm.directive 'stdout', ->
    return {
        restrict: 'E'
        replace: true
        require: '^line'
        template: '<span class="stdout" content="{{content}}"></span>'
        scope: {
            content: '@content'
        }
    }
pseudoTerm.directive 'line', ->
    return {
        restrict: 'E'
        replace: true
        require: '^terminal'
        transclude: true
        template: '<p class="line" data-delay="{{delay}}" content="{{content}}" ng-transclude></p>'
        scope: {
            delay: '@delay'
            content: '@content'
        }
    }
pseudoTerm.directive 'terminal', ->
    return {
        restrict: 'E'
        replace: true
        transclude: true
        template: '<div class="terminal" data-repeat="{{repeat}}" data-waitAfter="{{waitAfter}} content="{{content}}" ng-transclude></div>'
        scope: {
            repeat: '@repeat'
            waitAfter: '@waitAfter'
            content: '@content'
        }
    }
