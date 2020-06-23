Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6F62050A2
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Jun 2020 13:28:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D14B13C5DE4
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Jun 2020 13:28:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 9CDB33C05A0
 for <ltp@lists.linux.it>; Tue, 23 Jun 2020 13:28:11 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7E2D26006D6
 for <ltp@lists.linux.it>; Tue, 23 Jun 2020 13:27:17 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5D7E9AF7F;
 Tue, 23 Jun 2020 11:28:09 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 23 Jun 2020 13:28:27 +0200
Message-Id: <20200623112827.10744-3-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200623112827.10744-1-chrubis@suse.cz>
References: <20200623112827.10744-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] device_drivers/uart01: Add uart01 test
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
Cc: automated-testing@yoctoproject.org, Carlos Hernandez <ceh@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is a first example for a device-driver test.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 runtest/kernel_misc                           |   5 +
 .../kernel/device-drivers/uart/.gitignore     |   1 +
 testcases/kernel/device-drivers/uart/Makefile |   4 +
 testcases/kernel/device-drivers/uart/uart01.c | 522 ++++++++++++++++++
 4 files changed, 532 insertions(+)
 create mode 100644 testcases/kernel/device-drivers/uart/.gitignore
 create mode 100644 testcases/kernel/device-drivers/uart/Makefile
 create mode 100644 testcases/kernel/device-drivers/uart/uart01.c

diff --git a/runtest/kernel_misc b/runtest/kernel_misc
index 7937c7bbf..a7f1d9b56 100644
--- a/runtest/kernel_misc
+++ b/runtest/kernel_misc
@@ -13,3 +13,8 @@ zram01 zram01.sh
 zram02 zram02.sh
 zram03 zram03
 umip_basic_test umip_basic_test
+uart01_9600 uart01 -b 9600
+uart01_19200 uart01 -b 19200
+uart01_38400 uart01 -b 38400
+uart01_57600 uart01 -b 57600
+uart01_115200 uart01 -b 115200
diff --git a/testcases/kernel/device-drivers/uart/.gitignore b/testcases/kernel/device-drivers/uart/.gitignore
new file mode 100644
index 000000000..9333e8db9
--- /dev/null
+++ b/testcases/kernel/device-drivers/uart/.gitignore
@@ -0,0 +1 @@
+uart01
diff --git a/testcases/kernel/device-drivers/uart/Makefile b/testcases/kernel/device-drivers/uart/Makefile
new file mode 100644
index 000000000..1c90e5cd6
--- /dev/null
+++ b/testcases/kernel/device-drivers/uart/Makefile
@@ -0,0 +1,4 @@
+
+top_srcdir	?= ../../../..
+include $(top_srcdir)/include/mk/testcases.mk
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/device-drivers/uart/uart01.c b/testcases/kernel/device-drivers/uart/uart01.c
new file mode 100644
index 000000000..4647c55e3
--- /dev/null
+++ b/testcases/kernel/device-drivers/uart/uart01.c
@@ -0,0 +1,522 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+   Copyright (c) 2014 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+   Copyright (c) 2020 Cyril Hrubis <chrubis@suse.cz>
+
+ */
+
+#include <stdio.h>
+#include <ctype.h>
+#include <string.h>
+#include <stdlib.h>
+#include <sys/stat.h>
+#include <fcntl.h>
+#include <termios.h>
+#include <stdarg.h>
+#include <unistd.h>
+#include <sys/mman.h>
+#include <stdint.h>
+#include <poll.h>
+#include <sys/ioctl.h>
+#include <linux/serial.h>
+
+#include "tst_test.h"
+
+static const char hex_asc[] = "0123456789abcdef";
+#define hex_asc_lo(x)	hex_asc[((x) & 0x0f)]
+#define hex_asc_hi(x)	hex_asc[((x) & 0xf0) >> 4]
+
+struct g_opt {
+	char *uart_dev;
+	char *file_trans;
+	int baud_rate;
+	unsigned int loops;
+	unsigned char hwflow;
+	unsigned char do_termios;
+#define MODE_TX_ONLY    (1 << 0)
+#define MODE_RX_ONLY    (1 << 1)
+#define MODE_DUPLEX     (MODE_TX_ONLY | MODE_RX_ONLY)
+	unsigned int mode;
+	unsigned char *cmp_buff;
+};
+
+static int vscnprintf(char *buf, size_t size, const char *fmt, va_list args)
+{
+	int i;
+
+	i = vsnprintf(buf, size, fmt, args);
+
+	if (i < (int)size)
+		return i;
+	if (size != 0)
+		return size - 1;
+	return 0;
+}
+
+static int scnprintf(char *buf, size_t size, const char *fmt, ...)
+{
+	va_list args;
+	int i;
+
+	va_start(args, fmt);
+	i = vscnprintf(buf, size, fmt, args);
+	va_end(args);
+
+	return i;
+}
+
+
+static void hex_dump_to_buffer(const void *buf, int len, int rowsize,
+		int groupsize, char *linebuf, int linebuflen, int ascii)
+{
+	const uint8_t *ptr = buf;
+	uint8_t ch;
+	int j, lx = 0;
+	int ascii_column;
+
+	if (rowsize != 16 && rowsize != 32)
+		rowsize = 16;
+
+	if (!len)
+		goto nil;
+	if (len > rowsize)      /* limit to one line at a time */
+		len = rowsize;
+	if ((len % groupsize) != 0)     /* no mixed size output */
+		groupsize = 1;
+
+	switch (groupsize) {
+	case 8: {
+		const uint64_t *ptr8 = buf;
+		int ngroups = len / groupsize;
+
+		for (j = 0; j < ngroups; j++)
+			lx += scnprintf(linebuf + lx, linebuflen - lx,
+					"%s%16.16llx", j ? " " : "",
+					(unsigned long long)*(ptr8 + j));
+		ascii_column = 17 * ngroups + 2;
+		break;
+		}
+
+	case 4: {
+		const uint32_t *ptr4 = buf;
+		int ngroups = len / groupsize;
+
+		for (j = 0; j < ngroups; j++)
+			lx += scnprintf(linebuf + lx, linebuflen - lx,
+					"%s%8.8x", j ? " " : "", *(ptr4 + j));
+		ascii_column = 9 * ngroups + 2;
+		break;
+		}
+
+	case 2: {
+		const uint16_t *ptr2 = buf;
+		int ngroups = len / groupsize;
+
+		for (j = 0; j < ngroups; j++)
+			lx += scnprintf(linebuf + lx, linebuflen - lx,
+					"%s%4.4x", j ? " " : "", *(ptr2 + j));
+		ascii_column = 5 * ngroups + 2;
+		break;
+		}
+
+	default:
+		for (j = 0; (j < len) && (lx + 3) <= linebuflen; j++) {
+			ch = ptr[j];
+			linebuf[lx++] = hex_asc_hi(ch);
+			linebuf[lx++] = hex_asc_lo(ch);
+			linebuf[lx++] = ' ';
+			if (j == 7)
+				linebuf[lx++] = ' ';
+		}
+		if (j)
+			lx--;
+
+		ascii_column = 3 * rowsize + 2 + 2;
+		break;
+	}
+	if (!ascii)
+		goto nil;
+
+	while (lx < (linebuflen - 1) && lx < (ascii_column - 1))
+		linebuf[lx++] = ' ';
+	for (j = 0; (j < len) && (lx + 2) < linebuflen; j++) {
+		ch = ptr[j];
+		linebuf[lx++] = (isascii(ch) && isprint(ch)) ? ch : '.';
+	}
+nil:
+	linebuf[lx++] = '\0';
+}
+
+static void print_hex_dump(const void *buf, int len, int offset)
+{
+	const uint8_t *ptr = buf;
+	int i, linelen, remaining = len;
+	char linebuf[32 * 3 + 2 + 32 + 2 + 1];
+	int rowsize = 16;
+	int groupsize = 1;
+
+	if (rowsize != 16 && rowsize != 32)
+		rowsize = 16;
+
+	for (i = 0; i < len; i += rowsize) {
+		linelen = MIN(remaining, rowsize);
+		remaining -= rowsize;
+
+		hex_dump_to_buffer(ptr + i, linelen, rowsize, groupsize,
+				linebuf, sizeof(linebuf), 1);
+
+		printf("%.8x: %s\n", i + offset, linebuf);
+	}
+}
+
+static int stress_test_uart_once(struct g_opt *opts, int fd, unsigned char *data,
+		off_t data_len)
+{
+	unsigned char *cmp_data = opts->cmp_buff;
+	ssize_t size;
+	int wait_rx;
+	int wait_tx;
+	ssize_t progress_rx = 0;
+	ssize_t progress_tx = 0;
+	unsigned int reads = 0;
+	unsigned int writes = 0;
+
+	do {
+		struct pollfd pfd = {
+			.fd = fd,
+		};
+		int ret;
+
+		if (opts->mode & MODE_RX_ONLY && progress_rx < data_len) {
+			pfd.events |= POLLIN;
+			wait_rx = 1;
+		} else {
+			wait_rx = 0;
+		}
+
+		if (opts->mode & MODE_TX_ONLY && progress_tx < data_len) {
+			pfd.events |= POLLOUT;
+			wait_tx = 1;
+		} else {
+			wait_tx = 0;
+		}
+
+		ret = poll(&pfd, 1, 10 * 1000);
+		if (ret == 0) {
+			tst_res(TFAIL, "timeout, RX/TX: %zd/%zd\n", progress_rx, progress_tx);
+			break;
+		}
+		if (ret < 0) {
+			tst_res(TFAIL | TERRNO, "poll() failed");
+			return 1;
+		}
+
+		if (pfd.revents & POLLIN) {
+			size = read(fd, cmp_data + progress_rx, data_len - progress_rx);
+			if (size < 0) {
+				tst_res(TFAIL | TERRNO, "read() failed");
+				return 1;
+			}
+			reads++;
+			progress_rx += size;
+			if (progress_rx >= data_len)
+				wait_rx = 0;
+		}
+
+		if (pfd.revents & POLLOUT) {
+
+			size = write(fd, data + progress_tx, data_len - progress_tx);
+			if (size < 0) {
+				tst_res(TFAIL | TERRNO, "write() failed");
+				return 1;
+			}
+			writes++;
+			progress_tx += size;
+			if (progress_tx >= data_len)
+				wait_tx = 0;
+		}
+	} while (wait_rx || wait_tx);
+
+	tst_res(TINFO, "Needed %u reads %u writes ", reads, writes);
+
+	if (opts->mode & MODE_RX_ONLY) {
+		unsigned int i;
+		int found = 0;
+		unsigned int min_pos;
+		unsigned int max_pos;
+
+		if (!memcmp(data, cmp_data, data_len)) {
+			tst_res(TPASS, "RX passed");
+			return 0;
+		}
+
+		for (i = 0; i < data_len && !found; i++) {
+			if (data[i] != cmp_data[i]) {
+				found = 1;
+				break;
+			}
+		}
+
+		if (!found) {
+			tst_res(TFAIL, "memcmp() didn't match but manual cmp did");
+			return 1;
+		}
+
+		max_pos = (i & ~0xfULL) + 16 * 3;
+		if (max_pos > data_len)
+			max_pos = data_len;
+
+		min_pos = i & ~0xfULL;
+		if (min_pos > 16 * 3)
+			min_pos -= 16 * 3;
+		else
+			min_pos = 0;
+
+		tst_res(TFAIL, "Oh oh, inconsistency at pos %d (0x%x)", i, i);
+
+		printf("\nOriginal sample:\n");
+		print_hex_dump(data + min_pos, max_pos - min_pos, min_pos);
+
+		printf("\nReceived sample:\n");
+		print_hex_dump(cmp_data + min_pos, max_pos - min_pos, min_pos);
+		return 1;
+	}
+
+	if (opts->mode & MODE_TX_ONLY)
+		tst_res(TPASS, "TX passed");
+
+	return 0;
+}
+
+static int stress_test_uart(struct g_opt *opts, int fd, unsigned char *data, off_t data_len)
+{
+	unsigned int loops = 0;
+	int status;
+
+	opts->cmp_buff = SAFE_MALLOC(data_len);
+	memset(opts->cmp_buff, 0, data_len);
+
+	do {
+		status = stress_test_uart_once(opts, fd, data, data_len);
+		memset(opts->cmp_buff, 0, data_len);
+	} while (++loops < opts->loops && !status);
+
+	free(opts->cmp_buff);
+
+	return status;
+}
+
+static int setup_uart(struct g_opt *opts, int open_mode, struct termios *old_term)
+{
+	struct termios new_term;
+	int fd;
+	int ret;
+
+	tst_res(TINFO, "Setting up %s speed %u hwflow=%u",
+	        opts->uart_dev, opts->baud_rate, opts->hwflow);
+
+	fd = SAFE_OPEN(opts->uart_dev, open_mode | O_NONBLOCK);
+
+	ret = tcgetattr(fd, old_term);
+	if (ret < 0)
+		tst_brk(TBROK, "tcgetattr() failed: %m\n");
+
+	new_term = *old_term;
+
+	/* or c_cflag |= BOTHER and c_ospeed for any speed */
+	ret = cfsetspeed(&new_term, opts->baud_rate);
+	if (ret < 0)
+		tst_brk(TBROK, "cfsetspeed(, %u) failed %m\n", opts->baud_rate);
+	cfmakeraw(&new_term);
+	new_term.c_cflag |= CREAD;
+	if (opts->hwflow)
+		new_term.c_cflag |= CRTSCTS;
+	else
+		new_term.c_cflag &= ~CRTSCTS;
+	new_term.c_cc[VMIN] = 64;
+	new_term.c_cc[VTIME] = 8;
+
+	ret = tcsetattr(fd, TCSANOW, &new_term);
+	if (ret < 0)
+		tst_brk(TBROK, "tcsetattr failed: %m\n");
+
+	if (opts->do_termios) {
+		ret = tcflush(fd, TCIFLUSH);
+		if (ret < 0)
+			tst_brk(TBROK, "tcflush failed: %m\n");
+	}
+
+	ret = fcntl(fd, F_SETFL, 0);
+	if (ret)
+		printf("Failed to remove nonblock mode\n");
+
+	return fd;
+}
+
+static void restore_uart(int fd, struct termios *old_term)
+{
+	int ret = tcsetattr(fd, TCSAFLUSH, old_term);
+	if (ret)
+		printf("tcsetattr() of old ones failed: %m\n");
+}
+
+static void print_counters(const char *prefix,
+                           struct serial_icounter_struct *old,
+                           struct serial_icounter_struct *new)
+{
+#define CNT(x) (new->x - old->x)
+	printf("%scts: %d dsr: %d rng: %d dcd: %d rx: %d tx: %d "
+		"frame %d ovr %d par: %d brk: %d buf_ovrr: %d\n", prefix,
+		CNT(cts), CNT(dsr), CNT(rng), CNT(dcd), CNT(rx),
+		CNT(tx), CNT(frame), CNT(overrun), CNT(parity),
+		CNT(brk), CNT(buf_overrun));
+#undef CNT
+}
+
+static struct g_opt opts = {
+	.baud_rate = 115200,
+	.loops = 1,
+	.do_termios = 1,
+};
+
+static char *uart_rx;
+static char *uart_tx;
+
+unsigned char *data;
+static long data_len;
+
+void run(void)
+{
+	struct serial_icounter_struct old_counters;
+	struct serial_icounter_struct new_counters;
+	int ret, fd_rx, fd_tx;
+	struct termios old_term_rx, old_term_tx;
+
+	struct g_opt opts_in = opts;
+	struct g_opt opts_out = opts;
+
+	opts_in.uart_dev = uart_rx;
+	opts_out.uart_dev = uart_tx;
+
+	opts_in.mode = MODE_RX_ONLY;
+	opts_out.mode = MODE_TX_ONLY;
+
+	fd_rx = setup_uart(&opts_in, O_RDONLY, &old_term_rx);
+
+	if (!strcmp(uart_rx, uart_tx))
+		fd_tx = SAFE_OPEN(uart_tx, O_WRONLY);
+	else
+		fd_tx = setup_uart(&opts_out, O_WRONLY, &old_term_tx);
+
+	if (!SAFE_FORK()) {
+		ioctl(fd_rx, TIOCGICOUNT, &old_counters);
+		stress_test_uart(&opts_in, fd_rx, data, data_len);
+		ret = ioctl(fd_rx, TIOCGICOUNT, &new_counters);
+		if (ret > 0)
+			print_counters("RX:", &old_counters, &new_counters);
+		exit(0);
+	}
+
+	if (!SAFE_FORK()) {
+		ioctl(fd_tx, TIOCGICOUNT, &old_counters);
+		stress_test_uart(&opts_out, fd_tx, data, data_len);
+		ret = ioctl(fd_tx, TIOCGICOUNT, &new_counters);
+		if (ret > 0)
+			print_counters("TX:", &old_counters, &new_counters);
+		exit(0);
+	}
+
+	SAFE_WAIT(NULL);
+	SAFE_WAIT(NULL);
+
+	restore_uart(fd_rx, &old_term_rx);
+
+	if (strcmp(uart_rx, uart_tx))
+		restore_uart(fd_tx, &old_term_tx);
+
+	close(fd_rx);
+	close(fd_tx);
+}
+
+static void map_file(const char *fname)
+{
+	struct stat st;
+	int fd;
+
+	fd = SAFE_OPEN(fname, O_RDONLY);
+
+	SAFE_FSTAT(fd, &st);
+
+	data_len = st.st_size;
+
+	data = SAFE_MMAP(NULL, data_len, PROT_READ,
+	                 MAP_SHARED | MAP_LOCKED | MAP_POPULATE, fd, 0);
+
+	tst_res(TINFO, "Mapped file '%s' size %li bytes", fname, data_len);
+
+	SAFE_CLOSE(fd);
+}
+
+static void map_buffer(long buf_size)
+{
+	size_t i;
+
+	data_len = buf_size;
+
+	data = SAFE_MMAP(NULL, data_len, PROT_READ | PROT_WRITE,
+	                 MAP_ANONYMOUS | MAP_SHARED | MAP_LOCKED, -1, 0);
+
+	long *p = (void*)data;
+
+	srandom(time(NULL));
+
+	for (i = 0; i < data_len / sizeof(long); i++)
+		p[i] = random();
+
+	tst_res(TINFO, "Mapped anynymous memory size %li bytes", data_len);
+}
+
+static char *baud_rate;
+static char *hwflow;
+static char *fname;
+static char *buf_size;
+
+static void setup(void)
+{
+	long size = 1024;
+
+	if (baud_rate)
+		tst_parse_int(baud_rate, &(opts.baud_rate), 0, INT_MAX);
+
+	if (hwflow)
+		opts.hwflow = 1;
+
+	if (fname && buf_size)
+		tst_brk(TBROK, "Only one of -f and -s could be set!");
+
+	if (buf_size)
+		tst_parse_long(buf_size, &size, 0, LONG_MAX);
+
+	uart_rx = getenv("UART_RX");
+	uart_tx = getenv("UART_TX");
+
+	if (fname)
+		map_file(fname);
+	else
+		map_buffer(size);
+}
+
+static struct tst_test test = {
+	.setup = setup,
+	.test_all = run,
+	.options = (struct tst_option[]) {
+		{"b:", &baud_rate, "-b       Baud rate (9600, ...)"},
+		{"w",  &hwflow   , "-w       Enable hwflow (RTS/CTS)"},
+		{"f:",  &fname,    "-f       Binary file for transfers"},
+		{"s:",  &buf_size, "-s       Binary buffer size"},
+		{}
+	},
+	.needs_devices = (const char *const[]) {"UART_RX", "UART_TX", NULL},
+	.forks_child = 1,
+};
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
