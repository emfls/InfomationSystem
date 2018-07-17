//토글 버튼을 누르면 사이드 바를 보여지게 구현
$(document).ready(function () {
    $('#sidebarCollapse').on('click', function () {
        $('#sidebar').toggleClass('active');
    });
    //창 크기 변경 함수 이벤트를 계속적으로 받기 위해 resize함수 두 번 구현
    $(window).resize(function () {
        //화면이 768px보다 줄어들면
        if (window.matchMedia('(max-width: 768px)').matches) {
            //사이드 바가 보여져있으면
            if ($('#sidebar').hasClass('active')) {
                //사이드 바를 안보이게
                $('#sidebar').toggleClass('active');
            }
        }
        //화면이 768px보다 커지면
        else {
            //오른쪽 정렬을 유지
            $('.navbar-right').css('float', 'right');
        }
    }).resize();
});
