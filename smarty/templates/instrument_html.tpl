<script type="text/javascript" src="js/instrument_form_control.js"></script>
<form {$form.attributes}>
	{$form.hidden}
	{$form.errors.mainError}
	{foreach from=$form.sections item=section}
		<h5>{$section.header}</h5>
		{foreach from=$section.elements item=element}
			{if $element.name neq mainError}
				{if $element.error}
		    	<div class="row form-group form-inline form-inline has-error">
		        {else}
		        <div class="row form-group form-inline form-inline">
		        {/if}
					<lable class="lab col-sm-4 col-xs-12">
						{if $element.required}
							<span style="color: #ff0000">*</span>
						{/if}
						{$element.label}  
					</lable>
					<div class="col-sm-8">
						<div class="col-xs-12 element">
							{if $element.type eq "group"}
								{foreach key=gkey item=gitem from=$element.elements}
									{$gitem.html}
								{/foreach}
							{else}
								{$element.html}
							{/if}
						</div>
						{if $element.error}
							<div class="col-xs-12">
			                    <font class="form-error">{$element.error}</font>
			                </div>
						{/if}
					</div>
				</div>
			{/if}
		{/foreach}
	{/foreach}
</form>