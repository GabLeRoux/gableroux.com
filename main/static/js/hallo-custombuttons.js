(function () {
    (function ($) {
        return $.widget('IKS.blockquotebutton', {
            options: {
                uuid: '',
                editable: null
            },
            populateToolbar: function (toolbar) {
                var button, widget;

                widget = this;

                button = $('<span></span>');
                button.hallobutton({
                    uuid: this.options.uuid,
                    editable: this.options.editable,
                    label: 'Blockquote',
                    icon: 'fa fa-quote-left',
                    command: null
                });

                toolbar.append(button);

                button.on('click', function (event) {
                    return widget.options.editable.execute('formatBlock',
                        'blockquote');
                });
            }
        });
    })(jQuery);
}).call(this);

(function () {
    (function ($) {
        return $.widget("IKS.small", {
            options: {
                uuid: '',
                editable: null
            },
            populateToolbar: function (toolbar) {
                var button, widget;

                widget = this;
                button = $('<span></span>');
                button.hallobutton({
                    uuid: this.options.uuid,
                    editable: this.options.editable,
                    label: 'Small (use with blockquote)',
                    icon: 'fa fa-stack-exchange',
                    command: null
                });
                toolbar.append(button);
                return button.on("click", function (event) {
                    var insertionPoint, lastSelection;

                    lastSelection = widget.options.editable.getSelection();
                    insertionPoint = $(lastSelection.endContainer).parentsUntil('.richtext').last();
                    var elem;
                    elem = "<small>" + lastSelection + "</small>";

                    var node = lastSelection.createContextualFragment(elem);

                    lastSelection.deleteContents();
                    lastSelection.insertNode(node);

                    return widget.options.editable.element.trigger('change');
                });
            }
        });
    })(jQuery);

}).call(this);