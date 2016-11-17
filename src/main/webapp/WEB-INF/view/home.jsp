<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8"/>
    <title> Spring MVC 4 REST + AngularJS </title>
</head>
<body ng-app="myApp">
<div ng-controller="PersonController as personCtrl">
    <h1> Javarush </h1>
    <form name="personForm" method="POST">
        <table>
            <tr>
                <td colspan="2">
                    <div ng-if="personCtrl.flag != 'edit'">
                        <h3> Add New Person </h3>
                    </div>
                    <div ng-if="personCtrl.flag == 'edit'">
                        <h3> Update Person for ID: {{ personCtrl.person.id }} </h3>
                    </div>
                </td>
            </tr>
            <tr>
                <td>Name:</td>
                <td><input type="text" name="name" ng-model="personCtrl.person.name" required/>
                    <span ng-show="personForm.name.$error.required" class="msg-val">Name is required.</span></td>
            </tr>
            <tr>
                <td>Age:</td>
                <td><input type="text" name="age" ng-model="personCtrl.person.age" required/>
                    <span ng-show="personForm.age.$error.required" class="msg-val">Age is required.</span></td>
            </tr>
            <tr>
                <td>Is Admin:</td>
                <td><input type="checkbox" name="admin" ng-model="personCtrl.person.admin" required/>
                    <span ng-show="personForm.admin.$error.required" class="msg-val">Is admin is required.</span></td>
            </tr>
            <tr>
                <td colspan="2"><span ng-if="personCtrl.flag=='created'"
                                      class="msg-success">Person successfully added.</span>
                    <span ng-if="personCtrl.flag=='failed'" class="msg-val">Person already exists.</span></td>
            </tr>
            <tr>
                <td colspan="2">
                    <div ng-if="personCtrl.flag != 'edit'">
                        <input type="submit" ng-click="personCtrl.addPerson()" value="Add Person"/>
                        <input type="button" ng-click="personCtrl.reset()" value="Reset"/>
                    </div>
                    <div ng-if="personCtrl.flag == 'edit'">
                        <input type="submit" ng-click="personCtrl.updatePersonDetail()" value="Update Person"/>
                        <input type="button" ng-click="personCtrl.cancelUpdate()" value="Cancel"/>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2"><span ng-if="personCtrl.flag=='deleted'" class="msg-success">Person successfully deleted.</span>
            </tr>
        </table>
    </form>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Age</th>
            <th>Is admin</th>
        </tr>
        <tr ng-repeat="row in personCtrl.persons">
            <td><span ng-bind="row.id"></span></td>
            <td><span ng-bind="row.name"></span></td>
            <td><span ng-bind="row.age"></span></td>
            <td><input type="checkbox"
                       ng-model="row.admin"/></td>
            <td>
                <input type="button" ng-click="personCtrl.deletePerson(row.id)" value="Delete"/>
                <input type="button" ng-click="personCtrl.editPerson(row.id)" value="Edit"/>
                <span ng-if="personCtrl.flag=='updated' && row.id==personCtrl.updatedId" class="msg-success">Person successfully updated.</span>
            </td>
        </tr>
    </table>
</div>
<script src="${pageContext.request.contextPath}/app-resources/js/lib/angular.min.js"></script>
<script src="${pageContext.request.contextPath}/app-resources/js/lib/angular-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/app-resources/js/app.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-resources/css/style.css"/>
</body>
</html>  
  