<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dịch vụ</title>
        <link rel="icon" href="image/logoshop.png" type="image/png">
        <meta name="description"
              content="Nội Thất MOHO an toàn sức khỏe, chất lượng quốc tế với nhiều đồ gỗ nội thất hiện đại cho phòng khách, phòng ăn, phòng ngủ, phòng làm việc, văn phòng và tủ bếp." />
        <link rel="preload stylesheet" as="style" fetchpriority="low"
              href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
        <link rel="preload stylesheet" as="style" fetchpriority="low"
              href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />

        <link rel="preload stylesheet" as="style" fetchpriority="low" href="css/style-theme.scss.css">
        <link rel="stylesheet" href="css/style.css">
        <!--+++++++++++++++++++++++++  JS ++++++++++++++++++++++++-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script defer fetchpriority="low" src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"></script>

        <script defer fetchpriority="low" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>


        <style>
            img {
                max-width: 100%;
                height: auto;
            }

            .w-100 {
                width: 100% !important;
            }

            .d-flex-owl {
                display: flex !important;
                overflow: hidden !important;
            }

            .d-flex-owl>* {
                min-width: 100% !important;
            }

            .rating {
                position: relative;
                display: inline-block;
                font-size: 24px;
                line-height: 1;
            }

            .rating::before {
                content: "★★★★★";
                color: #e3e3e3;
                /* Màu của sao không được đánh giá */
            }

            .rating::after {
                content: "★★★★★";
                color: #ffc107;
                /* Màu của sao được đánh giá */
                position: absolute;
                top: 0;
                left: 0;
                white-space: nowrap;
                overflow: hidden;
                width: 0;
            }

            .num-reviews {
                font-size: 14px;
                /* Kích thước chữ của số lượng đánh giá */
                color: #333;
                /* Màu chữ của số lượng đánh giá */
            }


            .product-addtocart {
                display: inline-block;
                margin-left: 50px;
            }

            .cart-button {
                background-color: orange;
                /* Màu cam */
                padding: 10px 15px;
                border-radius: 5px;
                text-decoration: none;
                color: white;
                display: flex;
                align-items: center;
            }

            .cart-button:hover {
                background-color: darkorange;
                /* Màu cam khi di chuột vào */
            }

            .cart-button svg {
                margin-right: 5px;
            }

            .product-quantity{
                display: flex;
                justify-content: space-evenly;
                align-items: center;
            }

        </style>

        <style>
            .color-checkbox {
                display: inline-block;
                cursor: pointer;
                margin: 5px;
            }

            .color-circle {
                width: 20px;
                height: 20px;
                border-radius: 50%;
                display: inline-block;
                border: 2px solid #ddd;
                box-sizing: border-box;
            }

            .color-checkbox input[type="checkbox"]:checked + .color-circle {
                border: 2px solid #000;
            }

            .check-box-list li input[type="radio"]:checked + label {
                background-color: #007bff;
                color: #fff;
                border: 1px solid #0056b3;
                box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
                font-weight: bold;
            }

            .check-box-list li label:hover {
                background-color: #e0e0e0;
            }
        </style>
    </head>

    <body id="nội-thất-moho" class="collection">
        <div class="main-body  layoutProduct_scroll ">
            <%@ include file="HomeHeader.jsp" %>
            <style>
                .dangongu {
                    display: none
                }
            </style>

            <main class="mainContent-theme">
                <div class="breadcrumb-shop">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pd5  ">
                                <ol class="breadcrumb breadcrumb-arrows" itemscope
                                    itemtype="http://schema.org/BreadcrumbList">
                                    <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                                        <a href="/" target="_self" itemprop="item" content="https://moho.com.vn"><span
                                                itemprop="name">Trang chủ</span></a>
                                        <meta itemprop="position" content="1" />
                                    </li>

                                    <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                                        <a href="https://moho.com.vn/collections/all" target="_self">
                                            <span itemprop="item" content="https://moho.com.vn/collections/all"><span
                                                    itemprop="name">Dịch vụ</span></span>
                                        </a>
                                        <meta itemprop="position" content="2" />
                                    </li>

                                </ol>
                            </div>
                        </div>

                    </div>
                </div>

                <div id="collection" class="collection-page">
                    <div class="main-content">
                        <div class="container">
                            <div class="row wrapper-row pd-page">
                                <div class="col-md-12 col-sm-12 col-xs-12 col-md-push-0">
                                    <div class="page-wrapper">
                                        <div class="heading-page">
                                            <h1>${pageShow.name}</h1>
                                        </div>
                                        <div class="wrapbox-content-page">
                                            <div class="content-page ">
                                                ${pageShow.content}
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>

        <%@ include file="HomeFooter.jsp" %>
        <div class="addThis_listSharing hidden-xs">
            <ul class="addThis_listing">
            </ul>
        </div>
        <div class="actionToolbar_mobile visible-xs ">
            <ul class="actionToolbar_listing">

            </ul>
        </div>

        <div id="site-overlay" class="site-overlay"></div>
        <script>
            function updateRatings() {
                var ratingContainers = document.querySelectorAll('.rating-container');
                ratingContainers.forEach(function (container) {
                    var ratingValue = parseFloat(container.getAttribute('data-rating'));
                    var numReviews = container.getAttribute('data-num-reviews');

                    // Cập nhật chiều rộng của sao đã đánh giá
                    var ratingElement = container.querySelector('.rating');
                    var starPercentage = (ratingValue / 5) * 100;
                    ratingElement.style.setProperty('--rating-width', starPercentage + '%');

                    // Cập nhật số lượng đánh giá
                    var numReviewsElement = container.querySelector('.num-reviews');
                    numReviewsElement.textContent = '(' + numReviews + ')';
                });
            }

// Gọi hàm khi trang đã tải
            document.addEventListener('DOMContentLoaded', function () {
                updateRatings();
            });

            document.addEventListener('DOMContentLoaded', function () {
                function updateTags(inputSelector, tagId, filterClass) {
                    const inputs = document.querySelectorAll(inputSelector);
                    const tagElement = document.getElementById(tagId);
                    const filterTagDiv = tagElement.closest('.filter_tags');
                    const selectedItems = [];

                    inputs.forEach(input => {
                        if (input.checked) {
                            selectedItems.push(input.getAttribute('data-category') || input.getAttribute('data-brand') || input.getAttribute('data-room') || input.getAttribute('data-price') || input.getAttribute('data-color'));
                        }
                    });

                    tagElement.textContent = selectedItems.join(', ');

                    if (tagElement.textContent.trim() !== '') {
                        filterTagDiv.classList.add('opened');
                    } else {
                        filterTagDiv.classList.remove('opened');
                    }
                    updateRemoveAllTag();
                }

                function updateRemoveAllTag() {
                    const removeAllTag = document.querySelector('.filter_tags_remove_all');
                    const filterTags = document.querySelectorAll('.filter_tags b');
                    let anyTagNotEmpty = false;

                    filterTags.forEach(tag => {
                        if (tag.textContent.trim() !== '') {
                            anyTagNotEmpty = true;
                        }
                    });

                    if (anyTagNotEmpty) {
                        removeAllTag.classList.add('opened');
                    } else {
                        removeAllTag.classList.remove('opened');
                    }
                }

                function submitFormWithAjax(formSelector) {
                    var form = $(formSelector)[0]; // Lấy form theo selector

                    $.ajax({
                        type: form.getAttribute("method"),
                        url: form.getAttribute("action"),
                        data: $(form).serialize(),
                        dataType: 'json', // Đảm bảo dữ liệu trả về là JSON
                        success: function (response) {
                            console.log(response); // Kiểm tra dữ liệu trả về từ server
                            displayProducts(response); // Hiển thị sản phẩm
                            updateRatings();
                        },
                        error: function (xhr, status, error) {
                            console.error("Error: " + error);
                        }
                    });

                }


                function clearFilter(inputSelector, tagId) {
                    const inputs = document.querySelectorAll(inputSelector);
                    const tagElement = document.getElementById(tagId);

                    inputs.forEach(input => {
                        input.checked = false;
                    });

                    tagElement.textContent = '';
                    const filterTagDiv = tagElement.closest('.filter_tags');
                    filterTagDiv.classList.remove('opened');

                    updateRemoveAllTag();
                    submitFormWithAjax('#filterForm');
                }

                // Add click event listeners to each filter tag remove button
                document.querySelectorAll('.filter_tags_remove').forEach(button => {
                    button.addEventListener('click', function () {
                        const filterType = this.dataset.filter;
                        switch (filterType) {
                            case 'category':
                                clearFilter('input[name="category-filter"]', 'category-tag');
                                break;
                            case 'brand':
                                clearFilter('input[name="brand-filter"]', 'brand-tag');
                                break;
                            case 'room':
                                clearFilter('input[name="room-filter"]', 'room-tag');
                                break;
                            case 'price':
                                clearFilter('input[name="price-filter"]', 'price-tag');
                                break;
                            case 'color':
                                clearFilter('input[name="color-filter"]', 'color-tag');
                                break;
                        }
                    });
                });

                // Update category tag
                document.querySelectorAll('input[name="category-filter"]').forEach(input => {
                    input.addEventListener('change', () => {
                        updateTags('input[name="category-filter"]', 'category-tag', 'category-filter');
                    });
                });

                // Update brand tag
                document.querySelectorAll('input[name="brand-filter"]').forEach(input => {
                    input.addEventListener('change', () => {
                        updateTags('input[name="brand-filter"]', 'brand-tag', 'brand-filter');
                    });
                });

                // Update room tag
                document.querySelectorAll('input[name="room-filter"]').forEach(input => {
                    input.addEventListener('change', () => {
                        updateTags('input[name="room-filter"]', 'room-tag', 'room-filter');
                    });
                });

                // Update price tag
                document.querySelectorAll('input[name="price-filter"]').forEach(input => {
                    input.addEventListener('change', () => {
                        updateTags('input[name="price-filter"]', 'price-tag', 'price-filter');
                    });
                });

                // Update color tag
                document.querySelectorAll('input[name="color-filter"]').forEach(input => {
                    input.addEventListener('change', () => {
                        updateTags('input[name="color-filter"]', 'color-tag', 'color-filter');
                    });
                });

                // Initial update to set the state based on pre-selected filters
                updateTags('input[name="category-filter"]', 'category-tag', 'category-filter');
                updateTags('input[name="brand-filter"]', 'brand-tag', 'brand-filter');
                updateTags('input[name="room-filter"]', 'room-tag', 'room-filter');
                updateTags('input[name="price-filter"]', 'price-tag', 'price-filter');
                updateTags('input[name="color-filter"]', 'color-tag', 'color-filter');
            });


            $(document).ready(function () {
                var searchInput = $('#inputSearchAuto');
                var searchForm = $('#searchForm');
                var resultsWrapper = $('#ajaxSearchResults');
                var resultsContent = $('.resultsContent');
                var typingTimer; // Timer identifier
                var doneTypingInterval = 500; // Time in ms (500 ms)

                // Function to handle the AJAX request
                function submitSearch() {
                    var searchData = searchInput.val().trim();

                    if (searchData !== '') {
                        $.ajax({
                            type: 'POST',
                            url: searchForm.attr('action'),
                            data: searchForm.serialize(),
                            success: function (response) {
                                resultsWrapper.show(); // Use .show() to display results
                                resultsContent.html(response);
                                console.log(response);
                            },
                            error: function (xhr, status, error) {
                                console.error("Error: " + error);
                            }
                        });
                    } else {
                        resultsWrapper.hide(); // Use .hide() to hide results
                    }
                }

                // Handle input change event with a delay
                searchInput.on('input', function () {
                    clearTimeout(typingTimer);
                    typingTimer = setTimeout(submitSearch, doneTypingInterval);
                });

                // Handle click event on search button
                $('.btn-search').on('click', function () {
                    resultsWrapper.hide(); // Hide results when search button is clicked
//                    searchForm.submit();
                });
            });

        </script>
        <script>
            // Định nghĩa hàm displayProducts trước khi sử dụng
            function displayProducts(products) {
                const container = document.getElementById('product-container');
                container.innerHTML = ''; // Xóa nội dung hiện có

                products.forEach(product => {
                    // Khởi tạo các phần của HTML
                    let saleOffHTML = '';
                    let priceHTML = '';
                    let colorListHTML = '';

                    // Kiểm tra giảm giá
                    if (product.saleOff !== 0) {
                        saleOffHTML = `<div class="product-sale"><span>-` + product.saleOff + `%</span></div>`;
                    } else {
                        saleOffHTML = `<div></div>`;
                    }

                    // Kiểm tra giá
                    if (product.saleOff === 0) {
                        priceHTML = `<span style="color: black">` + product.price + `₫</span>`;
                    } else {
                        priceHTML = `
            <span>` + product.salePrice + `₫</span>
            <span class="pro-price-del">
                <del class="compare-price">` + product.price + `₫</del>
            </span>
        `;
                    }

                    // Tạo HTML cho danh sách màu sắc
                    colorListHTML = product.colorList.map(color => `
        <label class="color-checkbox">
            <input type="checkbox" name="color" value="` + color.id + `" style="display: none;">
            <span class="color-circle" style="background-color:` + color.colorcode + `"></span>
        </label>
    `).join('');

                    // Tạo HTML cho sản phẩm
                    const productHTML = `
        <div class="col-md-3 col-sm-6 col-xs-6 pro-loop col-4">
            <div class="product-block product-resize site-animation single-product">
                <div class="product-img fade-box">`
                            + saleOffHTML +
                            `<div class="tag-loop">
                        <div class="icon icon_hot">
                            <img loading="lazy" decoding="async"
                                 src="//theme.hstatic.net/200000065946/1001187274/14/icon_hot.png?v=582"
                                 alt="icon hot" />
                        </div>
                    </div>
                    <a href="ProductDetailServlet?productId=` + product.id + `"
                       title="` + product.name + `" class="image-resize">
                        <picture class="loop-one-img">
                            <img loading="lazy" decoding="async" width="480"
                                 height="480" class="img-loop"
                                 alt="` + product.name + `"
                                 src="image/product/` + product.image + `" />
                        </picture>
                    </a>
                </div>
                <div class="product-detail clearfix">
                    <div class="box-pro-detail">
                        <h3 class="pro-name">
                            <a href="#" title="` + product.name + `">`
                            + product.name +
                            `</a>
                        </h3>
                        <div class="box-pro-prices">
                            <p class="pro-price highlight">`
                            + priceHTML +
                            `</p>
                        </div>
                        <div class="row">
                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 custom_review">
                                <div class="rating-container" data-rating="` + product.staravg + `" data-num-reviews="` + product.numberFeedback + `">
                                    <div class="rating"></div>
                                    <span class="num-reviews"></span>
                                </div>
                                <div>Số lượng: ` + product.quantity + `</div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 custom_sold_qty">
                                <div class="cmpText">Đã bán ` + product.quantitySold + `</div>
                                <span>`
                            + colorListHTML +
                            `</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    `;
                    // Thêm HTML sản phẩm vào container
                    container.innerHTML += productHTML;
                });
            }

// Định nghĩa sự kiện khi tài liệu đã sẵn sàng
            $(document).ready(function () {
                // Bắt sự kiện khi người dùng thay đổi radio button
                $('input[type="radio"][name="sortby"]').change(function () {
                    // Tự động submit form bằng AJAX
                    submitFormWithAjax('#sortForm');
                });

                // Bắt sự kiện khi người dùng thay đổi checkbox trong form
                $('#filterForm input[type="checkbox"]').change(async function () {
                    try {
                        // Tự động submit form bằng AJAX và chờ cho nó hoàn tất
                        await submitFormWithAjax('#filterForm');
                        // Gọi ReloadPagination sau khi submitFormWithAjax hoàn tất
                        ReloadPagination();
                    } catch (error) {
                        console.error("An error occurred:", error);
                    }
                });

                // Hàm để gửi yêu cầu AJAX
                function submitFormWithAjax(formSelector) {
                    var form = $(formSelector)[0]; // Lấy form theo selector

                    return new Promise((resolve, reject) => {
                        $.ajax({
                            type: form.getAttribute("method"),
                            url: form.getAttribute("action"),
                            data: $(form).serialize(),
                            dataType: 'json', // Đảm bảo dữ liệu trả về là JSON
                            success: function (response) {
                                console.log(response); // Kiểm tra dữ liệu trả về từ server
                                displayProducts(response); // Hiển thị sản phẩm
                                updateRatings();
                                resolve(); // Hoàn tất Promise
                            },
                            error: function (xhr, status, error) {
                                console.error("Error: " + error);
                                reject(error); // Từ chối Promise
                            }
                        });
                    });
                }

                function renderPagination(pages) {
                    var paginationHtml = '';
                    pages.forEach(function (page) {
                        paginationHtml += `
            <input type="radio" name="page" id="page` + page + `" value="` + page + `" style="display: none;">
            <label for="page` + page + `" 
                   style="width: 25px; border: groove;" 
                   class="page-node" 
                   aria-label="Trang ` + page + `" 
                   onclick="submitFormWithPage(` + page + `)">
                   ` + page + `
            </label>
        `;
                    });
                    paginationHtml += '<span class="page-node">&hellip;</span>';
                    return paginationHtml;
                }


                function ReloadPagination() {
                    const container = document.getElementById('page-pagination');
                    container.innerHTML = ''; // Làm rỗng nội dung hiện tại của container

                    $.ajax({
                        type: "POST",
                        url: "ProductServlet",
                        data: {action: "reloadPagination"}, // Thêm biến action vào dữ liệu gửi đi
                        dataType: 'json', // Đảm bảo dữ liệu trả về là JSON
                        success: function (response) {
                            try {
                                if (Array.isArray(response)) {
                                    console.log(response);
                                    // Gọi hàm renderPagination và cập nhật nội dung container
                                    container.innerHTML = renderPagination(response);
                                } else {
                                    console.error("Unexpected response format:", response);
                                }
                            } catch (e) {
                                console.error("Error processing JSON response:", e);
                            }
                        },
                        error: function (xhr, status, error) {
                            console.error("Error: " + error);
                        }
                    });
                }

            });

            $(document).ready(function () {
                // Hàm để xử lý sự kiện onclick và gửi yêu cầu AJAX
                window.submitFormWithPage = function (pageValue) {
                    $("input[name='page'][value='" + pageValue + "']").prop('checked', true);
                    console.log(pageValue);
                    submitFormWithAjax();
                };

                function submitFormWithAjax() {
                    var form = $('#paginationForm')[0]; // Lấy form theo id
                    console.log($(form).serialize());
                    $.ajax({
                        type: form.getAttribute("method"),
                        url: form.getAttribute("action"),
                        data: $(form).serialize(),
                        dataType: 'json',
                        success: function (response) {
                            console.log(response); // Kiểm tra dữ liệu trả về từ server
                            displayProducts(response); // Hiển thị sản phẩm
                            updateRatings();
                        },
                        error: function (xhr, status, error) {
                            console.error("Error: " + error);
                        }
                    });
                }

            });




        </script>
        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <style>
            .rating::after {
                content: "★★★★★";
                color: #ffc107;
                /* Màu của sao được đánh giá */
                position: absolute;
                top: 0;
                left: 0;
                white-space: nowrap;
                overflow: hidden;
                width: var(--rating-width);
            }
        </style>

    </body>

</html>
