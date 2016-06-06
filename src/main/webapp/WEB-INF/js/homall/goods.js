/**
 * Created by 47123 on 2016/5/21.
 */
    //<li>
    //<a href="">
    //<div class="ui-border">
    //    <div class="ui-grid-trisect-img">
    //    <span style="background-image:url(http://placeholder.qiniudn.com/190x284)"></span>
    //    </div>
    //    <div class="padding-horizontal-xs">
    //    <h4 class="ui-nowrap-multi">长书名长书名长书名长书名长书名长书名长书名</h4>
    //    <h5 class="ui-nowrap price">&yen;200 </h5>
    //</div>
    //</div>
    //</a>
    //</li>

GoodsApi = {
    urlPrefix: "",
    loadGoodsListFace: function (goodses, ulId) {
        $(goodses).each(function (i, e) {
            var listPic = e.goodsListPic //+ "?imageMogr2/interlace/1/quality/100!";
            var title = e.title;
            var price = e.price;
            var url = GoodsApi.urlPrefix + "/goods/detail/" + e.id;
            var li = '<li>' +
                '<a href="' + url + '">' +
                '<div class="ui-border">' +
                '<div class="ui-grid-trisect-img">' +
                '<img src="' + listPic + '"/>' +
                '</div>' +
                '<div class="padding-horizontal-xs">' +
                '<h4 class="ui-nowrap-multi">' + title + '</h4>' +
                '<h5 class="ui-nowrap"><span class="price">&yen;' + price + '</span>' +
                '<span class="color-black" style="float: right">已售:' + e.saledNum + '</span></h5>' +
                '</div>' +
                '</div>' +
                '</a>' +
                '</li>'
            $('#' + ulId + '').append(li);
        })
    }
}
