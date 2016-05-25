/**
 * Created by 47123 on 2016/5/16.
 */
(function () {
    var prefix = "../../../";

    var uptoken;

    var addMainPicOption = {
        runtimes: 'html5,flash,html4',      // 上传模式,依次退化
        browse_button: 'add-logo-btn',         // 上传选择的点选按钮，**必需**
        uptoken_url: prefix + 'h/admin/qiniu/uptoken',         // Ajax 请求 uptoken 的 Url，**强烈建议设置**（服务端提供）
        get_new_uptoken: false,             // 设置上传文件的时候是否每次都重新获取新的 uptoken
        domain: 'http://7xtgdy.com1.z0.glb.clouddn.com/',     // bucket 域名，下载资源时用到，**必需**
        container: 'add-logo-div',             // 上传区域 DOM ID，默认是 browser_button 的父元素，
        max_file_size: '100mb',             // 最大文件体积限制
        flash_swf_url: '../js/qiniu/Moxie.swf',  //引入 flash,相对路径
        max_retries: 3,                     // 上传失败最大重试次数
        dragdrop: false,                     // 开启可拖曳上传
        drop_element: 'add-logo-div',          // 拖曳上传区域元素的 ID，拖曳文件或文件夹后可触发上传
        chunk_size: '4mb',                  // 分块上传时，每块的体积
        auto_start: true,                   // 选择文件后自动上传，若关闭需要自己绑定事件触发上传,
        unique_names: true,              // 默认 false，key 为文件名。若开启该选项，JS-SDK 会为每个文件自动生成key（文件名）
        save_key: true,
        init: {
            'FilesAdded': function (up, files) {
                plupload.each(files, function (file) {
                    // 文件添加进队列后,处理相关的事情
                });
            },
            'BeforeUpload': function (up, file) {
                // 每个文件上传前,处理相关的事情
            },
            'UploadProgress': function (up, file) {
                // 每个文件上传时,处理相关的事情
            },
            'FileUploaded': function (up, file, info) {
                var domain = up.getOption('domain');
                var res = jQuery.parseJSON(info);
                var sourceLink = domain + res.key;// 获取上传成功后的文件的Url
                $('#add-logo-review').attr("src", sourceLink);
                console.log(sourceLink);
            },
            'Error': function (up, err, errTip) {
                //上传出错时,处理相关的事情
            },
            'UploadComplete': function () {
                //队列文件处理完毕后,处理相关的事情
            },
            'Key': function (up, file) {
                // 若想在前端对每个文件的key进行个性化处理，可以配置该函数
                // 该配置必须要在 unique_names: false , save_key: false 时才生效

                var key = "";
                // do something with key here
                return key
            }
        }
    }
    addMainPicOption.browse_button = 'add-list-pic-btn';//id of main pic
    addMainPicOption.container = 'add-list-pic-div';
    addMainPicOption.init.FileUploaded = function (up, file, info) {
        var domain = up.getOption('domain');
        var res = jQuery.parseJSON(info);
        var sourceLink = domain + res.key;// 获取上传成功后的文件的Url
        $('#add-list-review-div').children("img").attr("src", sourceLink);
        console.log(sourceLink);
    }

    var addSecondPicOption = {
        runtimes: 'html5,flash,html4',      // 上传模式,依次退化
        browse_button: 'add-logo-btn',         // 上传选择的点选按钮，**必需**
        uptoken_url: prefix + 'h/admin/qiniu/uptoken',         // Ajax 请求 uptoken 的 Url，**强烈建议设置**（服务端提供）
        get_new_uptoken: false,             // 设置上传文件的时候是否每次都重新获取新的 uptoken
        domain: 'http://7xtgdy.com1.z0.glb.clouddn.com/',     // bucket 域名，下载资源时用到，**必需**
        container: 'add-logo-div',             // 上传区域 DOM ID，默认是 browser_button 的父元素，
        max_file_size: '100mb',             // 最大文件体积限制
        flash_swf_url: '../js/qiniu/Moxie.swf',  //引入 flash,相对路径
        max_retries: 3,                     // 上传失败最大重试次数
        dragdrop: false,                     // 开启可拖曳上传
        drop_element: 'add-logo-div',          // 拖曳上传区域元素的 ID，拖曳文件或文件夹后可触发上传
        chunk_size: '4mb',                  // 分块上传时，每块的体积
        auto_start: true,                   // 选择文件后自动上传，若关闭需要自己绑定事件触发上传,
        unique_names: true,              // 默认 false，key 为文件名。若开启该选项，JS-SDK 会为每个文件自动生成key（文件名）
        save_key: true,
        init: {
            'FilesAdded': function (up, files) {
                plupload.each(files, function (file) {
                    // 文件添加进队列后,处理相关的事情
                });
            },
            'BeforeUpload': function (up, file) {
                // 每个文件上传前,处理相关的事情
            },
            'UploadProgress': function (up, file) {
                // 每个文件上传时,处理相关的事情
            },
            'FileUploaded': function (up, file, info) {
                var domain = up.getOption('domain');
                var res = jQuery.parseJSON(info);
                var sourceLink = domain + res.key;// 获取上传成功后的文件的Url
                $('#add-logo-review').attr("src", sourceLink);
                console.log(sourceLink);
            },
            'Error': function (up, err, errTip) {
                //上传出错时,处理相关的事情
            },
            'UploadComplete': function () {
                //队列文件处理完毕后,处理相关的事情
            },
            'Key': function (up, file) {
                // 若想在前端对每个文件的key进行个性化处理，可以配置该函数
                // 该配置必须要在 unique_names: false , save_key: false 时才生效

                var key = "";
                // do something with key here
                return key
            }
        }
    }
    addSecondPicOption.browse_button = 'add-main-pic-btn';//id of main pic
    addSecondPicOption.container = 'add-main-pic-div';
    addSecondPicOption.init.FileUploaded = function (up, file, info) {
        var domain = up.getOption('domain');
        var res = jQuery.parseJSON(info);
        var sourceLink = domain + res.key;// 获取上传成功后的文件的Url
        $('#add-main-review-div').children("img").attr("src", sourceLink);
        console.log(sourceLink);
    }

    var addThirdPicOption = {
        runtimes: 'html5,flash,html4',      // 上传模式,依次退化
        browse_button: 'add-logo-btn',         // 上传选择的点选按钮，**必需**
        uptoken_url: prefix + 'h/admin/qiniu/uptoken',         // Ajax 请求 uptoken 的 Url，**强烈建议设置**（服务端提供）
        get_new_uptoken: false,             // 设置上传文件的时候是否每次都重新获取新的 uptoken
        domain: 'http://7xtgdy.com1.z0.glb.clouddn.com/',     // bucket 域名，下载资源时用到，**必需**
        container: 'add-logo-div',             // 上传区域 DOM ID，默认是 browser_button 的父元素，
        max_file_size: '100mb',             // 最大文件体积限制
        flash_swf_url: '../js/qiniu/Moxie.swf',  //引入 flash,相对路径
        max_retries: 3,                     // 上传失败最大重试次数
        dragdrop: false,                     // 开启可拖曳上传
        drop_element: 'add-logo-div',          // 拖曳上传区域元素的 ID，拖曳文件或文件夹后可触发上传
        chunk_size: '4mb',                  // 分块上传时，每块的体积
        auto_start: true,                   // 选择文件后自动上传，若关闭需要自己绑定事件触发上传,
        unique_names: true,              // 默认 false，key 为文件名。若开启该选项，JS-SDK 会为每个文件自动生成key（文件名）
        save_key: true,
        init: {
            'FilesAdded': function (up, files) {
                plupload.each(files, function (file) {
                    // 文件添加进队列后,处理相关的事情
                });
            },
            'BeforeUpload': function (up, file) {
                // 每个文件上传前,处理相关的事情
            },
            'UploadProgress': function (up, file) {
                // 每个文件上传时,处理相关的事情
            },
            'FileUploaded': function (up, file, info) {
                var domain = up.getOption('domain');
                var res = jQuery.parseJSON(info);
                var sourceLink = domain + res.key;// 获取上传成功后的文件的Url
                $('#add-logo-review').attr("src", sourceLink);
                console.log(sourceLink);
            },
            'Error': function (up, err, errTip) {
                //上传出错时,处理相关的事情
            },
            'UploadComplete': function () {
                //队列文件处理完毕后,处理相关的事情
            },
            'Key': function (up, file) {
                // 若想在前端对每个文件的key进行个性化处理，可以配置该函数
                // 该配置必须要在 unique_names: false , save_key: false 时才生效

                var key = "";
                // do something with key here
                return key
            }
        }
    }
    addThirdPicOption.browse_button = 'add-second-pic-btn';//id of main pic
    addThirdPicOption.container = 'add-second-pic-div';
    addThirdPicOption.init.FileUploaded = function (up, file, info) {
        var domain = up.getOption('domain');
        var res = jQuery.parseJSON(info);
        var sourceLink = domain + res.key;// 获取上传成功后的文件的Url
        $('#add-second-review-div').children("img").attr("src", sourceLink);
        console.log(sourceLink);
    }

    var addFourthPicOption = {
        runtimes: 'html5,flash,html4',      // 上传模式,依次退化
        browse_button: 'add-logo-btn',         // 上传选择的点选按钮，**必需**
        uptoken_url: prefix + 'h/admin/qiniu/uptoken',         // Ajax 请求 uptoken 的 Url，**强烈建议设置**（服务端提供）
        get_new_uptoken: false,             // 设置上传文件的时候是否每次都重新获取新的 uptoken
        domain: 'http://7xtgdy.com1.z0.glb.clouddn.com/',     // bucket 域名，下载资源时用到，**必需**
        container: 'add-logo-div',             // 上传区域 DOM ID，默认是 browser_button 的父元素，
        max_file_size: '100mb',             // 最大文件体积限制
        flash_swf_url: '../js/qiniu/Moxie.swf',  //引入 flash,相对路径
        max_retries: 3,                     // 上传失败最大重试次数
        dragdrop: false,                     // 开启可拖曳上传
        drop_element: 'add-logo-div',          // 拖曳上传区域元素的 ID，拖曳文件或文件夹后可触发上传
        chunk_size: '4mb',                  // 分块上传时，每块的体积
        auto_start: true,                   // 选择文件后自动上传，若关闭需要自己绑定事件触发上传,
        unique_names: true,              // 默认 false，key 为文件名。若开启该选项，JS-SDK 会为每个文件自动生成key（文件名）
        save_key: true,
        init: {
            'FilesAdded': function (up, files) {
                plupload.each(files, function (file) {
                    // 文件添加进队列后,处理相关的事情
                });
            },
            'BeforeUpload': function (up, file) {
                // 每个文件上传前,处理相关的事情
            },
            'UploadProgress': function (up, file) {
                // 每个文件上传时,处理相关的事情
            },
            'FileUploaded': function (up, file, info) {
                var domain = up.getOption('domain');
                var res = jQuery.parseJSON(info);
                var sourceLink = domain + res.key;// 获取上传成功后的文件的Url
                $('#add-logo-review').attr("src", sourceLink);
                console.log(sourceLink);
            },
            'Error': function (up, err, errTip) {
                //上传出错时,处理相关的事情
            },
            'UploadComplete': function () {
                //队列文件处理完毕后,处理相关的事情
            },
            'Key': function (up, file) {
                // 若想在前端对每个文件的key进行个性化处理，可以配置该函数
                // 该配置必须要在 unique_names: false , save_key: false 时才生效

                var key = "";
                // do something with key here
                return key
            }
        }
    }
    addFourthPicOption.browse_button = 'add-thirth-pic-btn';//id of main pic
    addFourthPicOption.container = 'add-thirth-pic-div';
    addFourthPicOption.init.FileUploaded = function (up, file, info) {
        var domain = up.getOption('domain');
        var res = jQuery.parseJSON(info);
        var sourceLink = domain + res.key;// 获取上传成功后的文件的Url
        $('#add-thirth-review-div').children("img").attr("src", sourceLink);
        console.log(sourceLink);
    }

    var editorMainPicOption = {
        runtimes: 'html5,flash,html4',      // 上传模式,依次退化
        browse_button: 'editor-logo-btn',         // 上传选择的点选按钮，**必需**
        uptoken_url: prefix + 'h/admin/qiniu/uptoken',         // Ajax 请求 uptoken 的 Url，**强烈建议设置**（服务端提供）
        get_new_uptoken: false,             // 设置上传文件的时候是否每次都重新获取新的 uptoken
        domain: 'http://7xtgdy.com1.z0.glb.clouddn.com/',     // bucket 域名，下载资源时用到，**必需**
        container: 'editor-logo-div',             // 上传区域 DOM ID，默认是 browser_button 的父元素，
        max_file_size: '100mb',             // 最大文件体积限制
        flash_swf_url: '../js/qiniu/Moxie.swf',  //引入 flash,相对路径
        max_retries: 3,                     // 上传失败最大重试次数
        dragdrop: false,                     // 开启可拖曳上传
        drop_element: 'editor-logo-div',          // 拖曳上传区域元素的 ID，拖曳文件或文件夹后可触发上传
        chunk_size: '4mb',                  // 分块上传时，每块的体积
        auto_start: true,                   // 选择文件后自动上传，若关闭需要自己绑定事件触发上传,
        unique_names: true,              // 默认 false，key 为文件名。若开启该选项，JS-SDK 会为每个文件自动生成key（文件名）
        save_key: true,
        init: {
            'FilesAdded': function (up, files) {
                plupload.each(files, function (file) {
                    // 文件添加进队列后,处理相关的事情
                });
            },
            'BeforeUpload': function (up, file) {
                // 每个文件上传前,处理相关的事情
            },
            'UploadProgress': function (up, file) {
                // 每个文件上传时,处理相关的事情
            },
            'FileUploaded': function (up, file, info) {
                var domain = up.getOption('domain');
                var res = jQuery.parseJSON(info);
                var sourceLink = domain + res.key;// 获取上传成功后的文件的Url
                $('#editor-logo-review').attr("src", sourceLink);
                console.log(sourceLink);
            },
            'Error': function (up, err, errTip) {
                //上传出错时,处理相关的事情
            },
            'UploadComplete': function () {
                //队列文件处理完毕后,处理相关的事情
            },
            'Key': function (up, file) {
                // 若想在前端对每个文件的key进行个性化处理，可以配置该函数
                // 该配置必须要在 unique_names: false , save_key: false 时才生效

                var key = "";
                // do something with key here
                return key
            }
        }
    }
    editorMainPicOption.browse_button = 'editor-list-pic-btn';//id of main pic
    editorMainPicOption.container = 'editor-list-pic-div';
    editorMainPicOption.init.FileUploaded = function (up, file, info) {
        var domain = up.getOption('domain');
        var res = jQuery.parseJSON(info);
        var sourceLink = domain + res.key;// 获取上传成功后的文件的Url
        $('#editor-list-review-div').children("img").attr("src", sourceLink);
        console.log(sourceLink);
    }

    var editorSecondPicOption = {
        runtimes: 'html5,flash,html4',      // 上传模式,依次退化
        browse_button: 'editor-logo-btn',         // 上传选择的点选按钮，**必需**
        uptoken_url: prefix + 'h/admin/qiniu/uptoken',         // Ajax 请求 uptoken 的 Url，**强烈建议设置**（服务端提供）
        get_new_uptoken: false,             // 设置上传文件的时候是否每次都重新获取新的 uptoken
        domain: 'http://7xtgdy.com1.z0.glb.clouddn.com/',     // bucket 域名，下载资源时用到，**必需**
        container: 'editor-logo-div',             // 上传区域 DOM ID，默认是 browser_button 的父元素，
        max_file_size: '100mb',             // 最大文件体积限制
        flash_swf_url: '../js/qiniu/Moxie.swf',  //引入 flash,相对路径
        max_retries: 3,                     // 上传失败最大重试次数
        dragdrop: false,                     // 开启可拖曳上传
        drop_element: 'editor-logo-div',          // 拖曳上传区域元素的 ID，拖曳文件或文件夹后可触发上传
        chunk_size: '4mb',                  // 分块上传时，每块的体积
        auto_start: true,                   // 选择文件后自动上传，若关闭需要自己绑定事件触发上传,
        unique_names: true,              // 默认 false，key 为文件名。若开启该选项，JS-SDK 会为每个文件自动生成key（文件名）
        save_key: true,
        init: {
            'FilesAdded': function (up, files) {
                plupload.each(files, function (file) {
                    // 文件添加进队列后,处理相关的事情
                });
            },
            'BeforeUpload': function (up, file) {
                // 每个文件上传前,处理相关的事情
            },
            'UploadProgress': function (up, file) {
                // 每个文件上传时,处理相关的事情
            },
            'FileUploaded': function (up, file, info) {
                var domain = up.getOption('domain');
                var res = jQuery.parseJSON(info);
                var sourceLink = domain + res.key;// 获取上传成功后的文件的Url
                $('#editor-logo-review').attr("src", sourceLink);
                console.log(sourceLink);
            },
            'Error': function (up, err, errTip) {
                //上传出错时,处理相关的事情
            },
            'UploadComplete': function () {
                //队列文件处理完毕后,处理相关的事情
            },
            'Key': function (up, file) {
                // 若想在前端对每个文件的key进行个性化处理，可以配置该函数
                // 该配置必须要在 unique_names: false , save_key: false 时才生效

                var key = "";
                // do something with key here
                return key
            }
        }
    }
    editorSecondPicOption.browse_button = 'editor-main-pic-btn';//id of main pic
    editorSecondPicOption.container = 'editor-main-pic-div';
    editorSecondPicOption.init.FileUploaded = function (up, file, info) {
        var domain = up.getOption('domain');
        var res = jQuery.parseJSON(info);
        var sourceLink = domain + res.key;// 获取上传成功后的文件的Url
        $('#editor-main-review-div').children("img").attr("src", sourceLink);
        console.log(sourceLink);
    }

    var editorThirdPicOption = {
        runtimes: 'html5,flash,html4',      // 上传模式,依次退化
        browse_button: 'editor-logo-btn',         // 上传选择的点选按钮，**必需**
        uptoken_url: prefix + 'h/admin/qiniu/uptoken',         // Ajax 请求 uptoken 的 Url，**强烈建议设置**（服务端提供）
        get_new_uptoken: false,             // 设置上传文件的时候是否每次都重新获取新的 uptoken
        domain: 'http://7xtgdy.com1.z0.glb.clouddn.com/',     // bucket 域名，下载资源时用到，**必需**
        container: 'editor-logo-div',             // 上传区域 DOM ID，默认是 browser_button 的父元素，
        max_file_size: '100mb',             // 最大文件体积限制
        flash_swf_url: '../js/qiniu/Moxie.swf',  //引入 flash,相对路径
        max_retries: 3,                     // 上传失败最大重试次数
        dragdrop: false,                     // 开启可拖曳上传
        drop_element: 'editor-logo-div',          // 拖曳上传区域元素的 ID，拖曳文件或文件夹后可触发上传
        chunk_size: '4mb',                  // 分块上传时，每块的体积
        auto_start: true,                   // 选择文件后自动上传，若关闭需要自己绑定事件触发上传,
        unique_names: true,              // 默认 false，key 为文件名。若开启该选项，JS-SDK 会为每个文件自动生成key（文件名）
        save_key: true,
        init: {
            'FilesAdded': function (up, files) {
                plupload.each(files, function (file) {
                    // 文件添加进队列后,处理相关的事情
                });
            },
            'BeforeUpload': function (up, file) {
                // 每个文件上传前,处理相关的事情
            },
            'UploadProgress': function (up, file) {
                // 每个文件上传时,处理相关的事情
            },
            'FileUploaded': function (up, file, info) {
                var domain = up.getOption('domain');
                var res = jQuery.parseJSON(info);
                var sourceLink = domain + res.key;// 获取上传成功后的文件的Url
                $('#editor-logo-review').attr("src", sourceLink);
                console.log(sourceLink);
            },
            'Error': function (up, err, errTip) {
                //上传出错时,处理相关的事情
            },
            'UploadComplete': function () {
                //队列文件处理完毕后,处理相关的事情
            },
            'Key': function (up, file) {
                // 若想在前端对每个文件的key进行个性化处理，可以配置该函数
                // 该配置必须要在 unique_names: false , save_key: false 时才生效

                var key = "";
                // do something with key here
                return key
            }
        }
    }
    editorThirdPicOption.browse_button = 'editor-second-pic-btn';//id of main pic
    editorThirdPicOption.container = 'editor-second-pic-div';
    editorThirdPicOption.init.FileUploaded = function (up, file, info) {
        var domain = up.getOption('domain');
        var res = jQuery.parseJSON(info);
        var sourceLink = domain + res.key;// 获取上传成功后的文件的Url
        $('#editor-second-review-div').children("img").attr("src", sourceLink);
        console.log(sourceLink);
    }

    var editorFourthPicOption = {
        runtimes: 'html5,flash,html4',      // 上传模式,依次退化
        browse_button: 'editor-logo-btn',         // 上传选择的点选按钮，**必需**
        uptoken_url: prefix + 'h/admin/qiniu/uptoken',         // Ajax 请求 uptoken 的 Url，**强烈建议设置**（服务端提供）
        get_new_uptoken: false,             // 设置上传文件的时候是否每次都重新获取新的 uptoken
        domain: 'http://7xtgdy.com1.z0.glb.clouddn.com/',     // bucket 域名，下载资源时用到，**必需**
        container: 'editor-logo-div',             // 上传区域 DOM ID，默认是 browser_button 的父元素，
        max_file_size: '100mb',             // 最大文件体积限制
        flash_swf_url: '../js/qiniu/Moxie.swf',  //引入 flash,相对路径
        max_retries: 3,                     // 上传失败最大重试次数
        dragdrop: false,                     // 开启可拖曳上传
        drop_element: 'editor-logo-div',          // 拖曳上传区域元素的 ID，拖曳文件或文件夹后可触发上传
        chunk_size: '4mb',                  // 分块上传时，每块的体积
        auto_start: true,                   // 选择文件后自动上传，若关闭需要自己绑定事件触发上传,
        unique_names: true,              // 默认 false，key 为文件名。若开启该选项，JS-SDK 会为每个文件自动生成key（文件名）
        save_key: true,
        init: {
            'FilesAdded': function (up, files) {
                plupload.each(files, function (file) {
                    // 文件添加进队列后,处理相关的事情
                });
            },
            'BeforeUpload': function (up, file) {
                // 每个文件上传前,处理相关的事情
            },
            'UploadProgress': function (up, file) {
                // 每个文件上传时,处理相关的事情
            },
            'FileUploaded': function (up, file, info) {
                var domain = up.getOption('domain');
                var res = jQuery.parseJSON(info);
                var sourceLink = domain + res.key;// 获取上传成功后的文件的Url
                $('#editor-logo-review').attr("src", sourceLink);
                console.log(sourceLink);
            },
            'Error': function (up, err, errTip) {
                //上传出错时,处理相关的事情
            },
            'UploadComplete': function () {
                //队列文件处理完毕后,处理相关的事情
            },
            'Key': function (up, file) {
                // 若想在前端对每个文件的key进行个性化处理，可以配置该函数
                // 该配置必须要在 unique_names: false , save_key: false 时才生效

                var key = "";
                // do something with key here
                return key
            }
        }
    }
    editorFourthPicOption.browse_button = 'editor-thirth-pic-btn';//id of main pic
    editorFourthPicOption.container = 'editor-main-pic-div';
    editorFourthPicOption.init.FileUploaded = function (up, file, info) {
        var domain = up.getOption('domain');
        var res = jQuery.parseJSON(info);
        var sourceLink = domain + res.key;// 获取上传成功后的文件的Url
        $('#editor-thirth-review-div').children("img").attr("src", sourceLink);
        console.log(sourceLink);
    }

    var Qiniu1 = new QiniuJsSDK();
    var Qiniu2 = new QiniuJsSDK();
    var Qiniu3 = new QiniuJsSDK();
    var Qiniu4 = new QiniuJsSDK();
    var Qiniu5 = new QiniuJsSDK();
    var Qiniu6 = new QiniuJsSDK();
    var Qiniu7 = new QiniuJsSDK();
    var addMainUploader = Qiniu.uploader(addMainPicOption);
    var addSecondUploader = Qiniu1.uploader(addSecondPicOption);
    var addThirdUploader = Qiniu2.uploader(addThirdPicOption);
    var addFourthUploader = Qiniu3.uploader(addFourthPicOption);
    var editorMainUploader = Qiniu4.uploader(editorMainPicOption);
    var editorSecondUploader = Qiniu5.uploader(editorSecondPicOption);
    var editorThirdUploader = Qiniu6.uploader(editorThirdPicOption);
    var editorFourthUploader = Qiniu7.uploader(editorFourthPicOption);

})();    