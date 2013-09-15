/* ========================================================
 * bootstrap-tab.js v2.3.1
 * http://twitter.github.com/bootstrap/javascript.html#tabs
 * ========================================================
 * Copyright 2012 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ======================================================== */
!function(e){"use strict";var t=function(t){this.element=e(t)};t.prototype={constructor:t,show:function(){var t,i,n,s=this.element,o=s.closest("ul:not(.dropdown-menu)"),r=s.attr("data-target");r||(r=s.attr("href"),r=r&&r.replace(/.*(?=#[^\s]*$)/,"")),s.parent("li").hasClass("active")||(t=o.find(".active:last a")[0],n=e.Event("show",{relatedTarget:t}),s.trigger(n),n.isDefaultPrevented()||(i=e(r),this.activate(s.parent("li"),o),this.activate(i,i.parent(),function(){s.trigger({type:"shown",relatedTarget:t})})))},activate:function(t,i,n){function s(){o.removeClass("active").find("> .dropdown-menu > .active").removeClass("active"),t.addClass("active"),r?(t[0].offsetWidth,t.addClass("in")):t.removeClass("fade"),t.parent(".dropdown-menu")&&t.closest("li.dropdown").addClass("active"),n&&n()}var o=i.find("> .active"),r=n&&e.support.transition&&o.hasClass("fade");r?o.one(e.support.transition.end,s):s(),o.removeClass("in")}};var i=e.fn.tab;e.fn.tab=function(i){return this.each(function(){var n=e(this),s=n.data("tab");s||n.data("tab",s=new t(this)),"string"==typeof i&&s[i]()})},e.fn.tab.Constructor=t,e.fn.tab.noConflict=function(){return e.fn.tab=i,this},e(document).on("click.tab.data-api",'[data-toggle="tab"], [data-toggle="pill"]',function(t){t.preventDefault(),e(this).tab("show")})}(window.jQuery);