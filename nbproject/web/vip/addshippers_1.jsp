<%-- 
    Document   : updateshippers
    Created on : Jul 2, 2022, 5:35:48 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<form class="form-valide" action="shippers" method="post">
    
    <input type="hidden" name="do" value="AddShippers">
    <h2>Add Shippers</h2>
    <div class="form-group row">
        <label class="col-lg-4 col-form-label" for="val-username">Company Name <span class="text-danger">*</span>
        </label>
        <div class="col-lg-6">
            <input type="text" class="form-control" id="val-username" name="val-name" placeholder="Enter a Company Name.." value="${ship.companyName}">
        </div>
    </div>
    <div class="form-group row">
        <label class="col-lg-4 col-form-label" for="val-email">Adress <span class="text-danger">*</span>
        </label>
        <div class="col-lg-6">
            <input type="text" class="form-control" id="val-email" name="address" placeholder="Your valid Address.." value="${ship.address}">
        </div>
    </div>
    <div class="form-group row">
        <label class="col-lg-4 col-form-label" for="val-phoneus">Phone  <span class="text-danger" >*</span>
        </label>
        <div class="col-lg-6">
            <input type="text" class="form-control" id="val-phoneus" name="val-phoneus" placeholder="212-999-0000" value="${ship.phone}">
        </div>
    </div>

</div>
<div class="form-group row">
    <div class="col-lg-8 ml-auto">
        <input type="submit" name="submit" value="Submit" onclick="return alert('Are you sure you want to delete ?')" class="btn btn-primary">
        
    </div>
</div>
</form>
