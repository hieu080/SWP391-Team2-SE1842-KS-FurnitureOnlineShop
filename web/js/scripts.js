/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

// Biáº¿n khá»Ÿi táº¡o
var timeOut_modalCart;
var viewout = true;
var check_show_modal = true;
// Add a product and show modal cart
var add_item_show_modalCart = function (id) {
    if (check_show_modal) {
        check_show_modal = false;
        timeOut_modalCart = setTimeout(function () {
            check_show_modal = true;
        }, 200);
        if ($('.addtocart-modal').hasClass('clicked_buy')) {
            var quantity = $('#quantity').val();
        } else {
            var quantity = 1;
        }
        var params = {
            type: 'POST',
            url: '/cart/add.js',
            async: true,
            data: 'quantity=' + quantity + '&id=' + id,
            dataType: 'json',
            success: function (line_item) {
                getCartModal();
                jQuery('#myCart').modal('show');
                jQuery('.modal-backdrop').css({'height': jQuery(document).height(), 'z-index': '99'});
                $('.addtocart-modal').removeClass('clicked_buy');
            },
            error: function (XMLHttpRequest, textStatus) {
                alert('Sáº£n pháº©m báº¡n vá»«a mua Ä‘Ă£ vÆ°á»£t quĂ¡ tá»“n kho');
            }
        };
        jQuery.ajax(params);
    }
}
// Plus number quantiy product detail 
var plusQuantity = function () {
    if (jQuery('input[name="quantity"]').val() != undefined) {
        var currentVal = parseInt(jQuery('input[name="quantity"]').val());
        if (!isNaN(currentVal)) {
            jQuery('input[name="quantity"]').val(currentVal + 1);
        } else {
            jQuery('input[name="quantity"]').val(1);
        }
    } else {
        console.log('error: Not see elemnt ' + jQuery('input[name="quantity"]').val());
    }
    if ($('input[name="quantiti_mb"]').val() != undefined) {
        var currentVal = parseInt($('input[name="quantiti_mb"]').val());
        if (!isNaN(currentVal)) {
            $('input[name="quantiti_mb"]').val(currentVal + 1);
        } else {
            $('input[name="quantiti_mb"]').val(1);
        }
    }

}
// Minus number quantiy product detail 
var minusQuantity = function () {
    if (jQuery('input[name="quantity"]').val() != undefined) {
        var currentVal = parseInt(jQuery('input[name="quantity"]').val());
        if (!isNaN(currentVal) && currentVal > 1) {
            jQuery('input[name="quantity"]').val(currentVal - 1);
        }
    } else {
        console.log('error: Not see elemnt ' + jQuery('input[name="quantity"]').val());
    }
    if ($('input[name="quantiti_mb"]').val() != undefined) {
        var currentVal = parseInt($('input[name="quantiti_mb"]').val());
        if (!isNaN(currentVal) && currentVal > 1) {
            $('input[name="quantiti_mb"]').val(currentVal - 1);
        }
    }
}
// Modal Cart
function getCartModal() {
    var cart = null;
    jQuery('#cartform').hide();
    jQuery('#myCart #exampleModalLabel').text("Giá» hĂ ng");
    jQuery.getJSON('/cart.js', function (cart, textStatus) {
        if (cart) {
            jQuery('#cartform').show();
            jQuery('.line-item:not(.original)').remove();
            jQuery.each(cart.items, function (i, item) {
                var total_line = 0;
                var total_line = item.quantity * item.price;
                tr = jQuery('.original').clone().removeClass('original').appendTo('table#cart-table tbody');
                if (item.image != null)
                    tr.find('.item-image').html("<img src=" + Haravan.resizeImage(item.image, 'small') + ">");
                else
                    tr.find('.item-image').html("<img src='//theme.hstatic.net/200000065946/1001187274/14/no_image.jpg?v=582'>");
                vt = item.variant_options;
                if (vt.indexOf('Default Title') != -1)
                    vt = '';
                tr.find('.item-title').children('a').html(item.product_title + '<br><span>' + vt + '</span>').attr('href', item.url);
                tr.find('.item-quantity').html("<input id='quantity1' name='updates[]' min='1' type='number' value=" + item.quantity + " class='' />");
                if (typeof (formatMoney) != 'undefined') {
                    tr.find('.item-price').html(Haravan.formatMoney(total_line, formatMoney));
                } else {
                    tr.find('.item-price').html(Haravan.formatMoney(total_line, ''));
                }
                tr.find('.item-delete').html("<a href='javascript:void(0);' onclick='deleteCart(" + (i + 1) + ")' ><i class='fa fa-times'></i></a>");
            });
            jQuery('.item-total').html(Haravan.formatMoney(cart.total_price, formatMoney));
            jQuery('.modal-title').children('b').html(cart.item_count);
            jQuery('.count-holder').html(cart.item_count);
            if (cart.item_count == 0) {
                jQuery('#exampleModalLabel').html('Giá» hĂ ng cá»§a báº¡n Ä‘ang trá»‘ng. Má»i báº¡n tiáº¿p tá»¥c mua hĂ ng.');
                jQuery('#cart-view').html('<td class="mini_cart_header"><svg width="81" height="70" viewBox="0 0 81 70"><g transform="translate(0 2)" stroke-width="4" stroke="#333333" fill="none" fill-rule="evenodd"><circle stroke-linecap="square" cx="34" cy="60" r="6"></circle><circle stroke-linecap="square" cx="67" cy="60" r="6"></circle><path d="M22.9360352 15h54.8070373l-4.3391876 30H30.3387146L19.6676025 0H.99560547"></path></g></svg><p>Hiá»‡n chÆ°a cĂ³ sáº£n pháº©m</p></td>	');
                jQuery('#cartform').hide();
            } else {
                jQuery('#exampleModalLabel').html('Báº¡n cĂ³ ' + cart.item_count + ' sáº£n pháº©m trong giá» hĂ ng.');
                jQuery('#cartform').removeClass('hidden');
                jQuery('#cart-view').html('');
            }
            if (jQuery('#cart-pos-product').length > 0) {
                jQuery('#cart-pos-product span').html(cart.item_count + ' sáº£n pháº©m');
            }
            // Get product for cart view

            jQuery.each(cart.items, function (i, item) {
                clone_item(item, i);
            });
            jQuery('#total-view-cart').html(Haravan.formatMoney(cart.total_price, formatMoney));
        } else {
            jQuery('#exampleModalLabel').html('Giá» hĂ ng cá»§a báº¡n Ä‘ang trá»‘ng. Má»i báº¡n tiáº¿p tá»¥c mua hĂ ng.');
            if (jQuery('#cart-pos-product').length > 0) {
                jQuery('#cart-pos-product span').html(cart.item_count + ' sáº£n pháº©m');
            }
            jQuery('#cart-view').html('<tr><td>Hiá»‡n chÆ°a cĂ³ sáº£n pháº©m</td></tr>');
            jQuery('#cartform').hide();
        }
    });

    if ($('#site-header').hasClass('hSticky')) {
        setTimeout(function () {
            $('.wrapper-cart').addClass('show-action');
            $('body').addClass('locked-scroll');
            $('.main-header').addClass('hSticky').addClass('hSticky-nav').addClass('hSticky-up');
        }, 600);
    } else {
        $('.wrapper-cart').addClass('show-action');
        $('body').addClass('locked-scroll');
        jQuery('html, body').animate({
            scrollTop: 0
        }, 600);
    }
}
//clone item cart
function clone_item(product, i) {
    var item_product = $('#clone-item-cart').find('.list-item');
    if (product.image == null) {
        item_product.find('img').attr('src', '//theme.hstatic.net/200000065946/1001187274/14/no_image.jpg?v=582').attr('alt', product.url);
    } else {
        item_product.find('img').attr('src', Haravan.resizeImage(product.image, 'small')).attr('alt', product.url);
    }
    item_product.find('a:not(.remove-cart)').attr('href', product.url).attr('title', product.url);
    item_product.find('.pro-title-view').html(product.title);
    item_product.find('.pro-quantity-view').html(product.quantity);
    item_product.find('.pro-price-view').html(Haravan.formatMoney(product.price, formatMoney));
    if (product.price_original > product.price) {
        item_product.find('.cart_mini_compare').html(Haravan.formatMoney(product.price_original, formatMoney));
    }
    console.log(product)
    item_product.find('.remove-cart').html("<a href='javascript:void(0);' onclick='deleteCart(" + (i + 1) + ")' ><i class='fa fa-times'></i></a>");
    var title = '';
    if (product.variant_options.indexOf('Default Title') == -1) {
        $.each(product.variant_options, function (i, v) {
            title = title + v + ' / ';
        });
        title = title + '@@';
        title = title.replace(' / @@', '')
        item_product.find('.variant').html(title);
    } else {
        item_product.find('.variant').html('');
    }
    item_product.clone().removeClass('hidden').prependTo('#cart-view');
}
// Delete variant in modalCart
function deleteCart(line) {
    var params = {
        type: 'POST',
        url: '/cart/change.js',
        data: 'quantity=0&line=' + line,
        dataType: 'json',
        success: function (cart) {
            getCartModal();
        },
        error: function (XMLHttpRequest, textStatus) {
            Haravan.onError(XMLHttpRequest, textStatus);
        }
    };
    jQuery.ajax(params);
}
//box account
function boxAccount(type) {
    $('.site_account .js-link').removeClass('is-selected');
    $(`.site_account .js-link[aria-controls="${type}"]`).addClass('is-selected');
    $('.site_account .site_account_panel_list .site_account_panel ').addClass('d-none');
    $('.site_account .site_account_panel_list .site_account_panel ').removeClass('is-selected');
    $(`.site_account .site_account_panel_list .site_account_panel#${type}`).removeClass('d-none');
    $(`.site_account .site_account_panel_list .site_account_panel#${type}`).addClass('is-selected');
    var newheight = $(`.site_account .site_account_panel_list .site_account_panel#${type}`).addClass('is-selected').height();
    if ($('.site_account_panel').hasClass('is-selected')) {
        $('.site_account_panel_list').css("height", newheight);
    }
}
;
// Update product in modalCart
jQuery(document).on("click", "#update-cart-modal", function (event) {
    event.preventDefault();
    if (jQuery('#cartform').serialize().length <= 5)
        return;
    jQuery(this).html('Äang cáº­p nháº­t');
    var params = {
        type: 'POST',
        url: '/cart/update.js',
        data: jQuery('#cartform').serialize(),
        dataType: 'json',
        success: function (cart) {
            if ((typeof callback) === 'function') {
                callback(cart);
            } else {
                getCartModal();
            }
            jQuery('#update-cart-modal').html('Cáº­p nháº­t');
        },
        error: function (XMLHttpRequest, textStatus) {
            Haravan.onError(XMLHttpRequest, textStatus);
        }
    };
    jQuery.ajax(params);
});
/* fixHeightProduct */
function fixHeightProduct(data_parent, data_target, data_image) {
    var box_height = 0;
    var box_image = 0;
    var boxtarget = data_parent + ' ' + data_target;
    var boximg = data_parent + ' ' + data_target + ' ' + data_image;
    jQuery(boximg).css('height', 'auto');
    jQuery($(boxtarget)).css('height', 'auto');
    jQuery($(boxtarget)).removeClass('fixheight');
    jQuery($(boxtarget)).each(function () {
        if (jQuery(this).find(data_image + ' .lazyloaded').height() > box_image) {
            box_image = jQuery(this).find($(data_image)).height();
        }
    });
    if (box_image > 0) {
        jQuery(boximg).height(box_image);
    }
    jQuery($(boxtarget)).each(function () {
        if (jQuery(this).height() > box_height) {
            box_height = jQuery(this).height();
        }
    });
    jQuery($(boxtarget)).addClass('fixheight');
    if (box_height > 0) {
        jQuery($(boxtarget)).height(box_height);
    }
    try {
        fixheightcallback();
    } catch (ex) {
    }
}
document.addEventListener('lazyloaded', function (e) {
    // Image Product Loaded fix height
    fixHeightProduct('.wrapper-collection-1 .content-product-list', '.product-resize', '.image-resize');
    if (jQuery(window).width() > 991) {
        jQuery(window).resize(function () {
            fixHeightProduct('.wrapper-collection-1 .content-product-list', '.product-resize', '.image-resize');
        });
    }
    fixHeightProduct('.wrapper-collection-2 .content-product-list', '.product-resize', '.image-resize');
    if (jQuery(window).width() > 991) {
        jQuery(window).resize(function () {
            fixHeightProduct('.wrapper-collection-2 .content-product-list', '.product-resize', '.image-resize');
        });
    }
    fixHeightProduct('#collection-body .content-product-list', '.product-resize', '.image-resize');
    if (jQuery(window).width() > 991) {
        jQuery(window).resize(function () {
            fixHeightProduct('#collection-body .content-product-list', '.product-resize', '.image-resize');
        });
    }
    fixHeightProduct('.list-productRelated .content-product-list', '.product-resize', '.image-resize');
    if (jQuery(window).width() > 991) {
        jQuery(window).resize(function () {
            fixHeightProduct('.list-productRelated .content-product-list', '.product-resize', '.image-resize');
        });
    }
    fixHeightProduct('.search-list-results .content-product-list', '.product-resize', '.image-resize');
    if (jQuery(window).width() > 991) {
        jQuery(window).resize(function () {
            fixHeightProduct('.search-list-results .content-product-list', '.product-resize', '.image-resize');
        });
    }
});
jQuery(document).ready(function () {
    //if (f1genzPS && template.indexOf('index') > -1) {
    if (template.indexOf('index') > -1) {
        if ($("#homeCarousel-banner").length > 0) {
            $('#homeCarousel-banner .owl-carousel').owlCarousel({
                items: 1,
                nav: true,
                dots: true,
                lazyLoad: true,
                touchDrag: true,
                autoplay: true,
                loop: $("#homeCarousel-banner .item").length > 1 ? true : false,
                animateIn: 'fadeIn', animateOut: 'fadeOut'
            });
            $('#homeCarousel-banner .owl-carousel').find('.owl-next').html('<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 31.49 31.49" style="enable-background:new 0 0 31.49 31.49;" xml:space="preserve"> <path d="M21.205,5.007c-0.429-0.444-1.143-0.444-1.587,0c-0.429,0.429-0.429,1.143,0,1.571l8.047,8.047H1.111 C0.492,14.626,0,15.118,0,15.737c0,0.619,0.492,1.127,1.111,1.127h26.554l-8.047,8.032c-0.429,0.444-0.429,1.159,0,1.587 c0.444,0.444,1.159,0.444,1.587,0l9.952-9.952c0.444-0.429,0.444-1.143,0-1.571L21.205,5.007z"/> <g> </g></svg>');
            $('#homeCarousel-banner .owl-carousel').find('.owl-prev').html('<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve"> <g> <g> <path d="M491.318,235.318H20.682C9.26,235.318,0,244.578,0,256c0,11.423,9.26,20.682,20.682,20.682h470.636 c11.423,0,20.682-9.259,20.682-20.682C512,244.578,502.741,235.318,491.318,235.318z" /> </g> </g> <g> <g> <path d="M49.932,256L211.795,94.136c8.077-8.077,8.077-21.172,0-29.249c-8.077-8.076-21.172-8.076-29.249,0L6.058,241.375 c-8.077,8.077-8.077,21.172,0,29.249l176.488,176.488c4.038,4.039,9.332,6.058,14.625,6.058c5.293,0,10.587-2.019,14.625-6.058 c8.077-8.077,8.077-21.172,0-29.249L49.932,256z" /> </g> </g> </svg>');
        }
        if ($("#homeCarousel-category").length > 0) {
            $('#homeCarousel-category').owlCarousel({
                items: 3,
                nav: true,
                dots: false,
                margin: 10,
                responsive: {
                    0: {
                        items: 1,
                        margin: 15,
                        stagePadding: 50,
                    },
                    768: {
                        items: 2,
                        margin: 15
                    },
                    992: {
                        items: 3,
                        margin: 30
                    },
                    1200: {
                        items: 3,
                        margin: 30
                    }
                },
                pagination: false,
                slideSpeed: 500,
                addClassActive: true,
                scrollPerPage: false,
                touchDrag: true,
                autoplay: true,
                loop: true,
                lazyLoad: true,
            });
            $('#homeCarousel-category').find('.owl-next').html('<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 31.49 31.49" style="enable-background:new 0 0 31.49 31.49;" xml:space="preserve"> <path d="M21.205,5.007c-0.429-0.444-1.143-0.444-1.587,0c-0.429,0.429-0.429,1.143,0,1.571l8.047,8.047H1.111 C0.492,14.626,0,15.118,0,15.737c0,0.619,0.492,1.127,1.111,1.127h26.554l-8.047,8.032c-0.429,0.444-0.429,1.159,0,1.587 c0.444,0.444,1.159,0.444,1.587,0l9.952-9.952c0.444-0.429,0.444-1.143,0-1.571L21.205,5.007z"/> <g> </g></svg>');
            $('#homeCarousel-category').find('.owl-prev').html('<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve"> <g> <g> <path d="M491.318,235.318H20.682C9.26,235.318,0,244.578,0,256c0,11.423,9.26,20.682,20.682,20.682h470.636 c11.423,0,20.682-9.259,20.682-20.682C512,244.578,502.741,235.318,491.318,235.318z" /> </g> </g> <g> <g> <path d="M49.932,256L211.795,94.136c8.077-8.077,8.077-21.172,0-29.249c-8.077-8.076-21.172-8.076-29.249,0L6.058,241.375 c-8.077,8.077-8.077,21.172,0,29.249l176.488,176.488c4.038,4.039,9.332,6.058,14.625,6.058c5.293,0,10.587-2.019,14.625-6.058 c8.077-8.077,8.077-21.172,0-29.249L49.932,256z" /> </g> </g> </svg>');
        }
        if ($('#collection-slide').length > 0) {
            jQuery('#collection-slide').owlCarousel({
                items: 4,
                nav: true,
                dots: false,
                margin: 10,
                lazyLoad: true,
                responsive: {
                    0: {
                        items: 2,
                        margin: 8,
                        stagePadding: 15,
                        nav: false
                    },
                    768: {
                        items: 2,
                        margin: 15
                    },
                    992: {
                        items: 4,
                        margin: 30
                    },
                    1200: {
                        items: 4,
                        margin: 30
                    }
                },
                pagination: false,
                slideSpeed: 800,
                addClassActive: true,
                scrollPerPage: false,
                touchDrag: true,
                autoplay: false,
                loop: false,
            });
            $('#collection-slide').find('.owl-next').html('<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 31.49 31.49" style="enable-background:new 0 0 31.49 31.49;" xml:space="preserve"> <path d="M21.205,5.007c-0.429-0.444-1.143-0.444-1.587,0c-0.429,0.429-0.429,1.143,0,1.571l8.047,8.047H1.111 C0.492,14.626,0,15.118,0,15.737c0,0.619,0.492,1.127,1.111,1.127h26.554l-8.047,8.032c-0.429,0.444-0.429,1.159,0,1.587 c0.444,0.444,1.159,0.444,1.587,0l9.952-9.952c0.444-0.429,0.444-1.143,0-1.571L21.205,5.007z"/> <g> </g></svg>');
            $('#collection-slide').find('.owl-prev').html('<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve"> <g> <g> <path d="M491.318,235.318H20.682C9.26,235.318,0,244.578,0,256c0,11.423,9.26,20.682,20.682,20.682h470.636 c11.423,0,20.682-9.259,20.682-20.682C512,244.578,502.741,235.318,491.318,235.318z" /> </g> </g> <g> <g> <path d="M49.932,256L211.795,94.136c8.077-8.077,8.077-21.172,0-29.249c-8.077-8.076-21.172-8.076-29.249,0L6.058,241.375 c-8.077,8.077-8.077,21.172,0,29.249l176.488,176.488c4.038,4.039,9.332,6.058,14.625,6.058c5.293,0,10.587-2.019,14.625-6.058 c8.077-8.077,8.077-21.172,0-29.249L49.932,256z" /> </g> </g> </svg>');
        }
        if ($('#logo-slide').length > 0) {
            jQuery('#logo-slide').owlCarousel({
                items: 10,
                nav: false,
                dots: false,
                lazyLoad: true,
                autoplayTimeout: 1000,
                autoplaySpeed: 2000,
                responsive: {
                    0: {
                        items: 3,
                        margin: 15
                    },
                    480: {
                        items: 3,
                        margin: 15
                    },
                    768: {
                        items: 4,
                        margin: 15
                    },
                    992: {
                        items: 5,
                        margin: 30
                    },
                    1200: {
                        items: 5,
                        margin: 30
                    }
                },
                pagination: false,
                slideSpeed: 1000,
                addClassActive: true,
                scrollPerPage: false,
                touchDrag: true,
                autoplay: true,
                loop: true,
            });
        }
        if ($('.list-review').length > 0) {

            jQuery('.list-review').owlCarousel({
                items: 3,
                nav: false,
                dots: false,
                lazyLoad: true,
                autoplayTimeout: 1000,
                autoplaySpeed: 5000,
                responsive: {
                    0: {
                        items: 2
                    },
                    480: {
                        items: 2
                    },
                    768: {
                        items: 4
                    },
                    992: {
                        items: 4
                    },
                    1200: {
                        items: 4
                    }
                },
                pagination: false,
                slideSpeed: 1000,
                addClassActive: true,
                scrollPerPage: false,
                touchDrag: true,
                autoplay: true,
                loop: true,
            });
        }
        if ($('.list-blogs').length > 0) {

            jQuery('.list-blogs').owlCarousel({
                items: 3,
                nav: true,
                navText: ['<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve"> <g> <g> <path d="M491.318,235.318H20.682C9.26,235.318,0,244.578,0,256c0,11.423,9.26,20.682,20.682,20.682h470.636 c11.423,0,20.682-9.259,20.682-20.682C512,244.578,502.741,235.318,491.318,235.318z" /> </g> </g> <g> <g> <path d="M49.932,256L211.795,94.136c8.077-8.077,8.077-21.172,0-29.249c-8.077-8.076-21.172-8.076-29.249,0L6.058,241.375 c-8.077,8.077-8.077,21.172,0,29.249l176.488,176.488c4.038,4.039,9.332,6.058,14.625,6.058c5.293,0,10.587-2.019,14.625-6.058 c8.077-8.077,8.077-21.172,0-29.249L49.932,256z" /> </g> </g> </svg>', '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 31.49 31.49" style="enable-background:new 0 0 31.49 31.49;" xml:space="preserve"> <path d="M21.205,5.007c-0.429-0.444-1.143-0.444-1.587,0c-0.429,0.429-0.429,1.143,0,1.571l8.047,8.047H1.111 C0.492,14.626,0,15.118,0,15.737c0,0.619,0.492,1.127,1.111,1.127h26.554l-8.047,8.032c-0.429,0.444-0.429,1.159,0,1.587 c0.444,0.444,1.159,0.444,1.587,0l9.952-9.952c0.444-0.429,0.444-1.143,0-1.571L21.205,5.007z"/> <g> </g></svg>'],
                dots: false,
                lazyLoad: true,
                autoplayTimeout: 5000,
                autoplaySpeed: 5000,
                responsive: {
                    0: {
                        items: 2
                    },
                    480: {
                        items: 2
                    },
                    768: {
                        items: 3
                    },
                    992: {
                        items: 3
                    },
                    1200: {
                        items: 3
                    }
                },
                pagination: false,
                slideSpeed: 5000,
                addClassActive: true,
                scrollPerPage: false,
                touchDrag: true,
                autoplay: true,
                loop: true,
            });
        }
    }
    if (jQuery(window).width() < 768) {
        jQuery('.mainFooter .footer-container .footer-title').on('click', function () {
            jQuery(this).toggleClass('active').parent().find('.footer-content').stop().slideToggle('medium');
        });
    }
    if (f1genzPS && template.indexOf('collection') > -1) {
        if (jQuery(window).width() < 992 && $('.box_sidebar').length > 0) {
            $('.collection_fillterby .layer_filter-title').on('click', function () {
                $(this).toggleClass('color_svg');
                $('.layer_filter-container .layer_filter-group').slideToggle('medium');
            });
            $('.filter_group_title').on('click', function () {
                if ($(this).hasClass('active')) {
                    $(this).removeClass('active')
                    $(this).parent().find('.filter_group_content').slideUp(200);
                } else {
                    $('.filter_group_title').removeClass('active');
                    $('.filter_group_content').slideUp(200);
                    $(this).addClass('active');
                    $(this).parent().find('.filter_group_content').slideDown(200);
                }
                //jQuery(this).toggleClass('active').parent().find('.filter_group_content').stop().slideToggle('medium');

            });
        }
    }
    $('.header-action-toggle').click(function (e) {
        e.preventDefault();
        if ($(this).parents('.header-action').hasClass('show-action')) {
            $('body').removeClass('locked-scroll');
            $(this).parents('.header-action').removeClass('show-action');
        } else {
            $('.header-action').removeClass('show-action');
            $('body').addClass('locked-scroll');
            $(this).parents('.header-action').addClass('show-action');
        }
    });
    $('body').on('click', '#site-overlay', function (e) {
        $('body').removeClass('locked-scroll');
        $('.header-action').removeClass('show-action');
    });
    /* click box account*/
    $('body').on('click', '.js-link', function (e) {
        e.preventDefault();
        boxAccount($(this).attr('aria-controls'));
    });
    $('.site_account input').blur(function () {
        var tmpval = $(this).val();
        if (tmpval == '') {
            $(this).removeClass('is-filled');
        } else {
            $(this).addClass('is-filled');
        }
    });
    /* menu mobile*/
    $('.sub-child li a').click(function (e) {
        if ($(this).find('i').length) {
            e.preventDefault();
            var menu_child_id = $(this).parent().data('menu-root');
            $('.sub-child').addClass('mm-subopened');
            $('#' + menu_child_id).addClass('mm-opened');
        }
    })
    $('.menuList-sub li:first-child a').click(function () {
        $(this).parents('.menuList-sub').removeClass('mm-opened');
        $('.menuList-sub').removeClass('mm-subopened');
    })
    $('.menuList-sub li.level-2 a').click(function (e) {
        if ($(this).find('i').length) {
            e.preventDefault();
            var menu_sub_id = $(this).parent().data('menu-root');
            $('li.level-2').addClass('mm-subopened');
            $('#' + menu_sub_id).addClass('mm-sub');
        }
    });
    $('.menuList-sub li:first-child a').click(function () {
        $(this).parents('.menuList-sub').removeClass('mm-sub');
        $('.menuList-sub').removeClass('mm-subopened');
    });
    $(document).on("click", ".menuList-sub li.level-3 a", function (e) {
        if ($(this).find('i').length) {
            e.preventDefault();
            var menu_subnav_id = $(this).parent().data('menu-root');
            $('li.level-3').addClass('mm-open-3');
            $('#' + menu_subnav_id).addClass('mm-sub-3');
        }
    });
    $(document).on("click", ".menuList-sub li:first-child a", function (e) {
        $(this).parents('.menuList-sub').removeClass('mm-sub-3');
        $('.menuList-sub').removeClass('mm-open-3');
    });
    /* scroll menu top*/
    var $header = $('.main-header');
    var offset_sticky_header = $header.outerHeight() + 100;
    var offset_sticky_down = 0;
    jQuery(window).scroll(function () {
        /* scroll header */
        if (jQuery(window).scrollTop() > offset_sticky_header && jQuery(window).scrollTop() > offset_sticky_down) {
            if (jQuery(window).width() > 991) {
                $('body').removeClass('locked-scroll');
                $('.header-action').removeClass('show-action');
            }
            $header.addClass('hSticky');
            if (jQuery(window).scrollTop() > offset_sticky_header + 150) {
                $header.removeClass('hSticky-up').addClass('hSticky-nav');
            }
        } else {
            if (jQuery(window).scrollTop() > offset_sticky_header + 150 && (jQuery(window).scrollTop() - 150) + jQuery(window).height() < $(document).height()) {
                $header.addClass('hSticky-up');
            }
        }
        if (jQuery(window).scrollTop() <= offset_sticky_down && jQuery(window).scrollTop() <= offset_sticky_header) {
            $header.removeClass('hSticky-up').removeClass('hSticky-nav').removeClass('hSticky');
        }
        offset_sticky_down = jQuery(window).scrollTop();
    });
    /* add this sharing */
    if ($('.addThis_listSharing').length > 0) {
        $(window).scroll(function () {
            if (jQuery(window).scrollTop() > 100) {
                jQuery('.addThis_listSharing').addClass('is-show');
            } else {
                jQuery('.addThis_listSharing').removeClass('is-show');
            }
        });
        $('.content_popupform form.contact-form').submit(function (e) {
            e.preventDefault();
            var self = $(this);
            grecaptcha.ready(function () {
                grecaptcha.execute('6LdD18MUAAAAAHqKl3Avv8W-tREL6LangePxQLM-', {action: 'submit'}).then(function (token) {
                    self.prepend('<input type="hidden" name="g-recaptcha-response" value="' + token + '">');
                    $.ajax({
                        type: 'POST',
                        url: '/contact',
                        data: $('.content_popupform form.contact-form').serialize(),
                        success: function (data) {
                            $('.modal-contactform.fade.in').modal('hide');
                            setTimeout(function () {
                                $('.modal-succesform').modal('show');
                                setTimeout(function () {
                                    $('.modal-succesform.fade.in').modal('hide');
                                }, 5000);
                            }, 300);
                        },
                    })
                });
            });
        });
        $(".modal-succesform").on('hidden.bs.modal', function () {
            location.reload();
        });
    }
    if (jQuery(window).width() < 768 && $('.layoutProduct_scroll').length > 0) {
        var curScrollTop = 0;
        $(window).scroll(function () {
            var scrollTop = $(window).scrollTop();
            if (scrollTop > curScrollTop && scrollTop > 200) {
                $('.layoutProduct_scroll').removeClass('scroll-down').addClass('scroll-up');
            } else {
                if (scrollTop > 200 && scrollTop + $(window).height() + 150 < $(document).height()) {
                    $('.layoutProduct_scroll').removeClass('scroll-up').addClass('scroll-down');
                }
            }
            if (scrollTop < curScrollTop && scrollTop < 200) {
                $('.layoutProduct_scroll').removeClass('scroll-up').removeClass('scroll-down');
            }
            curScrollTop = scrollTop;
        });
    }
    /* submit form login header*/
    $('#header-login-panel form#customer_login').submit(function (e) {
        e.preventDefault();
        var self = $(this);
        grecaptcha.ready(function () {
            grecaptcha.execute('6LdD18MUAAAAAHqKl3Avv8W-tREL6LangePxQLM-', {action: 'submit'}).then(function (token) {
                self.prepend('<input type="hidden" name="g-recaptcha-response" value="' + token + '">');
                self.unbind('submit').submit();
            });
        });
    });
    $('#header-recover-panel form#customer_recover').submit(function (e) {
        e.preventDefault();
        var self = $(this);
        grecaptcha.ready(function () {
            grecaptcha.execute('6LdD18MUAAAAAHqKl3Avv8W-tREL6LangePxQLM-', {action: 'submit'}).then(function (token) {
                self.prepend('<input type="hidden" name="g-recaptcha-response" value="' + token + '">');
                self.unbind('submit').submit();
            });
        });
    });
    /* form new letter footer*/
    $('#form-newsletter form.contact-form').submit(function (e) {
        e.preventDefault();
        var self = $(this);
        grecaptcha.ready(function () {
            grecaptcha.execute('6LdD18MUAAAAAHqKl3Avv8W-tREL6LangePxQLM-', {action: 'submit'}).then(function (token) {
                self.prepend('<input type="hidden" name="g-recaptcha-response" value="' + token + '">');
                self.unbind('submit').submit();
            });
        });
    });
});
// Footer 
/* $(document).ready(function() {
 if (jQuery(window).width() < 768) {
 jQuery('.main-footer .footer-col .footer-title').on('click', function(){
 jQuery(this).toggleClass('active').parent().find('.footer-content').stop().slideToggle('medium');
 });
 // icon Footer
 $('a.btn-fter').click(function(e){
 if ( $(this).attr('aria-expanded') == 'false' ) {
 e.preventDefault();
 $(this).attr('aria-expanded','true');
 $('.main-footer').addClass('bg-active');
 } else {
 $(this).attr('aria-expanded','false');
 $('.main-footer').removeClass('bg-active');
 }
 });
 }
 });*/
// Mainmenu sidebar
$(document).on("click", "span.icon-subnav", function () {
    if ($(this).parent().hasClass('active')) {
        $(this).parent().removeClass('active');
        $(this).siblings('ul').slideUp();
    } else {
        if ($(this).parent().hasClass("level0") || $(this).parent().hasClass("level1")) {
            $(this).parent().siblings().find("ul").slideUp();
            $(this).parent().siblings().removeClass("active");
        }
        $(this).parent().addClass('active');
        $(this).siblings('ul').slideDown();
    }
});
/* Menu sidebar */
$('.plus-nClick1').click(function (e) {
    e.preventDefault();
    $(this).parents('.level0').toggleClass('opened');
    $(this).parents('.level0').children('ul').slideToggle(200);
});
$('.plus-nClick2').click(function (e) {
    e.preventDefault();
    $(this).parents('.level1').toggleClass('opened');
    $(this).parents('.level1').children('ul').slideToggle(200);
});
$('.plus-nClick3').click(function (e) {
    e.preventDefault();
    $(this).parents('.level2').toggleClass('opened');
    $(this).parents('.level2').children('ul').slideToggle(200);
});
//Click event to scroll to top
/*jQuery(document).on("click", ".back-to-top", function(){
 jQuery(this).removeClass('show');
 jQuery('html, body').animate({
 scrollTop: 0			
 }, 800);
 });*/
$('a[data-spy=scroll]').click(function () {
    event.preventDefault();
    $('body').animate({scrollTop: ($($(this).attr('href')).offset().top - 20) + 'px'}, 500);
})
function smoothScroll(a, b) {
    $('body,html').animate({
        scrollTop: a
    }, b);
}
// Buynow
var buy_now = function (id) {
    var quantity = 1;
    var params = {
        type: 'POST',
        url: '/cart/add.js',
        data: 'quantity=' + quantity + '&id=' + id,
        dataType: 'json',
        success: function (line_item) {
            window.location = '/checkout';
        },
        error: function (XMLHttpRequest, textStatus) {
            Haravan.onError(XMLHttpRequest, textStatus);
        }
    };
    jQuery.ajax(params);
}

var buy_now_product = function (id, quanti) {
    var params = {
        type: 'POST',
        url: '/cart/add.js',
        data: 'quantity=' + quanti + '&id=' + id,
        dataType: 'json',
        success: function (line_item) {
            window.location = '/checkout';
        },
        error: function (XMLHttpRequest, textStatus) {
            Haravan.onError(XMLHttpRequest, textStatus);
        }
    };
    jQuery.ajax(params);
}


// Dropdown Title
jQuery('.title_block').click(function () {
    $(this).toggleClass('active').next().slideToggle('medium');
});
/* Search ultimate destop -mobile*/
$('.ultimate-search').submit(function (e) {
    e.preventDefault();
    var q = $(this).find('input[name=q]').val();
    if (q.indexOf('script') > -1 || q.indexOf('>') > -1) {
        alert('Tá»« khĂ³a cá»§a báº¡n cĂ³ chá»©a mĂ£ Ä‘á»™c háº¡i ! Vui lĂ²ng nháº­p láº¡i key word khĂ¡c');
        $(this).find('input[name=q]').val('');
    } else {
        var q_follow = 'product';
        var query = encodeURIComponent(q);
        if (!q) {
            window.location = '/search?type=' + q_follow + '&q=';
            return;
        } else {
            window.location = '/search?type=' + q_follow + '&q=' + query + '&sortby=sold_quantity:product=desc';
            return;
        }
    }
});
/******************/
var $input = $('.ultimate-search input[type="text"]');
$input.bind('keyup change paste propertychange', function () {
    var key = $(this).val(),
            $parent = $(this).parents('.wpo-wrapper-search'),
            $results = $(this).parents('.wpo-wrapper-search').find('.smart-search-wrapper');
    if (key.indexOf('script') > -1 || key.indexOf('>') > -1) {
        alert('Tá»« khĂ³a cá»§a báº¡n cĂ³ chá»©a mĂ£ Ä‘á»™c háº¡i ! Vui lĂ²ng nháº­p láº¡i key word khĂ¡c');
        $(this).val('');
    } else {
        if (key.length > 0) {
            $('.ultimate-search input[type="text"]').val($(this).val());
            $(this).attr('data-history', key);
            var q_follow = 'product',
                    str = '';
            str = '/search?type=product&q=' + key + '&view=ultimate-product';
            $.ajax({
                url: str,
                type: 'GET',
                async: true,
                success: function (data) {
                    $results.find('.resultsContent').html(data);
                }
            })
            $(".search-bar-mobile .ultimate-search").addClass("expanded");
            $results.fadeIn();
        } else {
            $(".search-bar-mobile .ultimate-search").removeClass("expanded");
            $results.fadeOut();
        }
    }
})

$('input[name="follow"]').on('change', function () {
    $('.ultimate-search input[type="text"]').trigger('change');
})
$('input[name="follow_mobile"]').on('change', function () {
    $('.ultimate-search input[type="text"]').trigger('change');
})
$('body').click(function (evt) {
    var target = evt.target;
    if (target.id !== 'ajaxSearchResults' && target.id !== 'inputSearchAuto') {
        $("#ajaxSearchResults").hide();
    }
    if (target.id !== 'ajaxSearchResults-mb' && target.id !== 'inputSearchAuto-mb') {
        $("#ajaxSearchResults-mb").hide();
    }
    if (target.id !== 'ajaxSearchResults-dk' && target.id !== 'inputSearchAuto-dk') {
        $("#ajaxSearchResults-dk").hide();
    }
});
$('body').on('click', '.ultimate-search input[type="text"]', function () {
    if ($(this).is(":focus")) {
        if ($(this).val() != '') {
            $(".ajaxSearchResults").show();
        }
    } else {
    }
})
$('body').on('click', '.search-bar-mobile .ultimate-search input[type="text"]', function () {
    $('.header-action').removeClass('show-action');
    $('body').removeClass('locked-scroll');
});
$('body').on('click', '.ultimate-search .close-search', function (e) {
    e.preventDefault();
    $(".ajaxSearchResults").hide();
    $(".ultimate-search").removeClass("expanded");
    $(".ultimate-search").find('input[name=q]').val('');
})

// Add to cart
/*$(document).on('click','.add-to-cart', function() {
 var min_qty = 1;
 var variant_id = $(this).attr('data-variantid');
 var params = {
 type: 'POST',
 url: '/cart/add.js',
 async: true,
 data: 'quantity=' + min_qty + '&id=' + variant_id,
 dataType: 'json',
 success: function(line_item) {
 if (template.indexOf('cart') > -1) {
 window.location.reload();
 } else {
 getCartModal();
 }
 },
 error: function(XMLHttpRequest, textStatus) {
 Haravan.onError(XMLHttpRequest, textStatus);
 }
 };
 jQuery.ajax(params);
 });*/
/*=======================================*/

$("body").on('mouseenter', '.product-color-select-item', function () {
    $(this).parents('.product-color-select').children('.product-color-select').removeClass('active');
    $(this).parent('.product-color-select').addClass('active');
    var ite = $(this).parents('.product-loop-variants').siblings('.product-img');
    var hr = $(this).attr('value');
    ite.find('.sw-loop-img').removeClass('d-block').addClass('d-none');
    ite.find('.sw-loop-img[data-color="' + hr + '"]').addClass('d-block');
});

$("body").on('click', '.product-color-select-item', function () {
    $(this).parents('.product-color-select').children('.product-color-select').removeClass('active');
    $(this).parent('.product-color-select').addClass('active');
    var ite = $(this).parents('.product-loop-variants').siblings('.product-img');
    var hr = $(this).attr('value');
    ite.find('.sw-loop-img').removeClass('d-block').addClass('d-none');
    ite.find('.sw-loop-img[data-color="' + hr + '"]').addClass('d-block');
});



if ($(window).width() < 768) {
    $('.product-color-select-item').on('click', function (e) {
        e.preventDefault();
        var srcImg = $(this).find('img').attr('data-image');
        var srcImg1 = srcImg.replace('thumb', 'grande');
        var srcImg2 = srcImg.replace('thumb', 'large');
        var target = $(this).parents('.single-product').find('picture:eq(0)');
        target.find('source:eq(0)').attr('srcset', srcImg2);
        target.find('source:eq(1)').attr('srcset', srcImg1);
        target.find('img').attr('src', srcImg1);
    });
    $(".loop-two-img").remove();
}
$('.product-color-select-item').hover(
        function () {
            var srcImg = $(this).find('img').attr('data-image');
            var srcImg1 = srcImg.replace('thumb', 'grande');
            var srcImg2 = srcImg.replace('thumb', 'large');
            var target = $(this).parents('.single-product').find('picture:eq(1)');
            target.find('source:eq(0)').attr('srcset', srcImg2);
            target.find('source:eq(1)').attr('srcset', srcImg1);
            target.find('img').attr('src', srcImg1);
        },
        function () {

        }
);



