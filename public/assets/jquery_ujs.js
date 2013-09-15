!function(e,t){e.rails!==t&&e.error("jquery-ujs has already been loaded!");var i,n=e(document);e.rails=i={linkClickSelector:"a[data-confirm], a[data-method], a[data-remote], a[data-disable-with]",buttonClickSelector:"button[data-remote]",inputChangeSelector:"select[data-remote], input[data-remote], textarea[data-remote]",formSubmitSelector:"form",formInputClickSelector:"form input[type=submit], form input[type=image], form button[type=submit], form button:not([type])",disableSelector:"input[data-disable-with], button[data-disable-with], textarea[data-disable-with]",enableSelector:"input[data-disable-with]:disabled, button[data-disable-with]:disabled, textarea[data-disable-with]:disabled",requiredInputSelector:"input[name][required]:not([disabled]),textarea[name][required]:not([disabled])",fileInputSelector:"input[type=file]",linkDisableSelector:"a[data-disable-with]",CSRFProtection:function(t){var i=e('meta[name="csrf-token"]').attr("content");i&&t.setRequestHeader("X-CSRF-Token",i)},fire:function(t,i,n){var s=e.Event(i);return t.trigger(s,n),s.result!==!1},confirm:function(e){return confirm(e)},ajax:function(t){return e.ajax(t)},href:function(e){return e.attr("href")},handleRemote:function(n){var s,o,r,a,l,u,c,h;if(i.fire(n,"ajax:before")){if(a=n.data("cross-domain"),l=a===t?null:a,u=n.data("with-credentials")||null,c=n.data("type")||e.ajaxSettings&&e.ajaxSettings.dataType,n.is("form")){s=n.attr("method"),o=n.attr("action"),r=n.serializeArray();var d=n.data("ujs:submit-button");d&&(r.push(d),n.data("ujs:submit-button",null))}else n.is(i.inputChangeSelector)?(s=n.data("method"),o=n.data("url"),r=n.serialize(),n.data("params")&&(r=r+"&"+n.data("params"))):n.is(i.buttonClickSelector)?(s=n.data("method")||"get",o=n.data("url"),r=n.serialize(),n.data("params")&&(r=r+"&"+n.data("params"))):(s=n.data("method"),o=i.href(n),r=n.data("params")||null);h={type:s||"GET",data:r,dataType:c,beforeSend:function(e,s){return s.dataType===t&&e.setRequestHeader("accept","*/*;q=0.5, "+s.accepts.script),i.fire(n,"ajax:beforeSend",[e,s])},success:function(e,t,i){n.trigger("ajax:success",[e,t,i])},complete:function(e,t){n.trigger("ajax:complete",[e,t])},error:function(e,t,i){n.trigger("ajax:error",[e,t,i])},crossDomain:l},u&&(h.xhrFields={withCredentials:u}),o&&(h.url=o);var p=i.ajax(h);return n.trigger("ajax:send",p),p}return!1},handleMethod:function(n){var s=i.href(n),o=n.data("method"),r=n.attr("target"),a=e("meta[name=csrf-token]").attr("content"),l=e("meta[name=csrf-param]").attr("content"),u=e('<form method="post" action="'+s+'"></form>'),c='<input name="_method" value="'+o+'" type="hidden" />';l!==t&&a!==t&&(c+='<input name="'+l+'" value="'+a+'" type="hidden" />'),r&&u.attr("target",r),u.hide().append(c).appendTo("body"),u.submit()},disableFormElements:function(t){t.find(i.disableSelector).each(function(){var t=e(this),i=t.is("button")?"html":"val";t.data("ujs:enable-with",t[i]()),t[i](t.data("disable-with")),t.prop("disabled",!0)})},enableFormElements:function(t){t.find(i.enableSelector).each(function(){var t=e(this),i=t.is("button")?"html":"val";t.data("ujs:enable-with")&&t[i](t.data("ujs:enable-with")),t.prop("disabled",!1)})},allowAction:function(e){var t,n=e.data("confirm"),s=!1;return n?(i.fire(e,"confirm")&&(s=i.confirm(n),t=i.fire(e,"confirm:complete",[s])),s&&t):!0},blankInputs:function(t,i,n){var s,o,r=e(),a=i||"input,textarea",l=t.find(a);return l.each(function(){if(s=e(this),o=s.is("input[type=checkbox],input[type=radio]")?s.is(":checked"):s.val(),!o==!n){if(s.is("input[type=radio]")&&l.filter('input[type=radio]:checked[name="'+s.attr("name")+'"]').length)return!0;r=r.add(s)}}),r.length?r:!1},nonBlankInputs:function(e,t){return i.blankInputs(e,t,!0)},stopEverything:function(t){return e(t.target).trigger("ujs:everythingStopped"),t.stopImmediatePropagation(),!1},disableElement:function(e){e.data("ujs:enable-with",e.html()),e.html(e.data("disable-with")),e.bind("click.railsDisable",function(e){return i.stopEverything(e)})},enableElement:function(e){e.data("ujs:enable-with")!==t&&(e.html(e.data("ujs:enable-with")),e.removeData("ujs:enable-with")),e.unbind("click.railsDisable")}},i.fire(n,"rails:attachBindings")&&(e.ajaxPrefilter(function(e,t,n){e.crossDomain||i.CSRFProtection(n)}),n.delegate(i.linkDisableSelector,"ajax:complete",function(){i.enableElement(e(this))}),n.delegate(i.linkClickSelector,"click.rails",function(n){var s=e(this),o=s.data("method"),r=s.data("params");if(!i.allowAction(s))return i.stopEverything(n);if(s.is(i.linkDisableSelector)&&i.disableElement(s),s.data("remote")!==t){if(!(!n.metaKey&&!n.ctrlKey||o&&"GET"!==o||r))return!0;var a=i.handleRemote(s);return a===!1?i.enableElement(s):a.error(function(){i.enableElement(s)}),!1}return s.data("method")?(i.handleMethod(s),!1):void 0}),n.delegate(i.buttonClickSelector,"click.rails",function(t){var n=e(this);return i.allowAction(n)?(i.handleRemote(n),!1):i.stopEverything(t)}),n.delegate(i.inputChangeSelector,"change.rails",function(t){var n=e(this);return i.allowAction(n)?(i.handleRemote(n),!1):i.stopEverything(t)}),n.delegate(i.formSubmitSelector,"submit.rails",function(n){var s=e(this),o=s.data("remote")!==t,r=i.blankInputs(s,i.requiredInputSelector),a=i.nonBlankInputs(s,i.fileInputSelector);if(!i.allowAction(s))return i.stopEverything(n);if(r&&s.attr("novalidate")==t&&i.fire(s,"ajax:aborted:required",[r]))return i.stopEverything(n);if(o){if(a){setTimeout(function(){i.disableFormElements(s)},13);var l=i.fire(s,"ajax:aborted:file",[a]);return l||setTimeout(function(){i.enableFormElements(s)},13),l}return i.handleRemote(s),!1}setTimeout(function(){i.disableFormElements(s)},13)}),n.delegate(i.formInputClickSelector,"click.rails",function(t){var n=e(this);if(!i.allowAction(n))return i.stopEverything(t);var s=n.attr("name"),o=s?{name:s,value:n.val()}:null;n.closest("form").data("ujs:submit-button",o)}),n.delegate(i.formSubmitSelector,"ajax:beforeSend.rails",function(t){this==t.target&&i.disableFormElements(e(this))}),n.delegate(i.formSubmitSelector,"ajax:complete.rails",function(t){this==t.target&&i.enableFormElements(e(this))}),e(function(){var t=e("meta[name=csrf-token]").attr("content"),i=e("meta[name=csrf-param]").attr("content");e('form input[name="'+i+'"]').val(t)}))}(jQuery);