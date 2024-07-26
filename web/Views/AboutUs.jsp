<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About us</title>
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
                                        <a href="HomePage" target="_self" itemprop="item" content="https://moho.com.vn"><span
                                                itemprop="name">Trang chủ</span></a>
                                        <meta itemprop="position" content="1" />
                                    </li>

                                    <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                                        <a href="AboutUsServlet" target="_self">
                                            <span itemprop="item" content="https://moho.com.vn/collections/all"><span
                                                    itemprop="name">About Us</span></span>
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
                            <div class="container">
                                <div class="row wrapper-row pd-page">
                                    <div class="col-md-12 col-sm-12 col-xs-12 col-md-push-0">
                                        <div class="page-wrapper">
                                            <div class="heading-page">
                                                <h1>Brand Story</h1>
                                            </div>
                                            <div class="wrapbox-content-page">
                                                <div class="content-page ">
                                                    <p><span style="font-size:14px;">Mỗi một chi tiết, mỗi một sản phẩm và hình ảnh đều là những dấu ấn, là câu chuyện mà Furniture muốn gửi gắm đến mỗi khách hàng. Furniture hi vọng trong từng bộ sưu tập, từng sản phẩm và dịch vụ của mình sẽ trở thành một phần trong tổ ấm của mỗi gia đình Việt, như một thông điệp <strong>"mang yêu thương gửi trọn trong từng không gian sống"</strong>. Hướng đến sự tiện ích, hiện đại tối giản và thân thiện môi trường là khát khao mà Furniture không ngừng theo đuổi.&nbsp;</span></p>
                                                    <div style="text-align: justify;"><span style="font-size:14px;">Chính những khát khao lan toả biến nhà thực sự là <strong>"tổ ấm"</strong>, tháng 03/2020, thương hiệu <a href="HomePage">nội thất</a> Furniture được định hình và ra đời. Là một phần của <a href="https://savimex.com.vn/">Savimex</a> với 35 kinh nghiệm trong sản xuất và xuất khẩu nội thất sang các thị trường khó tính như: Mỹ, Nhật, Hàn,... Furniture tiếp tục kế thừa và phát huy nhằm mang đến cho người Việt những sản phẩm nội thất <strong>100% made in Vietnam </strong>theo tiêu chuẩn&nbsp;quốc tế, đảm bảo<b>&nbsp;</b>an toàn sức khoẻ với chi phí hợp lý.&nbsp;</span></div>
                                                    <div style="text-align: justify;">&nbsp;</div>
                                                    <blockquote><div style="text-align: justify;"><span style="font-size:18px;"><strong>HƯỚNG ĐẾN GIÁ TRỊ BỀN VỮNG</strong></span></div></blockquote>
                                                    <p style="text-align: justify;"><span style="font-size:14px;">“Tính bền vững” là một khái niệm định nghĩa sự phát triển về mọi mặt nhưng vẫn đảm bảo sự tồn tại phát triển ở trạng thái cân bằng.&nbsp;Mang khái niệm “bền vững” vào trong sản phẩm - dịch vụ&nbsp;nội thất&nbsp;là bước đi tiên phong và đầy thách thức mà Furniture luôn không ngừng nỗ lực nhằm&nbsp;lan toả, truyền&nbsp;cảm hứng về một lối sống tích cực, tiêu dùng bền vững hơn vì&nbsp;một&nbsp;tương lai của hành tinh xanh.&nbsp;</span></p>
                                                    <p><strong><span style="font-size:14px;">Mục tiêu phát triển bền vững:</span></strong></p>
                                                    <p><span style="font-size:14px;">- Truyền cảm hứng về tiêu dùng bền vững đến mọi người tại Việt Nam.</span></p>
                                                    <p><span style="font-size:14px;">- Sử dụng 100% nguồn nguyên liệu gỗ đạt chứng nhận&nbsp;<u>chứng nhận FSC® -&nbsp;Forest Stewardship Council®</u>.</span></p>
                                                    <p><span style="font-size:14px;">- <a target="_blank" href="PageServlet?pageID=4"><u>Bảo trì&nbsp;trọn đời</u></a> sản phẩm nhằm kéo dài tuổi thọ&nbsp;và tính hữu dụng của sản phẩm trong thời gian&nbsp;dài.&nbsp;</span></p>
                                                    <blockquote><p style="text-align: justify;">"Mặc dù, khái niệm nội thất bền vững tại Việt Nam chưa thực sự phổ biến nhưng&nbsp;những khái niệm như&nbsp;sống xanh, sử dụng vật liệu tái chế, thân thiện môi trường,... được khá nhiều khách hàng quan tâm hưởng ứng. Có thể thấy, nhận thức về tầm quan trọng của việc bảo vệ môi trường đã dần được nâng cao.&nbsp;Thông qua việc nỗ lực phát triển, đảm bảo 100% sản phẩm&nbsp;sử dụng các vật liệu bền vững, Furniture tin rằng&nbsp;sẽ góp phần nào&nbsp;thay đổi tích cực, hướng tới mục tiêu là thương hiệu nội thất bền vững tiên phong hàng đầu&nbsp;tại Việt Nam trong tương lai."&nbsp;</p></blockquote>
                                                    <p><span style="font-size:16px;"><b>THÂN THIỆN MÔI TRƯỜNG&nbsp;</b></span></p>
                                                    <p style="text-align: justify;"><span style="font-size:14px;">Furniture với xuất phát điểm muốn lan toả thông điệp <strong>"Sống xanh"</strong>, mỗi một sản phẩm nội thất mà Furniture mang đến cho khách hàng đều là bắt nguồn từ nguyên liệu gỗ đạt chuẩn FSC - khai thác từ nguồn rừng có trồng lại. Furniture hiểu rằng, là một doanh nghiệp nói chung, và là doanh nghiệp trong lĩnh vực nội thất nói riêng, cần có trách nhiệm hơn với cộng đồng và môi trường xanh của chúng ta. Giá trị tốt đẹp này không chỉ riêng Furniture mà mỗi một khách hàng sử dụng&nbsp;sản phẩm Furniture đều đóng góp và nhân rộng lên giá trị bền vững này.&nbsp;</span></p>
                                                    <p style="text-align: center"><img src="//file.hstatic.net/200000065946/file/noi-that-moho-ben-vung-fsc_9f0b5_d1f6c79c916c41179ced29c23c4e70e6.jpg"></p>
                                                    <p><span style="font-size:16px;"><b>AN TOÀN SỨC KHOẺ</b></span></p>
                                                    <p style="text-align: justify;"><span style="font-size:14px;">Đặt yếu tố <strong>sức khoẻ và an toàn</strong>&nbsp;khách hàng lên hàng đầu, các sản phẩm nội thất gỗ công nghiệp tại Furniture:&nbsp;</span></p>
                                                    <p style="text-align: justify;"><span style="font-size:14px;">- Đạt chứng nhận&nbsp;chứng nhận giảm phát thải Formaldehyde – CARB P2, đảm bảo gỗ không độc hại.</span></p>
                                                    <p style="text-align: justify;"><span style="font-size:14px;">- Ưu tiên sử dụng sơn gốc nước thay cho sơn gốc dầu.&nbsp;</span></p>
                                                </div>    <p style="text-align: justify;"><span style="font-size:14px;">- Trang bị bộ anti tip kit &nbsp;tránh tình trạng tủ bị lật, gây nguy hiểm, đặc biệt là những gia đình có trẻ nhỏ.</span></p>
                                                <p style="text-align: justify;"><span style="font-size:14px;">Tại hầu hết các nước trên thế giới đều qui định nghiêm ngặt về tiêu chuẩn an toàn CARB - P2 đối với các sản phẩm gỗ công nghiệp, cũng như các yếu tố an toàn trong quá trình sử dụng, Furniture tin rằng việc tiên phong về tiêu chuẩn sức khoẻ - an toàn người dùng sẽ là điểm mạnh mang thương hiệu nội thất của người Việt vươn tầm quốc tế trong tương lai.&nbsp;</span></p>
                                                <p style="text-align: center"><img alt="noi-that-moho" src="//file.hstatic.net/200000065946/file/noi-that-moho_cab083b219614a7c82944ad720caccbb_1024x1024.png"></p>
                                                <p style="text-align: justify;"><span style="font-size:16px;"><b>CHẤT LƯỢNG QUỐC TẾ</b></span></p>
                                                <p><span style="font-size:14px;">Sản xuất trực tiếp tại nhà máy Savimex với công nghệ hiện đại cùng đội ngũ thợ&nbsp;tay nghề cao.&nbsp;</span></p>
                                                <p style="text-align: justify;"><span style="font-size:14px;">- Nhà máy chế biến gỗ đầu tiên tại Việt Nam đạt chứng nhận hệ thống quản lý môi trường đạt&nbsp;chuẩn quốc tế ISO 14001.</span></p>
                                                <p style="text-align: justify;"><span style="font-size:14px;">- Rộng 10ha với hơn 1,500 công nhân viên giàu kinh nghiệm cùng máy móc công nghệ hiện đại.&nbsp;</span></p>
                                                <p style="text-align: center"><img alt="noi-that-moho-chat-luong-quoc-te" src="//file.hstatic.net/200000065946/file/noi-that-moho-chat-luong-quoc-te_b4ea42c8ff834f2a9be8c7176a95b6f0.jpg"></p>
                                                <div><blockquote><p><span style="font-size: 18px;"><b>TINH TẾ TRONG TỪNG ĐƯỜNG NÉT</b></span></p></blockquote><p>Chúng tôi tạo ra không gian sống tuyệt vời nhất, nơi chúng tôi gọi là “Nhà”.</p></div>
                                                <blockquote><h2><span style="font-size: 18px;"><b>TRẢI NGHIỆM TỐT NHẤT</b></span></h2></blockquote>
                                                <p style="text-align: justify;">Tham quan và trải nghiệm <a href="HomePage">cửa hàng nội thất</a> của Furniture với lối kiến trúc không gian mở hiện đại, các sản phẩm nội thất được bố trí theo từng không gian và phong cách nội thất, mang đến trải nghiệm mua sắm tuyệt vời cho khách hàng.&nbsp;</p>
                                                <p style="text-align: center"><strong>Showroom:</strong>&nbsp;162 HT17, P. Hiệp Thành, Q. 12, TP. HCM&nbsp;</p>
                                                <p style="text-align: center"><img src="//file.hstatic.net/200000065946/file/cua-hang-noi-that-moho-furniture-store-vinhomes-grand-park_a6f42c85edb149a280f845ac22c13892_grande.png"></p>
                                                <div><blockquote><p><span style="font-size: 18px;"><b>CÁC CHỨNG NHẬN CỦA Furniture</b></span></p></blockquote><p style="text-align: center"><img alt="noi-that-moho-chat-luong-quoc-te" src="//file.hstatic.net/200000065946/file/noi-that-moho-chung-nhan-quoc-te_eada03a5c58448ea8b33cdd20fd73986.jpg"></p></div>
                                                <div style="left: 19.9884px; top: 629.271px;"><p><img src="https://file.hstatic.net/200000065946/file/noi-that-moho-kiem-nghiem-kotiti_bc9f39b2134d4191978d541cc11ba363.jpg"></p></div>
                                                <div class="wrapper-home-banner-servce">
                                                    <div class="container">
                                                        <div class="flex_content services-pd site-animation">
                                                            <div class="services">
                                                                <div class="img-outer">
                                                                    <div class="service-img fade-box">
                                                                        <img width="50" height="50" src="//theme.hstatic.net/200000065946/1001187274/14/vice_item_1_thumb.png?v=610" alt="Giao Hàng &amp; Lắp Đặt">
                                                                    </div>
                                                                </div>
                                                                <div class="text">
                                                                    <div class="title">Giao Hàng &amp; Lắp Đặt</div>
                                                                    <div class="desc">Miễn Phí</div>
                                                                </div>
                                                            </div>
                                                            <div class="services">
                                                                <div class="img-outer">
                                                                    <div class="service-img fade-box">
                                                                        <img width="50" height="50" src="//theme.hstatic.net/200000065946/1001187274/14/vice_item_2_thumb.png?v=610" alt="Đổi Trả 1 - 1">
                                                                    </div>
                                                                </div>
                                                                <div class="text">
                                                                    <div class="title">Đổi Trả 1 - 1</div>
                                                                    <div class="desc">Miễn Phí</div>
                                                                </div>
                                                            </div>
                                                            <div class="services">
                                                                <div class="img-outer">
                                                                    <div class="service-img fade-box">
                                                                        <img width="50" height="50" src="//theme.hstatic.net/200000065946/1001187274/14/vice_item_3_thumb.png?v=610" alt="Bảo Hành 2 Năm">
                                                                    </div>
                                                                </div>
                                                                <div class="text">
                                                                    <div class="title">Bảo Hành 2 Năm</div>
                                                                    <div class="desc">Miễn Phí</div>
                                                                </div>
                                                            </div>
                                                            <div class="services">
                                                                <div class="img-outer">
                                                                    <div class="service-img fade-box">
                                                                        <img width="50" height="50" src="//theme.hstatic.net/200000065946/1001187274/14/vice_item_4_thumb.png?v=610" alt="Tư Vấn Thiết Kế">
                                                                    </div>
                                                                </div>
                                                                <div class="text">
                                                                    <div class="title">Tư Vấn Thiết Kế</div>
                                                                    <div class="desc">Miễn Phí</div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
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
        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>

</html>
