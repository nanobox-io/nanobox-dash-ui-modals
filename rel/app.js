!function t(n,o,i){function e(s,d){if(!o[s]){if(!n[s]){var c="function"==typeof require&&require;if(!d&&c)return c(s,!0);if(a)return a(s,!0);var l=new Error("Cannot find module '"+s+"'");throw l.code="MODULE_NOT_FOUND",l}var r=o[s]={exports:{}};n[s][0].call(r.exports,function(t){var o=n[s][1][t];return e(o?o:t)},r,r.exports,t,n,o,i)}return o[s].exports}for(var a="function"==typeof require&&require,s=0;s<i.length;s++)e(i[s]);return e}({1:[function(t,n,o){var i,e,a,s,d,c=function(t,n){return function(){return t.apply(n,arguments)}};a=t("modals/delete-verification-modal"),e=t("modals/delete-confirmation-modal"),i=t("modals/action-confirmation-modal"),d=t("modals/upgrade-required-modal"),s=function(){function t(t){this.$body=t,this.submit=c(this.submit,this),this.hide=c(this.hide,this),this.show=c(this.show,this),this.load=c(this.load,this),this.$shield=$('<div id="modalshield" class="shield" style="opacity:0;"></div>'),this.$modal=$('<div id="nanobox-dash-ui-modal" style="opacity:0;"> <div class="close"> <img class="shadow-icon" data-source="close-x"/> </div> </div>'),this.$modal.find(".close").click(function(t){return function(n){return t.hide()}}(this)),this.$shield.click(function(t){return function(n){return t.hide()}}(this))}return t.prototype.load=function(t){var n;return this.options=null!=t?t:{},this.$modal.empty(),n=function(){switch(this.options.modal){case"delete-verification-modal":return new a(this.$modal,this.options,this);case"delete-confirmation-modal":return new e(this.$modal,this.options,this);case"action-confirmation-modal":return new i(this.$modal,this.options,this);case"upgrade-required-modal":return new d(this.$modal,this.options,this);default:return console.warn("Warning: "+options.modal+" not found!")}}.call(this),null!=n&&n.build(),this.show(),this},t.prototype.show=function(){var t;return this.$body.addClass("no-scroll"),this.$body.append(this.$shield),this.$shield.velocity({opacity:1},{duration:300}),this.$body.append(this.$modal),castShadows(this.$modal),this.$modal.velocity({opacity:1},{duration:300}),"function"==typeof(t=this.options).onOpen?t.onOpen():void 0},t.prototype.hide=function(t){var n;if(null==t&&(t=!0),this.$modal.velocity({opacity:0},{duration:150,complete:function(t){return function(){return t.$modal.detach()}}(this)}),this.$shield.velocity({opacity:0},{duration:150,complete:function(t){return function(){return t.$shield.detach()}}(this)}),this.$body.removeClass("no-scroll"),t)return"function"==typeof(n=this.options).onClose?n.onClose():void 0},t.prototype.submit=function(t){var n;return null==t&&(t={}),"function"==typeof(n=this.options).onSubmit&&n.onSubmit(),this.hide(!1)},t}(),window.nanobox||(window.nanobox={}),nanobox.Modals=new s($("body"))},{"modals/action-confirmation-modal":2,"modals/delete-confirmation-modal":3,"modals/delete-verification-modal":4,"modals/upgrade-required-modal":6}],2:[function(t,n,o){var i,e,a,s=function(t,n){function o(){this.constructor=t}for(var i in n)d.call(n,i)&&(t[i]=n[i]);return o.prototype=n.prototype,t.prototype=new o,t.__super__=n.prototype,t},d={}.hasOwnProperty;a=t("jade/modals/action-confirmation-modal"),e=t("modals/modal"),n.exports=i=function(t){function n(t,o,i){var e;this.$el=t,this.options=null!=o?o:{},this.main=i,(e=this.options).callToAction||(e.callToAction="Continue"),this.$node=$(a(this.options)),this.$el.append(this.$node),n.__super__.constructor.call(this)}return s(n,t),n}(e)},{"jade/modals/action-confirmation-modal":7,"modals/modal":5}],3:[function(t,n,o){var i,e,a,s=function(t,n){function o(){this.constructor=t}for(var i in n)d.call(n,i)&&(t[i]=n[i]);return o.prototype=n.prototype,t.prototype=new o,t.__super__=n.prototype,t},d={}.hasOwnProperty;a=t("jade/modals/delete-confirmation-modal"),e=t("modals/modal"),n.exports=i=function(t){function n(t,o,i){var e;this.$el=t,this.options=null!=o?o:{},this.main=i,(e=this.options).callToAction||(e.callToAction="Delete"),this.$node=$(a(this.options)),this.$el.append(this.$node),n.__super__.constructor.call(this)}return s(n,t),n}(e)},{"jade/modals/delete-confirmation-modal":8,"modals/modal":5}],4:[function(t,n,o){var i,e,a,s=function(t,n){function o(){this.constructor=t}for(var i in n)d.call(n,i)&&(t[i]=n[i]);return o.prototype=n.prototype,t.prototype=new o,t.__super__=n.prototype,t},d={}.hasOwnProperty;a=t("jade/modals/delete-verification-modal"),e=t("modals/modal"),n.exports=i=function(t){function n(t,o,i){var e;this.$el=t,this.options=null!=o?o:{},this.main=i,(e=this.options).callToAction||(e.callToAction="Delete"),this.$node=$(a(this.options)),this.$el.append(this.$node),n.__super__.constructor.call(this)}return s(n,t),n.prototype.build=function(){var t;return n.__super__.build.call(this),t=this.$node.find(".btn.delete"),this.$node.find("input").keyup(function(n){return function(o){return n.options.token.toLowerCase()===o.currentTarget.value.toLowerCase()?t.removeClass("disabled"):t.addClass("disabled")}}(this))},n}(e)},{"jade/modals/delete-verification-modal":9,"modals/modal":5}],5:[function(t,n,o){var i;n.exports=i=function(){function t(){}return t.prototype.build=function(){return this.$node.find(".cancel-x").click(function(t){return function(n){return t.main.hide()}}(this)),this.$node.find(".cancel").click(function(t){return function(n){return t.main.hide()}}(this)),this.$node.find(".save").click(function(t){return function(n){return t.main.submit(t.options)}}(this))},t}()},{}],6:[function(t,n,o){var i,e,a,s=function(t,n){function o(){this.constructor=t}for(var i in n)d.call(n,i)&&(t[i]=n[i]);return o.prototype=n.prototype,t.prototype=new o,t.__super__=n.prototype,t},d={}.hasOwnProperty;a=t("jade/modals/upgrade-required-modal"),i=t("modals/modal"),n.exports=e=function(t){function n(t,o,i){var e;this.$el=t,this.options=null!=o?o:{},this.main=i,(e=this.options).callToAction||(e.callToAction="Continue"),this.$node=$(a(this.options)),this.$el.append(this.$node),n.__super__.constructor.call(this)}return s(n,t),n}(i)},{"jade/modals/upgrade-required-modal":10,"modals/modal":5}],7:[function(t,n,o){n.exports=function(t){var n,o=[],i=t||{};return function(t,i){o.push('<div id="action-confirmation-modal" class="modal"><div class="cancel-x"><img data-src="cancel-x-btn" class="shadow-icon"/></div><div class="header">'+jade.escape(null==(n=i)?"":n)+'</div><div class="content">'+(null==(n=t)?"":n)+'</div><div class="save-zone"><div class="btn basic cancel">Cancel</div><div class="btn basic lifecycle save">Continue</div></div></div>')}.call(this,"content"in i?i.content:"undefined"!=typeof content?content:void 0,"header"in i?i.header:"undefined"!=typeof header?header:void 0),o.join("")}},{}],8:[function(t,n,o){n.exports=function(t){var n,o=[],i=t||{};return function(t,i){o.push('<div id="delete-confirmation-modal" class="modal"><div class="cancel-x"><img data-src="cancel-x-btn" class="shadow-icon"/></div><div class="header">'+jade.escape(null==(n=i)?"":n)+'</div><div class="content">'+(null==(n=t)?"":n)+'</div><div class="delete-zone"><div class="btn basic cancel">Cancel</div><div class="btn basic delete lifecycle save">Delete</div></div></div>')}.call(this,"content"in i?i.content:"undefined"!=typeof content?content:void 0,"header"in i?i.header:"undefined"!=typeof header?header:void 0),o.join("")}},{}],9:[function(t,n,o){n.exports=function(t){var n,o=[],i=t||{};return function(t,i,e){o.push('<div id="delete-verification-modal" class="modal"><div class="cancel-x"><img data-src="cancel-x-btn" class="shadow-icon"/></div><div class="header">'+jade.escape(null==(n=i)?"":n)+'</div><div class="content">'+(null==(n=t)?"":n)+'</div><div class="input"><input'+jade.attr("placeholder","type '"+e+"' to confirm",!0,!1)+'/></div><div class="delete-zone"><div href="#" class="btn basic cancel">Cancel</div><div class="btn basic delete lifecycle disabled save">Delete</div></div></div>')}.call(this,"content"in i?i.content:"undefined"!=typeof content?content:void 0,"header"in i?i.header:"undefined"!=typeof header?header:void 0,"token"in i?i.token:"undefined"!=typeof token?token:void 0),o.join("")}},{}],10:[function(t,n,o){n.exports=function(t){var n,o=[],i=t||{};return function(t,i,e){o.push('<div id="upgrade-required-modal" class="modal"><div class="cancel-x"><img data-src="cancel-x-btn" class="shadow-icon"/></div><div class="header">'+jade.escape(null==(n=e)?"":n)+'</div><div class="content">'+(null==(n=i)?"":n)+'</div><div class="save-zone"><div href="#" class="btn basic cancel">Cancel</div>'),t&&o.push('<div class="btn basic save lifecycle">Manage Plan</div>'),o.push("</div></div>")}.call(this,"authorized"in i?i.authorized:"undefined"!=typeof authorized?authorized:void 0,"content"in i?i.content:"undefined"!=typeof content?content:void 0,"header"in i?i.header:"undefined"!=typeof header?header:void 0),o.join("")}},{}]},{},[1]);