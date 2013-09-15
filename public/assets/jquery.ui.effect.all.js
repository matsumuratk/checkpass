/*!
 * jQuery UI Effects 1.10.3
 * http://jqueryui.com
 *
 * Copyright 2013 jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 *
 * http://api.jqueryui.com/category/effects-core/
 */
!function(e,t){var i="ui-effects-";e.effects={effect:{}},/*!
 * jQuery Color Animations v2.1.2
 * https://github.com/jquery/jquery-color
 *
 * Copyright 2013 jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 *
 * Date: Wed Jan 16 08:47:09 2013 -0600
 */
function(e,t){function i(e,t,i){var n=h[t.type]||{};return null==e?i||!t.def?null:t.def:(e=n.floor?~~e:parseFloat(e),isNaN(e)?t.def:n.mod?(e+n.mod)%n.mod:0>e?0:n.max<e?n.max:e)}function n(t){var i=u(),n=i._rgba=[];return t=t.toLowerCase(),f(l,function(e,s){var o,a=s.re.exec(t),r=a&&s.parse(a),l=s.space||"rgba";return r?(o=i[l](r),i[c[l].cache]=o[c[l].cache],n=i._rgba=o._rgba,!1):void 0}),n.length?("0,0,0,0"===n.join()&&e.extend(n,o.transparent),i):o[t]}function s(e,t,i){return i=(i+1)%1,1>6*i?e+6*(t-e)*i:1>2*i?t:2>3*i?e+6*(t-e)*(2/3-i):e}var o,a="backgroundColor borderBottomColor borderLeftColor borderRightColor borderTopColor color columnRuleColor outlineColor textDecorationColor textEmphasisColor",r=/^([\-+])=\s*(\d+\.?\d*)/,l=[{re:/rgba?\(\s*(\d{1,3})\s*,\s*(\d{1,3})\s*,\s*(\d{1,3})\s*(?:,\s*(\d?(?:\.\d+)?)\s*)?\)/,parse:function(e){return[e[1],e[2],e[3],e[4]]}},{re:/rgba?\(\s*(\d+(?:\.\d+)?)\%\s*,\s*(\d+(?:\.\d+)?)\%\s*,\s*(\d+(?:\.\d+)?)\%\s*(?:,\s*(\d?(?:\.\d+)?)\s*)?\)/,parse:function(e){return[2.55*e[1],2.55*e[2],2.55*e[3],e[4]]}},{re:/#([a-f0-9]{2})([a-f0-9]{2})([a-f0-9]{2})/,parse:function(e){return[parseInt(e[1],16),parseInt(e[2],16),parseInt(e[3],16)]}},{re:/#([a-f0-9])([a-f0-9])([a-f0-9])/,parse:function(e){return[parseInt(e[1]+e[1],16),parseInt(e[2]+e[2],16),parseInt(e[3]+e[3],16)]}},{re:/hsla?\(\s*(\d+(?:\.\d+)?)\s*,\s*(\d+(?:\.\d+)?)\%\s*,\s*(\d+(?:\.\d+)?)\%\s*(?:,\s*(\d?(?:\.\d+)?)\s*)?\)/,space:"hsla",parse:function(e){return[e[1],e[2]/100,e[3]/100,e[4]]}}],u=e.Color=function(t,i,n,s){return new e.Color.fn.parse(t,i,n,s)},c={rgba:{props:{red:{idx:0,type:"byte"},green:{idx:1,type:"byte"},blue:{idx:2,type:"byte"}}},hsla:{props:{hue:{idx:0,type:"degrees"},saturation:{idx:1,type:"percent"},lightness:{idx:2,type:"percent"}}}},h={"byte":{floor:!0,max:255},percent:{max:1},degrees:{mod:360,floor:!0}},d=u.support={},p=e("<p>")[0],f=e.each;p.style.cssText="background-color:rgba(1,1,1,.5)",d.rgba=p.style.backgroundColor.indexOf("rgba")>-1,f(c,function(e,t){t.cache="_"+e,t.props.alpha={idx:3,type:"percent",def:1}}),u.fn=e.extend(u.prototype,{parse:function(s,a,r,l){if(s===t)return this._rgba=[null,null,null,null],this;(s.jquery||s.nodeType)&&(s=e(s).css(a),a=t);var h=this,d=e.type(s),p=this._rgba=[];return a!==t&&(s=[s,a,r,l],d="array"),"string"===d?this.parse(n(s)||o._default):"array"===d?(f(c.rgba.props,function(e,t){p[t.idx]=i(s[t.idx],t)}),this):"object"===d?(s instanceof u?f(c,function(e,t){s[t.cache]&&(h[t.cache]=s[t.cache].slice())}):f(c,function(t,n){var o=n.cache;f(n.props,function(e,t){if(!h[o]&&n.to){if("alpha"===e||null==s[e])return;h[o]=n.to(h._rgba)}h[o][t.idx]=i(s[e],t,!0)}),h[o]&&e.inArray(null,h[o].slice(0,3))<0&&(h[o][3]=1,n.from&&(h._rgba=n.from(h[o])))}),this):void 0},is:function(e){var t=u(e),i=!0,n=this;return f(c,function(e,s){var o,a=t[s.cache];return a&&(o=n[s.cache]||s.to&&s.to(n._rgba)||[],f(s.props,function(e,t){return null!=a[t.idx]?i=a[t.idx]===o[t.idx]:void 0})),i}),i},_space:function(){var e=[],t=this;return f(c,function(i,n){t[n.cache]&&e.push(i)}),e.pop()},transition:function(e,t){var n=u(e),s=n._space(),o=c[s],a=0===this.alpha()?u("transparent"):this,r=a[o.cache]||o.to(a._rgba),l=r.slice();return n=n[o.cache],f(o.props,function(e,s){var o=s.idx,a=r[o],u=n[o],c=h[s.type]||{};null!==u&&(null===a?l[o]=u:(c.mod&&(u-a>c.mod/2?a+=c.mod:a-u>c.mod/2&&(a-=c.mod)),l[o]=i((u-a)*t+a,s)))}),this[s](l)},blend:function(t){if(1===this._rgba[3])return this;var i=this._rgba.slice(),n=i.pop(),s=u(t)._rgba;return u(e.map(i,function(e,t){return(1-n)*s[t]+n*e}))},toRgbaString:function(){var t="rgba(",i=e.map(this._rgba,function(e,t){return null==e?t>2?1:0:e});return 1===i[3]&&(i.pop(),t="rgb("),t+i.join()+")"},toHslaString:function(){var t="hsla(",i=e.map(this.hsla(),function(e,t){return null==e&&(e=t>2?1:0),t&&3>t&&(e=Math.round(100*e)+"%"),e});return 1===i[3]&&(i.pop(),t="hsl("),t+i.join()+")"},toHexString:function(t){var i=this._rgba.slice(),n=i.pop();return t&&i.push(~~(255*n)),"#"+e.map(i,function(e){return e=(e||0).toString(16),1===e.length?"0"+e:e}).join("")},toString:function(){return 0===this._rgba[3]?"transparent":this.toRgbaString()}}),u.fn.parse.prototype=u.fn,c.hsla.to=function(e){if(null==e[0]||null==e[1]||null==e[2])return[null,null,null,e[3]];var t,i,n=e[0]/255,s=e[1]/255,o=e[2]/255,a=e[3],r=Math.max(n,s,o),l=Math.min(n,s,o),u=r-l,c=r+l,h=.5*c;return t=l===r?0:n===r?60*(s-o)/u+360:s===r?60*(o-n)/u+120:60*(n-s)/u+240,i=0===u?0:.5>=h?u/c:u/(2-c),[Math.round(t)%360,i,h,null==a?1:a]},c.hsla.from=function(e){if(null==e[0]||null==e[1]||null==e[2])return[null,null,null,e[3]];var t=e[0]/360,i=e[1],n=e[2],o=e[3],a=.5>=n?n*(1+i):n+i-n*i,r=2*n-a;return[Math.round(255*s(r,a,t+1/3)),Math.round(255*s(r,a,t)),Math.round(255*s(r,a,t-1/3)),o]},f(c,function(n,s){var o=s.props,a=s.cache,l=s.to,c=s.from;u.fn[n]=function(n){if(l&&!this[a]&&(this[a]=l(this._rgba)),n===t)return this[a].slice();var s,r=e.type(n),h="array"===r||"object"===r?n:arguments,d=this[a].slice();return f(o,function(e,t){var n=h["object"===r?e:t.idx];null==n&&(n=d[t.idx]),d[t.idx]=i(n,t)}),c?(s=u(c(d)),s[a]=d,s):u(d)},f(o,function(t,i){u.fn[t]||(u.fn[t]=function(s){var o,a=e.type(s),l="alpha"===t?this._hsla?"hsla":"rgba":n,u=this[l](),c=u[i.idx];return"undefined"===a?c:("function"===a&&(s=s.call(this,c),a=e.type(s)),null==s&&i.empty?this:("string"===a&&(o=r.exec(s),o&&(s=c+parseFloat(o[2])*("+"===o[1]?1:-1))),u[i.idx]=s,this[l](u)))})})}),u.hook=function(t){var i=t.split(" ");f(i,function(t,i){e.cssHooks[i]={set:function(t,s){var o,a,r="";if("transparent"!==s&&("string"!==e.type(s)||(o=n(s)))){if(s=u(o||s),!d.rgba&&1!==s._rgba[3]){for(a="backgroundColor"===i?t.parentNode:t;(""===r||"transparent"===r)&&a&&a.style;)try{r=e.css(a,"backgroundColor"),a=a.parentNode}catch(l){}s=s.blend(r&&"transparent"!==r?r:"_default")}s=s.toRgbaString()}try{t.style[i]=s}catch(l){}}},e.fx.step[i]=function(t){t.colorInit||(t.start=u(t.elem,i),t.end=u(t.end),t.colorInit=!0),e.cssHooks[i].set(t.elem,t.start.transition(t.end,t.pos))}})},u.hook(a),e.cssHooks.borderColor={expand:function(e){var t={};return f(["Top","Right","Bottom","Left"],function(i,n){t["border"+n+"Color"]=e}),t}},o=e.Color.names={aqua:"#00ffff",black:"#000000",blue:"#0000ff",fuchsia:"#ff00ff",gray:"#808080",green:"#008000",lime:"#00ff00",maroon:"#800000",navy:"#000080",olive:"#808000",purple:"#800080",red:"#ff0000",silver:"#c0c0c0",teal:"#008080",white:"#ffffff",yellow:"#ffff00",transparent:[null,null,null,0],_default:"#ffffff"}}(jQuery),function(){function i(t){var i,n,s=t.ownerDocument.defaultView?t.ownerDocument.defaultView.getComputedStyle(t,null):t.currentStyle,o={};if(s&&s.length&&s[0]&&s[s[0]])for(n=s.length;n--;)i=s[n],"string"==typeof s[i]&&(o[e.camelCase(i)]=s[i]);else for(i in s)"string"==typeof s[i]&&(o[i]=s[i]);return o}function n(t,i){var n,s,a={};for(n in i)s=i[n],t[n]!==s&&(o[n]||(e.fx.step[n]||!isNaN(parseFloat(s)))&&(a[n]=s));return a}var s=["add","remove","toggle"],o={border:1,borderBottom:1,borderColor:1,borderLeft:1,borderRight:1,borderTop:1,borderWidth:1,margin:1,padding:1};e.each(["borderLeftStyle","borderRightStyle","borderBottomStyle","borderTopStyle"],function(t,i){e.fx.step[i]=function(e){("none"!==e.end&&!e.setAttr||1===e.pos&&!e.setAttr)&&(jQuery.style(e.elem,i,e.end),e.setAttr=!0)}}),e.fn.addBack||(e.fn.addBack=function(e){return this.add(null==e?this.prevObject:this.prevObject.filter(e))}),e.effects.animateClass=function(t,o,a,r){var l=e.speed(o,a,r);return this.queue(function(){var o,a=e(this),r=a.attr("class")||"",u=l.children?a.find("*").addBack():a;u=u.map(function(){var t=e(this);return{el:t,start:i(this)}}),o=function(){e.each(s,function(e,i){t[i]&&a[i+"Class"](t[i])})},o(),u=u.map(function(){return this.end=i(this.el[0]),this.diff=n(this.start,this.end),this}),a.attr("class",r),u=u.map(function(){var t=this,i=e.Deferred(),n=e.extend({},l,{queue:!1,complete:function(){i.resolve(t)}});return this.el.animate(this.diff,n),i.promise()}),e.when.apply(e,u.get()).done(function(){o(),e.each(arguments,function(){var t=this.el;e.each(this.diff,function(e){t.css(e,"")})}),l.complete.call(a[0])})})},e.fn.extend({addClass:function(t){return function(i,n,s,o){return n?e.effects.animateClass.call(this,{add:i},n,s,o):t.apply(this,arguments)}}(e.fn.addClass),removeClass:function(t){return function(i,n,s,o){return arguments.length>1?e.effects.animateClass.call(this,{remove:i},n,s,o):t.apply(this,arguments)}}(e.fn.removeClass),toggleClass:function(i){return function(n,s,o,a,r){return"boolean"==typeof s||s===t?o?e.effects.animateClass.call(this,s?{add:n}:{remove:n},o,a,r):i.apply(this,arguments):e.effects.animateClass.call(this,{toggle:n},s,o,a)}}(e.fn.toggleClass),switchClass:function(t,i,n,s,o){return e.effects.animateClass.call(this,{add:i,remove:t},n,s,o)}})}(),function(){function n(t,i,n,s){return e.isPlainObject(t)&&(i=t,t=t.effect),t={effect:t},null==i&&(i={}),e.isFunction(i)&&(s=i,n=null,i={}),("number"==typeof i||e.fx.speeds[i])&&(s=n,n=i,i={}),e.isFunction(n)&&(s=n,n=null),i&&e.extend(t,i),n=n||i.duration,t.duration=e.fx.off?0:"number"==typeof n?n:n in e.fx.speeds?e.fx.speeds[n]:e.fx.speeds._default,t.complete=s||i.complete,t}function s(t){return!t||"number"==typeof t||e.fx.speeds[t]?!0:"string"!=typeof t||e.effects.effect[t]?e.isFunction(t)?!0:"object"!=typeof t||t.effect?!1:!0:!0}e.extend(e.effects,{version:"1.10.3",save:function(e,t){for(var n=0;n<t.length;n++)null!==t[n]&&e.data(i+t[n],e[0].style[t[n]])},restore:function(e,n){var s,o;for(o=0;o<n.length;o++)null!==n[o]&&(s=e.data(i+n[o]),s===t&&(s=""),e.css(n[o],s))},setMode:function(e,t){return"toggle"===t&&(t=e.is(":hidden")?"show":"hide"),t},getBaseline:function(e,t){var i,n;switch(e[0]){case"top":i=0;break;case"middle":i=.5;break;case"bottom":i=1;break;default:i=e[0]/t.height}switch(e[1]){case"left":n=0;break;case"center":n=.5;break;case"right":n=1;break;default:n=e[1]/t.width}return{x:n,y:i}},createWrapper:function(t){if(t.parent().is(".ui-effects-wrapper"))return t.parent();var i={width:t.outerWidth(!0),height:t.outerHeight(!0),"float":t.css("float")},n=e("<div></div>").addClass("ui-effects-wrapper").css({fontSize:"100%",background:"transparent",border:"none",margin:0,padding:0}),s={width:t.width(),height:t.height()},o=document.activeElement;try{o.id}catch(a){o=document.body}return t.wrap(n),(t[0]===o||e.contains(t[0],o))&&e(o).focus(),n=t.parent(),"static"===t.css("position")?(n.css({position:"relative"}),t.css({position:"relative"})):(e.extend(i,{position:t.css("position"),zIndex:t.css("z-index")}),e.each(["top","left","bottom","right"],function(e,n){i[n]=t.css(n),isNaN(parseInt(i[n],10))&&(i[n]="auto")}),t.css({position:"relative",top:0,left:0,right:"auto",bottom:"auto"})),t.css(s),n.css(i).show()},removeWrapper:function(t){var i=document.activeElement;return t.parent().is(".ui-effects-wrapper")&&(t.parent().replaceWith(t),(t[0]===i||e.contains(t[0],i))&&e(i).focus()),t},setTransition:function(t,i,n,s){return s=s||{},e.each(i,function(e,i){var o=t.cssUnit(i);o[0]>0&&(s[i]=o[0]*n+o[1])}),s}}),e.fn.extend({effect:function(){function t(t){function n(){e.isFunction(o)&&o.call(s[0]),e.isFunction(t)&&t()}var s=e(this),o=i.complete,r=i.mode;(s.is(":hidden")?"hide"===r:"show"===r)?(s[r](),n()):a.call(s[0],i,n)}var i=n.apply(this,arguments),s=i.mode,o=i.queue,a=e.effects.effect[i.effect];return e.fx.off||!a?s?this[s](i.duration,i.complete):this.each(function(){i.complete&&i.complete.call(this)}):o===!1?this.each(t):this.queue(o||"fx",t)},show:function(e){return function(t){if(s(t))return e.apply(this,arguments);var i=n.apply(this,arguments);return i.mode="show",this.effect.call(this,i)}}(e.fn.show),hide:function(e){return function(t){if(s(t))return e.apply(this,arguments);var i=n.apply(this,arguments);return i.mode="hide",this.effect.call(this,i)}}(e.fn.hide),toggle:function(e){return function(t){if(s(t)||"boolean"==typeof t)return e.apply(this,arguments);var i=n.apply(this,arguments);return i.mode="toggle",this.effect.call(this,i)}}(e.fn.toggle),cssUnit:function(t){var i=this.css(t),n=[];return e.each(["em","px","%","pt"],function(e,t){i.indexOf(t)>0&&(n=[parseFloat(i),t])}),n}})}(),function(){var t={};e.each(["Quad","Cubic","Quart","Quint","Expo"],function(e,i){t[i]=function(t){return Math.pow(t,e+2)}}),e.extend(t,{Sine:function(e){return 1-Math.cos(e*Math.PI/2)},Circ:function(e){return 1-Math.sqrt(1-e*e)},Elastic:function(e){return 0===e||1===e?e:-Math.pow(2,8*(e-1))*Math.sin((80*(e-1)-7.5)*Math.PI/15)},Back:function(e){return e*e*(3*e-2)},Bounce:function(e){for(var t,i=4;e<((t=Math.pow(2,--i))-1)/11;);return 1/Math.pow(4,3-i)-7.5625*Math.pow((3*t-2)/22-e,2)}}),e.each(t,function(t,i){e.easing["easeIn"+t]=i,e.easing["easeOut"+t]=function(e){return 1-i(1-e)},e.easing["easeInOut"+t]=function(e){return.5>e?i(2*e)/2:1-i(-2*e+2)/2}})}()}(jQuery),/*!
 * jQuery UI Effects Blind 1.10.3
 * http://jqueryui.com
 *
 * Copyright 2013 jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 *
 * http://api.jqueryui.com/blind-effect/
 *
 * Depends:
 *	jquery.ui.effect.js
 */
function(e){var t=/up|down|vertical/,i=/up|left|vertical|horizontal/;e.effects.effect.blind=function(n,s){var o,a,r,l=e(this),u=["position","top","bottom","left","right","height","width"],c=e.effects.setMode(l,n.mode||"hide"),h=n.direction||"up",d=t.test(h),p=d?"height":"width",f=d?"top":"left",m=i.test(h),g={},v="show"===c;l.parent().is(".ui-effects-wrapper")?e.effects.save(l.parent(),u):e.effects.save(l,u),l.show(),o=e.effects.createWrapper(l).css({overflow:"hidden"}),a=o[p](),r=parseFloat(o.css(f))||0,g[p]=v?a:0,m||(l.css(d?"bottom":"right",0).css(d?"top":"left","auto").css({position:"absolute"}),g[f]=v?r:a+r),v&&(o.css(p,0),m||o.css(f,r+a)),o.animate(g,{duration:n.duration,easing:n.easing,queue:!1,complete:function(){"hide"===c&&l.hide(),e.effects.restore(l,u),e.effects.removeWrapper(l),s()}})}}(jQuery),/*!
 * jQuery UI Effects Bounce 1.10.3
 * http://jqueryui.com
 *
 * Copyright 2013 jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 *
 * http://api.jqueryui.com/bounce-effect/
 *
 * Depends:
 *	jquery.ui.effect.js
 */
function(e){e.effects.effect.bounce=function(t,i){var n,s,o,a=e(this),r=["position","top","bottom","left","right","height","width"],l=e.effects.setMode(a,t.mode||"effect"),u="hide"===l,c="show"===l,h=t.direction||"up",d=t.distance,p=t.times||5,f=2*p+(c||u?1:0),m=t.duration/f,g=t.easing,v="up"===h||"down"===h?"top":"left",b="up"===h||"left"===h,y=a.queue(),_=y.length;for((c||u)&&r.push("opacity"),e.effects.save(a,r),a.show(),e.effects.createWrapper(a),d||(d=a["top"===v?"outerHeight":"outerWidth"]()/3),c&&(o={opacity:1},o[v]=0,a.css("opacity",0).css(v,b?2*-d:2*d).animate(o,m,g)),u&&(d/=Math.pow(2,p-1)),o={},o[v]=0,n=0;p>n;n++)s={},s[v]=(b?"-=":"+=")+d,a.animate(s,m,g).animate(o,m,g),d=u?2*d:d/2;u&&(s={opacity:0},s[v]=(b?"-=":"+=")+d,a.animate(s,m,g)),a.queue(function(){u&&a.hide(),e.effects.restore(a,r),e.effects.removeWrapper(a),i()}),_>1&&y.splice.apply(y,[1,0].concat(y.splice(_,f+1))),a.dequeue()}}(jQuery),/*!
 * jQuery UI Effects Clip 1.10.3
 * http://jqueryui.com
 *
 * Copyright 2013 jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 *
 * http://api.jqueryui.com/clip-effect/
 *
 * Depends:
 *	jquery.ui.effect.js
 */
function(e){e.effects.effect.clip=function(t,i){var n,s,o,a=e(this),r=["position","top","bottom","left","right","height","width"],l=e.effects.setMode(a,t.mode||"hide"),u="show"===l,c=t.direction||"vertical",h="vertical"===c,d=h?"height":"width",p=h?"top":"left",f={};e.effects.save(a,r),a.show(),n=e.effects.createWrapper(a).css({overflow:"hidden"}),s="IMG"===a[0].tagName?n:a,o=s[d](),u&&(s.css(d,0),s.css(p,o/2)),f[d]=u?o:0,f[p]=u?0:o/2,s.animate(f,{queue:!1,duration:t.duration,easing:t.easing,complete:function(){u||a.hide(),e.effects.restore(a,r),e.effects.removeWrapper(a),i()}})}}(jQuery),/*!
 * jQuery UI Effects Drop 1.10.3
 * http://jqueryui.com
 *
 * Copyright 2013 jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 *
 * http://api.jqueryui.com/drop-effect/
 *
 * Depends:
 *	jquery.ui.effect.js
 */
function(e){e.effects.effect.drop=function(t,i){var n,s=e(this),o=["position","top","bottom","left","right","opacity","height","width"],a=e.effects.setMode(s,t.mode||"hide"),r="show"===a,l=t.direction||"left",u="up"===l||"down"===l?"top":"left",c="up"===l||"left"===l?"pos":"neg",h={opacity:r?1:0};e.effects.save(s,o),s.show(),e.effects.createWrapper(s),n=t.distance||s["top"===u?"outerHeight":"outerWidth"](!0)/2,r&&s.css("opacity",0).css(u,"pos"===c?-n:n),h[u]=(r?"pos"===c?"+=":"-=":"pos"===c?"-=":"+=")+n,s.animate(h,{queue:!1,duration:t.duration,easing:t.easing,complete:function(){"hide"===a&&s.hide(),e.effects.restore(s,o),e.effects.removeWrapper(s),i()}})}}(jQuery),/*!
 * jQuery UI Effects Explode 1.10.3
 * http://jqueryui.com
 *
 * Copyright 2013 jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 *
 * http://api.jqueryui.com/explode-effect/
 *
 * Depends:
 *	jquery.ui.effect.js
 */
function(e){e.effects.effect.explode=function(t,i){function n(){y.push(this),y.length===h*d&&s()}function s(){p.css({visibility:"visible"}),e(y).remove(),m||p.hide(),i()}var o,a,r,l,u,c,h=t.pieces?Math.round(Math.sqrt(t.pieces)):3,d=h,p=e(this),f=e.effects.setMode(p,t.mode||"hide"),m="show"===f,g=p.show().css("visibility","hidden").offset(),v=Math.ceil(p.outerWidth()/d),b=Math.ceil(p.outerHeight()/h),y=[];for(o=0;h>o;o++)for(l=g.top+o*b,c=o-(h-1)/2,a=0;d>a;a++)r=g.left+a*v,u=a-(d-1)/2,p.clone().appendTo("body").wrap("<div></div>").css({position:"absolute",visibility:"visible",left:-a*v,top:-o*b}).parent().addClass("ui-effects-explode").css({position:"absolute",overflow:"hidden",width:v,height:b,left:r+(m?u*v:0),top:l+(m?c*b:0),opacity:m?0:1}).animate({left:r+(m?0:u*v),top:l+(m?0:c*b),opacity:m?1:0},t.duration||500,t.easing,n)}}(jQuery),/*!
 * jQuery UI Effects Fade 1.10.3
 * http://jqueryui.com
 *
 * Copyright 2013 jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 *
 * http://api.jqueryui.com/fade-effect/
 *
 * Depends:
 *	jquery.ui.effect.js
 */
function(e){e.effects.effect.fade=function(t,i){var n=e(this),s=e.effects.setMode(n,t.mode||"toggle");n.animate({opacity:s},{queue:!1,duration:t.duration,easing:t.easing,complete:i})}}(jQuery),/*!
 * jQuery UI Effects Fold 1.10.3
 * http://jqueryui.com
 *
 * Copyright 2013 jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 *
 * http://api.jqueryui.com/fold-effect/
 *
 * Depends:
 *	jquery.ui.effect.js
 */
function(e){e.effects.effect.fold=function(t,i){var n,s,o=e(this),a=["position","top","bottom","left","right","height","width"],r=e.effects.setMode(o,t.mode||"hide"),l="show"===r,u="hide"===r,c=t.size||15,h=/([0-9]+)%/.exec(c),d=!!t.horizFirst,p=l!==d,f=p?["width","height"]:["height","width"],m=t.duration/2,g={},v={};e.effects.save(o,a),o.show(),n=e.effects.createWrapper(o).css({overflow:"hidden"}),s=p?[n.width(),n.height()]:[n.height(),n.width()],h&&(c=parseInt(h[1],10)/100*s[u?0:1]),l&&n.css(d?{height:0,width:c}:{height:c,width:0}),g[f[0]]=l?s[0]:c,v[f[1]]=l?s[1]:0,n.animate(g,m,t.easing).animate(v,m,t.easing,function(){u&&o.hide(),e.effects.restore(o,a),e.effects.removeWrapper(o),i()})}}(jQuery),/*!
 * jQuery UI Effects Highlight 1.10.3
 * http://jqueryui.com
 *
 * Copyright 2013 jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 *
 * http://api.jqueryui.com/highlight-effect/
 *
 * Depends:
 *	jquery.ui.effect.js
 */
function(e){e.effects.effect.highlight=function(t,i){var n=e(this),s=["backgroundImage","backgroundColor","opacity"],o=e.effects.setMode(n,t.mode||"show"),a={backgroundColor:n.css("backgroundColor")};"hide"===o&&(a.opacity=0),e.effects.save(n,s),n.show().css({backgroundImage:"none",backgroundColor:t.color||"#ffff99"}).animate(a,{queue:!1,duration:t.duration,easing:t.easing,complete:function(){"hide"===o&&n.hide(),e.effects.restore(n,s),i()}})}}(jQuery),/*!
 * jQuery UI Effects Pulsate 1.10.3
 * http://jqueryui.com
 *
 * Copyright 2013 jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 *
 * http://api.jqueryui.com/pulsate-effect/
 *
 * Depends:
 *	jquery.ui.effect.js
 */
function(e){e.effects.effect.pulsate=function(t,i){var n,s=e(this),o=e.effects.setMode(s,t.mode||"show"),a="show"===o,r="hide"===o,l=a||"hide"===o,u=2*(t.times||5)+(l?1:0),c=t.duration/u,h=0,d=s.queue(),p=d.length;for((a||!s.is(":visible"))&&(s.css("opacity",0).show(),h=1),n=1;u>n;n++)s.animate({opacity:h},c,t.easing),h=1-h;s.animate({opacity:h},c,t.easing),s.queue(function(){r&&s.hide(),i()}),p>1&&d.splice.apply(d,[1,0].concat(d.splice(p,u+1))),s.dequeue()}}(jQuery),/*!
 * jQuery UI Effects Scale 1.10.3
 * http://jqueryui.com
 *
 * Copyright 2013 jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 *
 * http://api.jqueryui.com/scale-effect/
 *
 * Depends:
 *	jquery.ui.effect.js
 */
function(e){e.effects.effect.puff=function(t,i){var n=e(this),s=e.effects.setMode(n,t.mode||"hide"),o="hide"===s,a=parseInt(t.percent,10)||150,r=a/100,l={height:n.height(),width:n.width(),outerHeight:n.outerHeight(),outerWidth:n.outerWidth()};e.extend(t,{effect:"scale",queue:!1,fade:!0,mode:s,complete:i,percent:o?a:100,from:o?l:{height:l.height*r,width:l.width*r,outerHeight:l.outerHeight*r,outerWidth:l.outerWidth*r}}),n.effect(t)},e.effects.effect.scale=function(t,i){var n=e(this),s=e.extend(!0,{},t),o=e.effects.setMode(n,t.mode||"effect"),a=parseInt(t.percent,10)||(0===parseInt(t.percent,10)?0:"hide"===o?0:100),r=t.direction||"both",l=t.origin,u={height:n.height(),width:n.width(),outerHeight:n.outerHeight(),outerWidth:n.outerWidth()},c={y:"horizontal"!==r?a/100:1,x:"vertical"!==r?a/100:1};s.effect="size",s.queue=!1,s.complete=i,"effect"!==o&&(s.origin=l||["middle","center"],s.restore=!0),s.from=t.from||("show"===o?{height:0,width:0,outerHeight:0,outerWidth:0}:u),s.to={height:u.height*c.y,width:u.width*c.x,outerHeight:u.outerHeight*c.y,outerWidth:u.outerWidth*c.x},s.fade&&("show"===o&&(s.from.opacity=0,s.to.opacity=1),"hide"===o&&(s.from.opacity=1,s.to.opacity=0)),n.effect(s)},e.effects.effect.size=function(t,i){var n,s,o,a=e(this),r=["position","top","bottom","left","right","width","height","overflow","opacity"],l=["position","top","bottom","left","right","overflow","opacity"],u=["width","height","overflow"],c=["fontSize"],h=["borderTopWidth","borderBottomWidth","paddingTop","paddingBottom"],d=["borderLeftWidth","borderRightWidth","paddingLeft","paddingRight"],p=e.effects.setMode(a,t.mode||"effect"),f=t.restore||"effect"!==p,m=t.scale||"both",g=t.origin||["middle","center"],v=a.css("position"),b=f?r:l,y={height:0,width:0,outerHeight:0,outerWidth:0};"show"===p&&a.show(),n={height:a.height(),width:a.width(),outerHeight:a.outerHeight(),outerWidth:a.outerWidth()},"toggle"===t.mode&&"show"===p?(a.from=t.to||y,a.to=t.from||n):(a.from=t.from||("show"===p?y:n),a.to=t.to||("hide"===p?y:n)),o={from:{y:a.from.height/n.height,x:a.from.width/n.width},to:{y:a.to.height/n.height,x:a.to.width/n.width}},("box"===m||"both"===m)&&(o.from.y!==o.to.y&&(b=b.concat(h),a.from=e.effects.setTransition(a,h,o.from.y,a.from),a.to=e.effects.setTransition(a,h,o.to.y,a.to)),o.from.x!==o.to.x&&(b=b.concat(d),a.from=e.effects.setTransition(a,d,o.from.x,a.from),a.to=e.effects.setTransition(a,d,o.to.x,a.to))),("content"===m||"both"===m)&&o.from.y!==o.to.y&&(b=b.concat(c).concat(u),a.from=e.effects.setTransition(a,c,o.from.y,a.from),a.to=e.effects.setTransition(a,c,o.to.y,a.to)),e.effects.save(a,b),a.show(),e.effects.createWrapper(a),a.css("overflow","hidden").css(a.from),g&&(s=e.effects.getBaseline(g,n),a.from.top=(n.outerHeight-a.outerHeight())*s.y,a.from.left=(n.outerWidth-a.outerWidth())*s.x,a.to.top=(n.outerHeight-a.to.outerHeight)*s.y,a.to.left=(n.outerWidth-a.to.outerWidth)*s.x),a.css(a.from),("content"===m||"both"===m)&&(h=h.concat(["marginTop","marginBottom"]).concat(c),d=d.concat(["marginLeft","marginRight"]),u=r.concat(h).concat(d),a.find("*[width]").each(function(){var i=e(this),n={height:i.height(),width:i.width(),outerHeight:i.outerHeight(),outerWidth:i.outerWidth()};f&&e.effects.save(i,u),i.from={height:n.height*o.from.y,width:n.width*o.from.x,outerHeight:n.outerHeight*o.from.y,outerWidth:n.outerWidth*o.from.x},i.to={height:n.height*o.to.y,width:n.width*o.to.x,outerHeight:n.height*o.to.y,outerWidth:n.width*o.to.x},o.from.y!==o.to.y&&(i.from=e.effects.setTransition(i,h,o.from.y,i.from),i.to=e.effects.setTransition(i,h,o.to.y,i.to)),o.from.x!==o.to.x&&(i.from=e.effects.setTransition(i,d,o.from.x,i.from),i.to=e.effects.setTransition(i,d,o.to.x,i.to)),i.css(i.from),i.animate(i.to,t.duration,t.easing,function(){f&&e.effects.restore(i,u)})})),a.animate(a.to,{queue:!1,duration:t.duration,easing:t.easing,complete:function(){0===a.to.opacity&&a.css("opacity",a.from.opacity),"hide"===p&&a.hide(),e.effects.restore(a,b),f||("static"===v?a.css({position:"relative",top:a.to.top,left:a.to.left}):e.each(["top","left"],function(e,t){a.css(t,function(t,i){var n=parseInt(i,10),s=e?a.to.left:a.to.top;return"auto"===i?s+"px":n+s+"px"})})),e.effects.removeWrapper(a),i()}})}}(jQuery),/*!
 * jQuery UI Effects Shake 1.10.3
 * http://jqueryui.com
 *
 * Copyright 2013 jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 *
 * http://api.jqueryui.com/shake-effect/
 *
 * Depends:
 *	jquery.ui.effect.js
 */
function(e){e.effects.effect.shake=function(t,i){var n,s=e(this),o=["position","top","bottom","left","right","height","width"],a=e.effects.setMode(s,t.mode||"effect"),r=t.direction||"left",l=t.distance||20,u=t.times||3,c=2*u+1,h=Math.round(t.duration/c),d="up"===r||"down"===r?"top":"left",p="up"===r||"left"===r,f={},m={},g={},v=s.queue(),b=v.length;for(e.effects.save(s,o),s.show(),e.effects.createWrapper(s),f[d]=(p?"-=":"+=")+l,m[d]=(p?"+=":"-=")+2*l,g[d]=(p?"-=":"+=")+2*l,s.animate(f,h,t.easing),n=1;u>n;n++)s.animate(m,h,t.easing).animate(g,h,t.easing);s.animate(m,h,t.easing).animate(f,h/2,t.easing).queue(function(){"hide"===a&&s.hide(),e.effects.restore(s,o),e.effects.removeWrapper(s),i()}),b>1&&v.splice.apply(v,[1,0].concat(v.splice(b,c+1))),s.dequeue()}}(jQuery),/*!
 * jQuery UI Effects Slide 1.10.3
 * http://jqueryui.com
 *
 * Copyright 2013 jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 *
 * http://api.jqueryui.com/slide-effect/
 *
 * Depends:
 *	jquery.ui.effect.js
 */
function(e){e.effects.effect.slide=function(t,i){var n,s=e(this),o=["position","top","bottom","left","right","width","height"],a=e.effects.setMode(s,t.mode||"show"),r="show"===a,l=t.direction||"left",u="up"===l||"down"===l?"top":"left",c="up"===l||"left"===l,h={};e.effects.save(s,o),s.show(),n=t.distance||s["top"===u?"outerHeight":"outerWidth"](!0),e.effects.createWrapper(s).css({overflow:"hidden"}),r&&s.css(u,c?isNaN(n)?"-"+n:-n:n),h[u]=(r?c?"+=":"-=":c?"-=":"+=")+n,s.animate(h,{queue:!1,duration:t.duration,easing:t.easing,complete:function(){"hide"===a&&s.hide(),e.effects.restore(s,o),e.effects.removeWrapper(s),i()}})}}(jQuery),/*!
 * jQuery UI Effects Transfer 1.10.3
 * http://jqueryui.com
 *
 * Copyright 2013 jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 *
 * http://api.jqueryui.com/transfer-effect/
 *
 * Depends:
 *	jquery.ui.effect.js
 */
function(e){e.effects.effect.transfer=function(t,i){var n=e(this),s=e(t.to),o="fixed"===s.css("position"),a=e("body"),r=o?a.scrollTop():0,l=o?a.scrollLeft():0,u=s.offset(),c={top:u.top-r,left:u.left-l,height:s.innerHeight(),width:s.innerWidth()},h=n.offset(),d=e("<div class='ui-effects-transfer'></div>").appendTo(document.body).addClass(t.className).css({top:h.top-r,left:h.left-l,height:n.innerHeight(),width:n.innerWidth(),position:o?"fixed":"absolute"}).animate(c,t.duration,t.easing,function(){d.remove(),i()})}}(jQuery);