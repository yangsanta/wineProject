//css��� ��w���ܥ\�� bootstrap
    $(function () {
        $("[rel='tooltip']").tooltip();
    });
//css��� ��w���ܥ\�� bootstrap end

//fancybox �u�X�e�� 
		$(document).ready(function() {
			$('.fancybox').fancybox();
			$("#fancybox-manual-b").click(function() {
				$.fancybox.open({
					href : 'iframe.html',
					type : 'iframe',
					padding : 5
				});
			});
		});
//fancybox �u�X�e�� end

// ��楪������s�i����
	$(function(){
		// �����o .abgne-news-scroll ul �� li ������
		// �ó]�w�T������, �H�J�ν����ɶ�
		var $news = $('.abgne-news-scroll ul'), 
			scrollHeight = $news.find('li').outerHeight(true), 
			scrollSpeed = 2000, fadeInSpeed = 2000, 
			timer, speed = 5000;
		
		// �Ψӱ��������
		function newsScroll(){
			// ���� .abgne-news-scroll ul ���U��
			$news.animate({
				top: scrollHeight + 'px'
			}, scrollSpeed, function(){
				// �� .abgne-news-scroll ul ���ʨ�w�I��
				// ����X�̫�@�� li
				var $last = $news.find('li:last');
				// �ƻs�@���å����ð_��
				// ���ۧ⥦�[�� .abgne-news-scroll ul �����Ĥ@�Ӷ���
				// �̫�βH�J���覡���, ����ܧ����~�����
				$last.clone().hide().prependTo($news).fadeIn(fadeInSpeed, function(){
					timer = setTimeout(newsScroll, speed);
				});
				// ���W�� .abgne-news-scroll ul ���� top ���� 0 ����m
				$news.css('top', 0);
				// �� $last ������
				$last.remove();
			});
		}
		
		// �Ұʽ����p�ɾ�
		timer = setTimeout(newsScroll, speed);
	});
// ��楪������s�i����end