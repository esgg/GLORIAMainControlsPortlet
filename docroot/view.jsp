
<%
	/**
	 * Copyright (c) 2000-2011 Liferay, Inc. All rights reserved.
	 *
	 * This library is free software; you can redistribute it and/or modify it under
	 * the terms of the GNU Lesser General Public License as published by the Free
	 * Software Foundation; either version 2.1 of the License, or (at your option)
	 * any later version.
	 *
	 * This library is distributed in the hope that it will be useful, but WITHOUT
	 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
	 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
	 * details.
	 */
%>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui"%>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>

<portlet:defineObjects />

<style type="text/css">
  .raLabel, .decLabel, .status-label {
	font-family:"Times New Roman",Georgia,Serif;
	font-weight: bold;
	margin:5px;
	}
  .buttonStyle{
  	margin:5px;
  }
</style>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>

<script>

var Base64 = {
		 
		// private property
		_keyStr : "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",
	 
		// public method for encoding
		encode : function (input) {
			var output = "";
			var chr1, chr2, chr3, enc1, enc2, enc3, enc4;
			var i = 0;
	 
			input = Base64._utf8_encode(input);
	 
			while (i < input.length) {
	 
				chr1 = input.charCodeAt(i++);
				chr2 = input.charCodeAt(i++);
				chr3 = input.charCodeAt(i++);
	 
				enc1 = chr1 >> 2;
				enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
				enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
				enc4 = chr3 & 63;
	 
				if (isNaN(chr2)) {
					enc3 = enc4 = 64;
				} else if (isNaN(chr3)) {
					enc4 = 64;
				}
	 
				output = output +
				this._keyStr.charAt(enc1) + this._keyStr.charAt(enc2) +
				this._keyStr.charAt(enc3) + this._keyStr.charAt(enc4);
	 
			}
	 
			return output;
		},
	 
		// public method for decoding
		decode : function (input) {
			var output = "";
			var chr1, chr2, chr3;
			var enc1, enc2, enc3, enc4;
			var i = 0;
	 
			input = input.replace(/[^A-Za-z0-9\+\/\=]/g, "");
	 
			while (i < input.length) {
	 
				enc1 = this._keyStr.indexOf(input.charAt(i++));
				enc2 = this._keyStr.indexOf(input.charAt(i++));
				enc3 = this._keyStr.indexOf(input.charAt(i++));
				enc4 = this._keyStr.indexOf(input.charAt(i++));
	 
				chr1 = (enc1 << 2) | (enc2 >> 4);
				chr2 = ((enc2 & 15) << 4) | (enc3 >> 2);
				chr3 = ((enc3 & 3) << 6) | enc4;
	 
				output = output + String.fromCharCode(chr1);
	 
				if (enc3 != 64) {
					output = output + String.fromCharCode(chr2);
				}
				if (enc4 != 64) {
					output = output + String.fromCharCode(chr3);
				}
	 
			}
	 
			output = Base64._utf8_decode(output);
	 
			return output;
	 
		},
	 
		// private method for UTF-8 encoding
		_utf8_encode : function (string) {
			string = string.replace(/\r\n/g,"\n");
			var utftext = "";
	 
			for (var n = 0; n < string.length; n++) {
	 
				var c = string.charCodeAt(n);
	 
				if (c < 128) {
					utftext += String.fromCharCode(c);
				}
				else if((c > 127) && (c < 2048)) {
					utftext += String.fromCharCode((c >> 6) | 192);
					utftext += String.fromCharCode((c & 63) | 128);
				}
				else {
					utftext += String.fromCharCode((c >> 12) | 224);
					utftext += String.fromCharCode(((c >> 6) & 63) | 128);
					utftext += String.fromCharCode((c & 63) | 128);
				}
	 
			}
	 
			return utftext;
		},
	 
		// private method for UTF-8 decoding
		_utf8_decode : function (utftext) {
			var string = "";
			var i = 0;
			var c = c1 = c2 = 0;
	 
			while ( i < utftext.length ) {
	 
				c = utftext.charCodeAt(i);
	 
				if (c < 128) {
					string += String.fromCharCode(c);
					i++;
				}
				else if((c > 191) && (c < 224)) {
					c2 = utftext.charCodeAt(i+1);
					string += String.fromCharCode(((c & 31) << 6) | (c2 & 63));
					i += 2;
				}
				else {
					c2 = utftext.charCodeAt(i+1);
					c3 = utftext.charCodeAt(i+2);
					string += String.fromCharCode(((c & 15) << 12) | ((c2 & 63) << 6) | (c3 & 63));
					i += 3;
				}
	 
			}
	 
			return string;
		}
	 
	};

	var user = "user";
	var password = "password";

	
	var auth = Base64.encode(user+":"+password);
	
	function setTargetName(){
		
		$.ajax({
			url: 'https://venus.datsi.fi.upm.es:8443/GLORIAAPI/experiments/context/87/parameters/mount?tree=target.object',
			method : 'POST',
			data: 	 document.getElementById('target_value').value,
			headers: {'Authorization': auth},
			dataType: 'json',
			success: function(json){
				
						goObject();		
				
			}, 
			error: function(json){
				
			}
		});
				
	}
	
	function goObject(){
		$.ajax({
			url: 'https://venus.datsi.fi.upm.es:8443/GLORIAAPI/experiments/context/87/execute/goObject',
			method : 'GET',
			headers: {'Authorization': auth},
			dataType: 'json',
			success: function(json){
				
						alert("VIVA Object!!!");		
				
			}, 
			error: function(json){
				
			}
		});
	}


	
	
	function setRadec(){
		
		$.ajax({
			url: 'https://venus.datsi.fi.upm.es:8443/GLORIAAPI/experiments/context/87/parameters/mount?tree=target.coordinates',
			method : 'POST',
			data: {
				"ra" : document.getElementById('ra_value').value,
				"dec" : document.getElementById('dec_value').value
			},
			headers: {'Authorization': auth},
			dataType: 'json',
			success: function(json){
				
						goRadec();		
				
			}, 
			error: function(json){
				
			}
		});
				
	}
	
	function goRadec(){
		$.ajax({
			url: 'https://venus.datsi.fi.upm.es:8443/GLORIAAPI/experiments/context/87/execute/goRADEC',
			method : 'GET',
			headers: {'Authorization': auth},
			dataType: 'json',
			success: function(json){
				
						alert("VIVA!!!");		
				
			}, 
			error: function(json){
				
			}
		});
	}

var imageCont = 0;

	function expose(){
		alert("Expose:");
		
		var imagesAlbum = new Array();

		imagesAlbum = "http://161.72.128.9:8080/RTD_TAD_DB/ServletImage?fileName=000000000000000100000140260ea68f.jpg";
		/* imagesAlbum[1] = "http://161.72.128.9:8080/RTD_TAD_DB/ServletImage?fileName=000000000000000100000140266c3966.jpg";*/
		/* imagesAlbum[2] = "http://161.72.128.9:8080/RTD_TAD_DB/ServletImage?fileName=000000000000000100000140266d9d2c.jpg"; */
		
		var htmlCodeImageAlbum;
		
		htmlCodeImageAlbum = htmlCodeImageAlbum + "<td><div class='thumbmail'><div class='imageTitle'><p>SUN</p></div>"+
				"<div><img class='thumbmailImage' src='"+imagesAlbum+"'/><div><div><button>FITS</button><button>JPG</button></div></div></td>";
		imageCont++;
		
		$("#albumImageCcd").append(htmlCodeImageAlbum);
				
	}
</script>

<div id="main_control">

	<!-- <h2><label class="aui-field-label raLabel centerLabel"> <liferay-ui:message key="label-mount"/></label></h2>  -->

	<fieldset>
		<legend>
			<liferay-ui:message key="label-mount" />
		</legend>
		<table>
			<tr>
				<td>
					<label class="aui-field-label raLabel"> <liferay-ui:message
					key="label-ra" /> :</label>
				</td>
				<td>
					<input size="5" id="ra_value" name="ra_value" value="-" />
				</td>
			</tr>
			<tr>
				<td>
					<label class="aui-field-label decLabel"> <liferay-ui:message
						key="label-dec" />:</label>
				</td>
				<td>
					<input size="5" id="dec_value" name="dec_value" value="-" />
				</td>
			</tr>
			<tr>
				<td>
					<label class="aui-field-label decLabel"> <liferay-ui:message
						key="label-target" />:</label>
				</td>
				<td>
					<input size="5" id="target" name="target" value="-" />
				</td>
			</tr>
			<tr>
				<td>
					<label class="status-label"> <liferay-ui:message
					key="label-status" />:</label>
				</td>
				<td>
					<label class="status-field status-field-ok"
				id="mount_status"><liferay-ui:message key="label-stop" /> </label>
				</td>
			</tr>
		</table>
		<div>
			<input type="button" value="GO" class="buttonStyle" onClick="setRadec()"/> <input
				type="button" value="MORE" class="buttonStyle"/>
		</div>
	</fieldset>
	<fieldset class="marginDivs">
		<legend>
			<liferay-ui:message key="label-ccd" />
		</legend>
		<table>
			<tr>
				<td>
					<label class="aui-field-label raLabel floatDivs"> <liferay-ui:message
						key="label-exposure" /> :</label>
				</td>
				<td>
					<input class="floatDivs" id="exp_value" name="exp_value" value="-" size="5"/>
				</td>
			</tr>
			<tr>
				<td>
					<label class="aui-field-label raLabel floatDivs"> <liferay-ui:message
					key="label-filter" /> :</label>
				</td>
				<td>
					<select id="filter" name="filter"></select>
				</td>
			</tr>
			<tr>
				<td>
					<label class="aui-field-label raLabel floatDivs"> <liferay-ui:message
					key="label-binning" /> :</label>
				</td>
				<td>
					<select id="binning" name="binning"></select>
				</td>
			</tr>
			<tr>
				<td>
					<label class="status-label floatDivs"><liferay-ui:message
						key="label-status" />: </label>
				</td>
				<td>
					<label	class="status-field status-field-ok floatDivs" id="ccd_status"><liferay-ui:message
					key="label-stop" /> </label>
				</td>
			</tr>
		</table>
		<div>
			<input id="exposureButton" type="button" class="buttonStyle" value="EXPOSURE" onClick="expose()"/> 
			<input type="button" class="buttonStyle" value="MORE" />
		</div>
	</fieldset>
</div>