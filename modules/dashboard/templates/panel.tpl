<div class="panel panel-default">
    {if $title}
    <div class="panel-heading">
        <h3 class="panel-title">{$title}</h3>
        {if !empty($menus)}
            <div class="btn-group views">
                <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">Views<span class="caret"></span></button>
                <ul class="dropdown-menu pull-right" role="menu">
                    {foreach from=$menus key=target item=label name=viewmenu}
                    <li {if $smarty.foreach.viewmenu.first}class="active"{/if}><a data-target="{$target}">{$label}</a></li>
                    {/foreach}
                </ul>
            </div>
        {/if}
        <span class="clickable glyphicon glyphicon-chevron-up"></span>
    </div>
    {/if}
    <div class="panel-body">
        {$body}
    </div>
    {if $footer}
    <div class="panel-footer">
        {$footer}
    </div>
    {/if}

</div>

