Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9685A24262A
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Aug 2020 09:37:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 55E483C5EB9
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Aug 2020 09:37:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id ECBDE3C3129
 for <ltp@lists.linux.it>; Wed, 12 Aug 2020 09:37:22 +0200 (CEST)
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6FC8C10007AB
 for <ltp@lists.linux.it>; Wed, 12 Aug 2020 09:37:22 +0200 (CEST)
Received: by mail-pj1-f67.google.com with SMTP id ha11so687323pjb.1
 for <ltp@lists.linux.it>; Wed, 12 Aug 2020 00:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=S0iyvq7q60vZ8xHvI7CvdR4AZIcyAa5o/d/+H0LepXY=;
 b=eCFpEEnXcb/IsaX2lqZF/4+S2DMq9cZ9Pz9VXDbxF4xhPgXf9rp0Ex+7w3bWzFLjNo
 hQe/WBzlVWaBEYLL+zFEwpJPr+DG/Bzxu+cHUZCx9ySFq+8dxIOgWIfma08YUB9ir8sU
 Tsn35BmymV2T9CM6e4+MuYzwQhVKjmNjDQ08DqguJy4Fes4A+a0Cy283mk46rXdBhIah
 YxDJkLL4COaMoDtxZx9YuIvOtFL7UnRhFn8RVHKEHuXx2AKkwKc/VDaJICC9pvBC2mr6
 phbL3B70LEvGjTmZdVYa4waWjpHIQY2RnzIHi7Fna1AeokESRfoKa18eGDvfteeL9CQS
 NYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=S0iyvq7q60vZ8xHvI7CvdR4AZIcyAa5o/d/+H0LepXY=;
 b=qjuyhNYlEFfF3/s8rRRfvHQYrjwzuV5ANeRx4kiWF4xCpPXhGtyl4Z21UTjqQeKYVo
 B54YKwlagLVjh9toWWTJfX+oIxUTbRez3U+9XVciALiyoV4UZkQHRl7Rsbb2gXBgF6xs
 G9fyH3stc7H5sfhECxR3nLeUvmHaJLUEauueQl9QIeqGZfmd5Fs+FR9EwN650C3kzToU
 pTztxibpjkQJGLmKFQmr9am1nUFQrq4d0XFnskGFXgomCwtFobl4iWAfur9kzUSOk+jC
 xEBsyo6wQi3d1dFCARu4HLtvaMmmSm83/Wm5mxBhEvObhMMZqSJALop4z9dWL/On8iRg
 Qbvg==
X-Gm-Message-State: AOAM530ucoKY9IuBCO8DRpgLrCwAlVuV9WUUhIj3VrFVcpXmGKhc3XwV
 FHc3BrIlZBZmJ0YpTbrqHTQ=
X-Google-Smtp-Source: ABdhPJybTDkT/8D+nVLS6vJxoFxKVVuwZ5aOEYRaBQE+Qlkmh0b4W4PnYn/pwmx22mQKS0frD1LDHQ==
X-Received: by 2002:a17:902:b20e:: with SMTP id
 t14mr4428459plr.58.1597217781025; 
 Wed, 12 Aug 2020 00:36:21 -0700 (PDT)
Received: from bj616583pcu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id g5sm1385069pfh.168.2020.08.12.00.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 00:36:20 -0700 (PDT)
From: gengcixi@gmail.com
To: chrubis@suse.cz,
	ceh@ti.com,
	ltp@lists.linux.it
Date: Wed, 12 Aug 2020 15:35:29 +0800
Message-Id: <20200812073529.25715-2-gengcixi@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200812073529.25715-1-gengcixi@gmail.com>
References: <20200812073529.25715-1-gengcixi@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] device_drivers/uart01: uart01 test extension
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: orsonzhai@gmail.com, Cixi Geng <cixi.geng1@unisoc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Cixi Geng <cixi.geng1@unisoc.com>

expand the uart01 test to support more options:
    -f: create a file with ramdom content,and test uart use the file
	to transfer data
    -l: support to loop test with loop number
    -k: support loopback mode test

modify: make UART_Rx and UART_Tx test into the same UART_DEV for we
usually test uart transceiver function together.

This is an updated version which comes from patch written by Cyril

https://patchwork.ozlabs.org/project/ltp/patch/20200623112827.10744-3-chrubis@suse.cz/

Signed-off-by: Cixi Geng <cixi.geng1@unisoc.com>
---
 runtest/kernel_misc                           | 10 +-
 testcases/kernel/device-drivers/Makefile      |  1 +
 testcases/kernel/device-drivers/uart/uart01.c | 94 +++++++++++++++----
 3 files changed, 80 insertions(+), 25 deletions(-)

diff --git a/runtest/kernel_misc b/runtest/kernel_misc
index a7f1d9b56..977a15697 100644
--- a/runtest/kernel_misc
+++ b/runtest/kernel_misc
@@ -13,8 +13,8 @@ zram01 zram01.sh
 zram02 zram02.sh
 zram03 zram03
 umip_basic_test umip_basic_test
-uart01_9600 uart01 -b 9600
-uart01_19200 uart01 -b 19200
-uart01_38400 uart01 -b 38400
-uart01_57600 uart01 -b 57600
-uart01_115200 uart01 -b 115200
+uart01_9600 uart01 -b 9600 -f binary -k 0 -l 2
+uart01_19200 uart01 -b 19200 -f binary -k 0 -l 3
+uart01_38400 uart01 -b 38400 -f binary -k 0 -l 1
+uart01_57600 uart01 -b 57600 -f binary -k 0 -l 3
+uart01_115200 uart01 -b 115200 -f /binary -k 0 -l 5
diff --git a/testcases/kernel/device-drivers/Makefile b/testcases/kernel/device-drivers/Makefile
index 55e0d25a0..be0d88e38 100644
--- a/testcases/kernel/device-drivers/Makefile
+++ b/testcases/kernel/device-drivers/Makefile
@@ -24,6 +24,7 @@ SUBDIRS		:= acpi \
 		   locking \
 		   pci \
 		   rcu \
+		   uart \
 		   rtc \
 		   tbio \
 		   uaccess \
diff --git a/testcases/kernel/device-drivers/uart/uart01.c b/testcases/kernel/device-drivers/uart/uart01.c
index 4647c55e3..0501cb462 100644
--- a/testcases/kernel/device-drivers/uart/uart01.c
+++ b/testcases/kernel/device-drivers/uart/uart01.c
@@ -22,6 +22,10 @@
 #include <linux/serial.h>
 
 #include "tst_test.h"
+#define TIOCM_OUT1	0x2000
+#define TIOCM_OUT2	0x4000
+#define TIOCM_LOOP	0x8000
+
 
 static const char hex_asc[] = "0123456789abcdef";
 #define hex_asc_lo(x)	hex_asc[((x) & 0x0f)]
@@ -39,6 +43,7 @@ struct g_opt {
 #define MODE_DUPLEX     (MODE_TX_ONLY | MODE_RX_ONLY)
 	unsigned int mode;
 	unsigned char *cmp_buff;
+	unsigned char loopback;
 };
 
 static int vscnprintf(char *buf, size_t size, const char *fmt, va_list args)
@@ -187,7 +192,6 @@ static int stress_test_uart_once(struct g_opt *opts, int fd, unsigned char *data
 			.fd = fd,
 		};
 		int ret;
-
 		if (opts->mode & MODE_RX_ONLY && progress_rx < data_len) {
 			pfd.events |= POLLIN;
 			wait_rx = 1;
@@ -296,7 +300,6 @@ static int stress_test_uart(struct g_opt *opts, int fd, unsigned char *data, off
 
 	opts->cmp_buff = SAFE_MALLOC(data_len);
 	memset(opts->cmp_buff, 0, data_len);
-
 	do {
 		status = stress_test_uart_once(opts, fd, data, data_len);
 		memset(opts->cmp_buff, 0, data_len);
@@ -307,14 +310,30 @@ static int stress_test_uart(struct g_opt *opts, int fd, unsigned char *data, off
 	return status;
 }
 
+void set_modem(int fd, int bits, int mask)
+{
+	int status, ret;
+
+	ret = ioctl(fd, TIOCMGET, &status);
+	if (ret < 0)
+		tst_brk(TBROK,"mcr get failed: %m\n");
+
+	status = (status & ~mask) | (bits & mask);
+
+	ret = ioctl(fd, TIOCMSET, &status);
+	if (ret < 0)
+		tst_brk(TBROK,"mcr set failed: %m\n");
+}
+
 static int setup_uart(struct g_opt *opts, int open_mode, struct termios *old_term)
 {
 	struct termios new_term;
+	struct serial_icounter_struct old_counters;
+	struct serial_icounter_struct new_counters;
 	int fd;
 	int ret;
-
-	tst_res(TINFO, "Setting up %s speed %u hwflow=%u",
-	        opts->uart_dev, opts->baud_rate, opts->hwflow);
+	tst_res(TINFO, "Setting up %s speed %u hwflow=%u,loops=%u,loopback %u",
+	        opts->uart_dev, opts->baud_rate, opts->hwflow,opts->loops,opts->loopback);
 
 	fd = SAFE_OPEN(opts->uart_dev, open_mode | O_NONBLOCK);
 
@@ -347,6 +366,18 @@ static int setup_uart(struct g_opt *opts, int open_mode, struct termios *old_ter
 			tst_brk(TBROK, "tcflush failed: %m\n");
 	}
 
+	ret = fcntl(fd, F_SETFL, 0);
+	if (ret)
+		printf("Failed to remove nonblock mode\n");
+
+	// set loopback modem
+
+	set_modem(fd, opts->loopback ? TIOCM_LOOP : 0, TIOCM_LOOP);
+
+	ret = ioctl(fd, TIOCGICOUNT, &old_counters);
+	if (ret)
+		printf("Failed to set loopback mode\n");
+
 	ret = fcntl(fd, F_SETFL, 0);
 	if (ret)
 		printf("Failed to remove nonblock mode\n");
@@ -359,6 +390,7 @@ static void restore_uart(int fd, struct termios *old_term)
 	int ret = tcsetattr(fd, TCSAFLUSH, old_term);
 	if (ret)
 		printf("tcsetattr() of old ones failed: %m\n");
+	set_modem(fd, 0, TIOCM_LOOP);
 }
 
 static void print_counters(const char *prefix,
@@ -378,6 +410,7 @@ static struct g_opt opts = {
 	.baud_rate = 115200,
 	.loops = 1,
 	.do_termios = 1,
+	.loopback = 0,
 };
 
 static char *uart_rx;
@@ -404,10 +437,7 @@ void run(void)
 
 	fd_rx = setup_uart(&opts_in, O_RDONLY, &old_term_rx);
 
-	if (!strcmp(uart_rx, uart_tx))
-		fd_tx = SAFE_OPEN(uart_tx, O_WRONLY);
-	else
-		fd_tx = setup_uart(&opts_out, O_WRONLY, &old_term_tx);
+	fd_tx = setup_uart(&opts_out, O_WRONLY, &old_term_tx);
 
 	if (!SAFE_FORK()) {
 		ioctl(fd_rx, TIOCGICOUNT, &old_counters);
@@ -439,22 +469,36 @@ void run(void)
 	close(fd_tx);
 }
 
-static void map_file(const char *fname)
+static void map_file(const char *fname,int baud)
 {
 	struct stat st;
+	int size;
 	int fd;
+	char c;
+	FILE *f_des,*f_src;
+
+	size = baud;
 
-	fd = SAFE_OPEN(fname, O_RDONLY);
+	fd = SAFE_OPEN(fname, O_RDWR|O_CREAT);
+	f_src = fopen("/dev/urandom","r");
+	f_des = fopen(fname,"w+");
 
 	SAFE_FSTAT(fd, &st);
 
-	data_len = st.st_size;
+	data_len = size;
 
 	data = SAFE_MMAP(NULL, data_len, PROT_READ,
 	                 MAP_SHARED | MAP_LOCKED | MAP_POPULATE, fd, 0);
 
 	tst_res(TINFO, "Mapped file '%s' size %li bytes", fname, data_len);
+	while(size--)
+	{
+		c = fgetc(f_src);
+		fputc(c,f_des);
+	}
 
+	fclose(f_des);
+	fclose(f_src);
 	SAFE_CLOSE(fd);
 }
 
@@ -479,6 +523,8 @@ static void map_buffer(long buf_size)
 
 static char *baud_rate;
 static char *hwflow;
+static char *loops;
+static char *loopback;
 static char *fname;
 static char *buf_size;
 
@@ -492,17 +538,23 @@ static void setup(void)
 	if (hwflow)
 		opts.hwflow = 1;
 
+	if (loops)
+		tst_parse_int(loops, &(opts.loops), 0, INT_MAX);
+
+	if (loopback)
+		tst_parse_int(loopback, &(opts.loopback), 0, INT_MAX);
+
 	if (fname && buf_size)
 		tst_brk(TBROK, "Only one of -f and -s could be set!");
 
 	if (buf_size)
 		tst_parse_long(buf_size, &size, 0, LONG_MAX);
 
-	uart_rx = getenv("UART_RX");
-	uart_tx = getenv("UART_TX");
+	uart_rx = getenv("UART_DEV");
+	uart_tx = getenv("UART_DEV");
 
 	if (fname)
-		map_file(fname);
+		map_file(fname,opts.baud_rate);
 	else
 		map_buffer(size);
 }
@@ -511,12 +563,14 @@ static struct tst_test test = {
 	.setup = setup,
 	.test_all = run,
 	.options = (struct tst_option[]) {
-		{"b:", &baud_rate, "-b       Baud rate (9600, ...)"},
-		{"w",  &hwflow   , "-w       Enable hwflow (RTS/CTS)"},
-		{"f:",  &fname,    "-f       Binary file for transfers"},
-		{"s:",  &buf_size, "-s       Binary buffer size"},
+		{"b:",  &baud_rate, "-b       Baud rate (9600, ...)"},
+		{"w",   &hwflow,    "-w       Enable hwflow (RTS/CTS)"},
+		{"f:",  &fname,     "-f       Binary file for transfers"},
+		{"l:",  &loops,     "-l       loops to perform(0=>wait for CTRL-C"},
+		{"s:",  &buf_size,  "-s       Binary buffer size"},
+		{"k:",  &loopback,  "-k       Enable loopback modem"},
 		{}
 	},
-	.needs_devices = (const char *const[]) {"UART_RX", "UART_TX", NULL},
+	.needs_devices = (const char *const[]) {"UART_DEV",NULL},
 	.forks_child = 1,
 };
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
