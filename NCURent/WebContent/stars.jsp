<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


	<%@ page import="java.util.*" %>
		<div class="star-mark">
			<ul class="star">
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
			</ul>
			<div class="result"><span class="mark"></span><span class="detail"></span></div>
			<div class="help-info">
				<span class="mark"></span>&nbsp;<span class="decri"></span><br>
				<span class="detail"></span>
			</div>
			<label id="starAmount" style="display:none"></label>
		</div>

		<style>
			ul {
				margin: 0;
				padding: 0;
			}

			.star-mark {
				position: relative;
				font-size: 12px;
				width: 700px;
				margin: 10px auto;
				color: #999;
			}

			.star-mark .star {
				display: inline-block;
				margin-left: 10px;
				list-style: none;
				vertical-align: middle;
			}

			.star-mark .star li {
				float: left;
				width: 24px;
				height: 19px;
				background: url(https://pandoraui.github.io/learning-javascript/lesson4/img/star.png) no-repeat;
			}

			.star-mark .star li.light {
				background-position: 0 -28px;
			}

			.star-mark .result {
				display: inline-block;
				margin-left: 10px;
			}

			.star-mark .result .mark {
				font-weight: 700;
				color: #e17f65;
			}

			.star-mark .help-info {
				display: none;
				position: absolute;
				top: 20px;
				width: 159px;
				height: 60px;
				padding: 7px 10px 0;
				line-height: 1.5;
				background: url(https://pandoraui.github.io/learning-javascript/lesson4/img/icon.gif) no-repeat;
			}

			.star-mark .help-info .mark,
			.decri {
				color: #f00;
			}
		</style>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script>
			var MARK_INFO = [
				'1顆星||1分',
				'2顆星||2分',
				'3顆星||3分',
				'4顆星||4分',
				'5顆星||5分'
			];


			function delegateEvent(delegateElement, targetTag, eventName, handler) {
				delegateElement.addEventListener(eventName, function (event) {
					var target = event.target;
					if (target.nodeName.toLowerCase() === targetTag.toLowerCase()) {
						return handler(event);
					}
				}, false);
			}

			function hasClass(element, className) {
				return (new RegExp('(^|\\s)' + className + '($|\\s)')).test(element.className);
			}

			function addClass(element, newClassName) {
				if (!hasClass(element, newClassName)) {
					element.className += element.className ? (' ' + newClassName) : newClassName;
				}
			}

			function removeClass(element, oldClassName) {
				if (hasClass(element, oldClassName)) {
					element.className = element.className.replace(new RegExp('(^|\\s)' + oldClassName + '($|\\s)'), ' ').trim();
				}
			}

			function lightenStar(stars, activeIndex) {
				for (var i = 0; i <= activeIndex; i++) {
					addClass(stars[i], 'light');
				}
			}

			function darkenStar(stars) {
				for (var i = 0; i < stars.length; i++) {
					removeClass(stars[i], 'light');
				}
			}

			var starMark = document.getElementsByClassName('star-mark')[0];
			var stars = starMark.getElementsByClassName('star')[0].getElementsByTagName('li');
			var helpInfo = starMark.getElementsByClassName('help-info')[0];
			var cnofirmIndex = -1;

			delegateEvent(starMark, 'li', 'click', function (event) {
				var target = event.target;
				var markResult = starMark.getElementsByClassName('result')[0];
				cnofirmIndex = Array.prototype.indexOf.call(stars, target);
				lightenStar(stars, cnofirmIndex);

				var markNumDiv = markResult.getElementsByClassName('mark')[0];
				var markDetailDiv = markResult.getElementsByClassName('detail')[0];
				var infos = MARK_INFO[cnofirmIndex].split('|');
				markNumDiv.textContent = infos[0];
				//console.log(starAmount);
				//console.log(infos[2].substr(0, 1));
				var starAmount = infos[2].substr(0, 1);
				$('#starAmount').text(starAmount);
				markDetailDiv.textContent = '（' + infos[2] + '）';
			});

			delegateEvent(starMark, 'li', 'mouseover', function (event) {
				var target = event.target;
				hoverIndex = Array.prototype.indexOf.call(stars, target);
				darkenStar(stars);
				lightenStar(stars, hoverIndex);

				helpInfo.style.display = 'block';
				helpInfo.style.left = (hoverIndex + 1) * 25 + 'px';

				var helpMark = helpInfo.getElementsByClassName('mark')[0];
				var helpDescri = helpInfo.getElementsByClassName('decri')[0];
				var helpDetail = helpInfo.getElementsByClassName('detail')[0];
				var infos = MARK_INFO[hoverIndex].split('|');
				helpMark.textContent = infos[0];
				helpDescri.textContent = infos[1];
				helpDetail.textContent = infos[2];
			});

			delegateEvent(starMark, 'li', 'mouseout', function (event) {
				var target = event.target;
				darkenStar(stars);
				lightenStar(stars, cnofirmIndex);
				helpInfo.style.display = 'none';
			});

		</script>