﻿/*
 Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 For licensing, see LICENSE.md or http://ckeditor.com/license
 */
(function () {
    function t(d) {
        for (var e = 0, m = 0, a = 0, n, b = d.$.rows.length; a < b; a++) {
            n = d.$.rows[a];
            for (var c = e = 0, p, g = n.cells.length; c < g; c++)p = n.cells[c], e += p.colSpan;
            e > m && (m = e)
        }
        return m
    }

    function q(d) {
        return function () {
            var e = this.getValue(), e = !!(CKEDITOR.dialog.validate.integer()(e) && 0 < e);
            e || (alert(d), this.select());
            return e
        }
    }

    function r(d, e) {
        var m = function (a) {
            return new CKEDITOR.dom.element(a, d.document)
        };
        d.editable();
        return {
            title: d.lang.table.title, minWidth: 310, minHeight: CKEDITOR.env.ie ? 310 : 280, onShow: function () {
                var a =
                    d.getSelection(), n = a.getRanges(), b, c = this.getContentElement("info", "txtRows"), p = this.getContentElement("info", "txtCols");
                "tableProperties" == e && ((a = a.getSelectedElement()) && a.is("table") ? b = a : 0 < n.length && (CKEDITOR.env.webkit && n[0].shrink(CKEDITOR.NODE_ELEMENT), b = d.elementPath(n[0].getCommonAncestor(!0)).contains("table", 1)), this._.selectedElement = b);
                b ? (this.setupContent(b), c && c.disable(), p && p.disable()) : (c && c.enable(), p && p.enable())
            }, onOk: function () {
                var a = d.getSelection(), n = this._.selectedElement &&
                    a.createBookmarks(), b = this._.selectedElement || m("table"), c = {};
                this.commitContent(c, b);
                if (c.info) {
                    var e = c.info;
                    if (!this._.selectedElement)for (var g = b.append(m("tbody")), l = parseInt(e.txtRows, 10) || 0, f = parseInt(e.txtCols, 10) || 0, c = 0; c < l; c++)for (var h = g.append(m("tr")), k = 0; k < f; k++)h.append(m("td")).appendBogus();
                    l = e.selHeaders;
                    if (!b.$.tHead && ("row" == l || "both" == l)) {
                        h = new CKEDITOR.dom.element(b.$.createTHead());
                        g = b.getElementsByTag("tbody").getItem(0);
                        g = g.getElementsByTag("tr").getItem(0);
                        for (c = 0; c < g.getChildCount(); c++)f =
                            g.getChild(c), f.type != CKEDITOR.NODE_ELEMENT || f.data("cke-bookmark") || (f.renameNode("th"), f.setAttribute("scope", "col"));
                        h.append(g.remove())
                    }
                    if (null !== b.$.tHead && "row" != l && "both" != l) {
                        h = new CKEDITOR.dom.element(b.$.tHead);
                        g = b.getElementsByTag("tbody").getItem(0);
                        for (k = g.getFirst(); 0 < h.getChildCount();) {
                            g = h.getFirst();
                            for (c = 0; c < g.getChildCount(); c++)f = g.getChild(c), f.type == CKEDITOR.NODE_ELEMENT && (f.renameNode("td"), f.removeAttribute("scope"));
                            g.insertBefore(k)
                        }
                        h.remove()
                    }
                    if (!this.hasColumnHeaders &&
                        ("col" == l || "both" == l))for (h = 0; h < b.$.rows.length; h++)f = new CKEDITOR.dom.element(b.$.rows[h].cells[0]), f.renameNode("th"), f.setAttribute("scope", "row");
                    if (this.hasColumnHeaders && "col" != l && "both" != l)for (c = 0; c < b.$.rows.length; c++)h = new CKEDITOR.dom.element(b.$.rows[c]), "tbody" == h.getParent().getName() && (f = new CKEDITOR.dom.element(h.$.cells[0]), f.renameNode("td"), f.removeAttribute("scope"))
                }
                if (this._.selectedElement)try {
                    a.selectBookmarks(n)
                } catch (q) {
                } else d.insertElement(b), setTimeout(function () {
                    var a =
                        new CKEDITOR.dom.element(b.$.rows[0].cells[0]), c = d.createRange();
                    c.moveToPosition(a, CKEDITOR.POSITION_AFTER_START);
                    c.select()
                }, 0);
                b.addClass("table");
                b.addClass("cke_show_border");
                b.setStyle("width", "100%");
                e.tableStriped ? b.addClass("table-striped") : b.removeClass("table-striped");
                e.tableHover ? b.addClass("table-hover") : b.removeClass("table-hover");
                e.tableBordered ? b.addClass("table-bordered") : b.removeClass("table-bordered");
                e.tableCondensed ? b.addClass("table-condensed") : b.removeClass("table-condensed");
                b.getParent().hasClass("table-responsive") || (a = m("div"), a.addClass("table-responsive"), a.append(b), d.insertElement(a))
            }, contents: [{
                id: "info", label: d.lang.table.title, elements: [{
                    type: "hbox", widths: [null, null], styles: ["vertical-align:top"], children: [{
                        type: "vbox",
                        padding: 0,
                        children: [{
                            type: "text",
                            id: "txtRows",
                            "default": 3,
                            label: d.lang.table.rows,
                            required: !0,
                            controlStyle: "width:5em",
                            validate: q(d.lang.table.invalidRows),
                            setup: function (a) {
                                this.setValue(a.$.rows.length)
                            },
                            commit: k
                        }, {
                            type: "text",
                            id: "txtCols",
                            "default": 2,
                            label: d.lang.table.columns,
                            required: !0,
                            controlStyle: "width:5em",
                            validate: q(d.lang.table.invalidCols),
                            setup: function (a) {
                                this.setValue(t(a))
                            },
                            commit: k
                        }, {type: "html", html: "\x26nbsp;"}, {
                            type: "select",
                            id: "selHeaders",
                            requiredContent: "th",
                            "default": "",
                            label: d.lang.table.headers,
                            items: [[d.lang.table.headersNone, ""], [d.lang.table.headersRow, "row"], [d.lang.table.headersColumn, "col"], [d.lang.table.headersBoth, "both"]],
                            setup: function (a) {
                                var d = this.getDialog();
                                d.hasColumnHeaders = !0;
                                for (var b = 0; b <
                                a.$.rows.length; b++) {
                                    var c = a.$.rows[b].cells[0];
                                    if (c && "th" != c.nodeName.toLowerCase()) {
                                        d.hasColumnHeaders = !1;
                                        break
                                    }
                                }
                                null !== a.$.tHead ? this.setValue(d.hasColumnHeaders ? "both" : "row") : this.setValue(d.hasColumnHeaders ? "col" : "")
                            },
                            commit: k
                        }, {
                            type: "html", id: "txtBorder", html: "\x26nbsp;", commit: function () {
                            }
                        }]
                    }, {
                        type: "hbox", padding: 0, children: [{
                            type: "vbox", widths: ["10em"], children: [{
                                type: "checkbox",
                                id: "tableStriped",
                                label: "Add stripes",
                                "default": "",
                                setup: function (a) {
                                    a = a.hasClass("table-striped");
                                    this.setValue(a)
                                },
                                commit: k
                            }, {
                                type: "checkbox",
                                id: "tableHover",
                                label: "Add hover effect",
                                "default": "",
                                setup: function (a) {
                                    a = a.hasClass("table-hover");
                                    this.setValue(a)
                                },
                                commit: k
                            }, {
                                type: "checkbox",
                                id: "tableBordered",
                                label: "Add borders",
                                "default": "",
                                setup: function (a) {
                                    a = a.hasClass("table-bordered");
                                    this.setValue(a)
                                },
                                commit: k
                            }, {
                                type: "checkbox",
                                id: "tableCondensed",
                                label: "Compact style table",
                                "default": "",
                                setup: function (a) {
                                    this.enable();
                                    a = a.hasClass("table-condensed");
                                    this.setValue(a)
                                },
                                commit: k
                            }]
                        }]
                    }]
                }, {
                    type: "vbox", padding: 0, children: [{
                        type: "text",
                        id: "txtCaption", requiredContent: "caption", label: d.lang.table.caption, setup: function (a) {
                            this.enable();
                            a = a.getElementsByTag("caption");
                            if (0 < a.count()) {
                                a = a.getItem(0);
                                var d = a.getFirst(CKEDITOR.dom.walker.nodeType(CKEDITOR.NODE_ELEMENT));
                                d && !d.equals(a.getBogus()) ? (this.disable(), this.setValue(a.getText())) : (a = CKEDITOR.tools.trim(a.getText()), this.setValue(a))
                            }
                        }, commit: function (a, e) {
                            if (this.isEnabled()) {
                                var b = this.getValue(), c = e.getElementsByTag("caption");
                                if (b)0 < c.count() ? (c = c.getItem(0), c.setHtml("")) :
                                    (c = new CKEDITOR.dom.element("caption", d.document), e.getChildCount() ? c.insertBefore(e.getFirst()) : c.appendTo(e)), c.append(new CKEDITOR.dom.text(b, d.document)); else if (0 < c.count())for (b = c.count() - 1; 0 <= b; b--)c.getItem(b).remove()
                            }
                        }
                    }]
                }]
            }]
        }
    }

    var k = function (d) {
        var e = this.id;
        d.info || (d.info = {});
        d.info[e] = this.getValue()
    };
    CKEDITOR.dialog.add("bt_table", function (d) {
        return r(d, "table")
    });
    CKEDITOR.dialog.add("bt_tableProperties", function (d) {
        return r(d, "tableProperties")
    })
})();