browserify = require 'browserify';
gulp = require 'gulp';
source = require 'vinyl-source-stream';
reactify = require 'reactify';

###使用browserify 將『./app/index.jsx』轉換為符合CommonJS 規範的模組化js
並且使用reactify 將jsx 語法轉換為javascript 格式
將上述結果以vinyl 流格式輸出成為bundle.js，並指定目的路徑###
gulp.task 'browserify', ->
	browserify './app/index.jsx',
		debug: true
		transform: [reactify]
	.bundle()
	.pipe source 'bundle.js'
	.pipe gulp.dest './dest'
	.pipe gulp.dest './src/main/resources/static';

###將assets 路徑底下的html 輸出至指定之目的路徑###
gulp.task 'html', ->
	gulp.src './assets/**/*.html'
		.pipe gulp.dest './dest'
		.pipe gulp.dest './src/main/resources/templates';

###執行build 時會啟動browserify、html 任務###
gulp.task 'build', ->
	gulp.start ['browserify', 'html'];

###執行watch 任務前先啟動build 任務，當jsx、js 檔有異動時則觸發browserify 任務，當html 檔有異動時則觸發html 任務###
gulp.task 'watch', ['build'], ->
	gulp.watch ['./app/**/*.jsx', './app/**/*.js'], ['browserify'];
	gulp.watch ['./assets/**/*.html'], ['html'];

