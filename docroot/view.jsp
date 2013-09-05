
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
			<input type="button" value="GO" class="buttonStyle"/> <input
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
			<input type="button" class="buttonStyle" value="EXPOSURE" /> 
			<input type="button" class="buttonStyle" value="MORE" />
		</div>
	</fieldset>
</div>