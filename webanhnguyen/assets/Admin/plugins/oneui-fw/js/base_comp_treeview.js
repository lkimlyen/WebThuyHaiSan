/*
 *  Document   : base_comp_treeview.js
 *  Author     : pixelcave
 */
var BaseCompTreeview = function() {
    var e = function() {
        var e = [{
            text: "Bootstrap",
            href: "#parent1",
            tags: ["4"],
            nodes: [{
                text: "eLearning",
                href: "#child1",
                tags: ["2"],
                nodes: [{
                    text: "Code",
                    href: "#grandchild1"
                }, {
                    text: "Tutorials",
                    href: "#grandchild2"
                }]
            }, {
                text: "Templates",
                href: "#child2"
            }, {
                text: "CSS",
                href: "#child3",
                tags: ["2"],
                nodes: [{
                    text: "Less",
                    href: "#grandchild3"
                }, {
                    text: "SaSS",
                    href: "#grandchild4"
                }]
            }]
        }, {
            text: "Design",
            href: "#parent3"
        }, {
            text: "Coding",
            href: "#parent4"
        }, {
            text: "Marketing",
            href: "#parent5"
        }];
        jQuery(".js-tree-simple").treeview({
            data: e,
            color: "#555",
            expandIcon: "fa fa-plus",
            collapseIcon: "fa fa-minus",
            onhoverColor: "#f9f9f9",
            selectedColor: "#555",
            selectedBackColor: "#f1f1f1",
            showBorder: !1,
            levels: 3
        }), jQuery(".js-tree-icons").treeview({
            data: e,
            color: "#555",
            expandIcon: "fa fa-plus",
            collapseIcon: "fa fa-minus",
            nodeIcon: "fa fa-folder text-primary",
            onhoverColor: "#f9f9f9",
            selectedColor: "#555",
            selectedBackColor: "#f1f1f1",
            showBorder: !1,
            levels: 3
        }), jQuery(".js-tree-icons-alt").treeview({
            data: e,
            color: "#555",
            expandIcon: "fa fa-angle-down",
            collapseIcon: "fa fa-angle-up",
            nodeIcon: "fa fa-file-o text-city",
            onhoverColor: "#f9f9f9",
            selectedColor: "#555",
            selectedBackColor: "#f1f1f1",
            showBorder: !1,
            levels: 3
        }), jQuery(".js-tree-badges").treeview({
            data: e,
            color: "#555",
            expandIcon: "fa fa-plus",
            collapseIcon: "fa fa-minus",
            nodeIcon: "fa fa-folder text-primary",
            onhoverColor: "#f9f9f9",
            selectedColor: "#555",
            selectedBackColor: "#f1f1f1",
            showTags: !0,
            levels: 3
        }), jQuery(".js-tree-collapsed").treeview({
            data: e,
            color: "#555",
            expandIcon: "fa fa-plus",
            collapseIcon: "fa fa-minus",
            nodeIcon: "fa fa-folder text-primary-light",
            onhoverColor: "#f9f9f9",
            selectedColor: "#555",
            selectedBackColor: "#f1f1f1",
            showTags: !0,
            levels: 1
        });
        var o = '[{"text": "Bootstrap","nodes": [{"text": "eLearning","nodes": [{"text": "Code"},{"text": "Tutorials"}]},{"text": "Templates"},{"text": "CSS","nodes": [{"text": "Less"},{"text": "SaSS"}]}]},{"text": "Design"},{"text": "Coding"},{"text": "Marketing"}]';
        jQuery(".js-tree-json").treeview({
            data: o,
            color: "#555",
            expandIcon: "fa fa-arrow-down",
            collapseIcon: "fa fa-arrow-up",
            nodeIcon: "fa fa-file-code-o text-flat",
            onhoverColor: "#f9f9f9",
            selectedColor: "#555",
            selectedBackColor: "#f1f1f1",
            showTags: !0,
            levels: 3
        })
    };
    return {
        init: function() {
            e()
        }
    }
}();
jQuery(function() {
    BaseCompTreeview.init()
});