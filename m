Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C569B2050A3
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Jun 2020 13:28:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 794093C1E06
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Jun 2020 13:28:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 980A03C01CE
 for <ltp@lists.linux.it>; Tue, 23 Jun 2020 13:28:10 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 67BE51000523
 for <ltp@lists.linux.it>; Tue, 23 Jun 2020 13:28:10 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F3485AF73;
 Tue, 23 Jun 2020 11:28:08 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 23 Jun 2020 13:28:26 +0200
Message-Id: <20200623112827.10744-2-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200623112827.10744-1-chrubis@suse.cz>
References: <20200623112827.10744-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] tst_test: Add support for device discovery
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

Device discovery
----------------

The problem
-----------

Each lab has a different hardware capabilities and configuration. A test
that heavily depends on a hardware needs to get this information in
order to be able to run correctly.

The solution
------------

The test declares which devices it needs for a testing. In the uart test
these are UART_RX and UART_TX which are two UART endpoints which are
connected together.

This information is then passed as a parameter to a device-discovery.sh
script that prints, possibly several lines, of device listrs, which is
then parsed by the test library and the test is executed accordingly.

The data are passed to the test as a environment variables, if these are
set prior to the test start, we do not even attempt to do a device
discovery. If these are unset, we run the device discovery and loop the
test around the lists we got.

Why this solution?
------------------

The device discovery is lab specific and does not belong to the test
itself. This is an attempt to abstract the interface between the test
and the hardware so that we can finally add device drivers tests into
LTP.

Missing pieces
--------------

There are stil a few missing pieces, but these are probably easy to fix
as well.

Device reconfiguration
~~~~~~~~~~~~~~~~~~~~~~

I suppose that we may need to run a command so that the devices are
reconfigured as we need them. I.e. the device-discovery.sh will have to
output a comand that needs to be executed in order to prepare the
physical environment e.g. relays in case of the UART.

Device parameters
~~~~~~~~~~~~~~~~~

We may as well need some extra info about the devices, e.g. is hardware
flow connected in case of UART. So the device-discover.sh will add one
more environment variable e.g. UART_PARS="hwflow" that could be parsed
in the test as well.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 device-discovery.sh |   5 +
 include/tst_test.h  |   3 +
 lib/tst_devices.c   | 228 ++++++++++++++++++++++++++++++++++++++++++++
 lib/tst_devices.h   |  32 +++++++
 lib/tst_test.c      |  60 ++++++++++--
 5 files changed, 321 insertions(+), 7 deletions(-)
 create mode 100755 device-discovery.sh
 create mode 100644 lib/tst_devices.c
 create mode 100644 lib/tst_devices.h

diff --git a/device-discovery.sh b/device-discovery.sh
new file mode 100755
index 000000000..08460c41f
--- /dev/null
+++ b/device-discovery.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+if [ "$1" = "UART_RX-UART_TX" ]; then
+	echo "UART_RX=/dev/ttyUSB0 UART_TX=/dev/ttyUSB0"
+fi
diff --git a/include/tst_test.h b/include/tst_test.h
index b84f7b9dd..3c3693098 100644
--- a/include/tst_test.h
+++ b/include/tst_test.h
@@ -215,6 +215,9 @@ struct tst_test {
 	/* NULL terminated array of needed kernel drivers */
 	const char * const *needs_drivers;
 
+	/* NULL terminated array of devices */
+	const char *const *needs_devices;
+
 	/*
 	 * NULL terminated array of (/proc, /sys) files to save
 	 * before setup and restore after cleanup
diff --git a/lib/tst_devices.c b/lib/tst_devices.c
new file mode 100644
index 000000000..087e2021b
--- /dev/null
+++ b/lib/tst_devices.c
@@ -0,0 +1,228 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Cyril Hrubis <chrubis@suse.cz>
+ */
+
+/*
+ * Device discovery code.
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+
+#include "tst_devices.h"
+
+#define TST_NO_DEFAULT_MAIN
+#include "tst_test.h"
+
+struct tst_devlist {
+	struct tst_devlist *next;
+	unsigned int dev_cnt;
+	char *devs[];
+};
+
+static char *create_devstr(const char *const needs_devices[])
+{
+	unsigned int i;
+	size_t len = 1;
+
+	for (i = 0; needs_devices[i]; i++)
+		len += strlen(needs_devices[i]) + 1;
+
+	char *res = malloc(len);
+
+	if (!res) {
+		tst_res(TWARN | TERRNO, "Malloc failed");
+		return NULL;
+	}
+
+	char *p = res;
+
+	for (i = 0; needs_devices[i]; i++) {
+		strcpy(p, needs_devices[i]);
+		p += strlen(needs_devices[i]);
+		if (needs_devices[i+1]) {
+			p[0] = '-';
+			p++;
+		}
+	}
+
+	tst_res(TINFO, "Device discovery string '%s'", res);
+
+	return res;
+}
+
+static int get_index(const char *env, const char *const needs_devices[])
+{
+	char *p = strdup(env);
+	char *save;
+	char *name = strtok_r(p, "=", &save);
+	unsigned int i;
+
+	for (i = 0; needs_devices[i]; i++)
+		if (!strcmp(needs_devices[i], name))
+			return i;
+
+	return -1;
+}
+
+static unsigned int count_devices(const char *const needs_devices[])
+{
+	unsigned int i = 0;
+
+	while (needs_devices[i])
+		i++;
+
+	return i;
+}
+
+static struct tst_devlist *new_devlist(char *devices[], unsigned int dev_cnt,
+                                       const char *const needs_devices[])
+{
+	unsigned int i;
+	int incomplete = 0;
+
+	for (i = 0; i < dev_cnt; i++) {
+		if (!devices[i]) {
+			tst_res(TWARN, "Missing env var '%s'", needs_devices[i]);
+			incomplete = 1;
+		}
+	}
+
+	if (incomplete)
+		goto err;
+
+	struct tst_devlist *new = malloc(sizeof(struct tst_devlist) + dev_cnt * sizeof(void*));
+
+	if (!new) {
+		tst_res(TWARN, "Malloc failed");
+		goto err;
+	}
+
+	for (i = 0; i < dev_cnt; i++)
+		new->devs[i] = devices[i];
+
+	new->dev_cnt = dev_cnt;
+
+	return new;
+err:
+	for (i = 0; needs_devices[i]; i++)
+		free(devices[i]);
+
+	return NULL;
+}
+
+struct tst_devlist *tst_devlist_discover(const char *const needs_devices[])
+{
+	const char *ltproot = getenv("LTPROOT");
+	const char *device_discovery = getenv("DEVICE_DISCOVERY");
+	char buf[2048];
+	struct tst_devlist *root = NULL;
+
+	if (!device_discovery) {
+		if (!ltproot) {
+			tst_res(TCONF, "No LTPROOT nor DEVICE_DISCOVERY set!");
+			return NULL;
+		}
+
+		snprintf(buf, sizeof(buf), "%s/device-discovery.sh", ltproot);
+
+		device_discovery = buf;
+	}
+
+	char *devstr = create_devstr(needs_devices);
+
+	if (!devstr)
+		return NULL;
+
+	char *cmdline = malloc(strlen(buf) + strlen(devstr) + 3);
+
+	if (!cmdline) {
+		tst_res(TWARN | TERRNO, "Malloc failed");
+		return NULL;
+	}
+
+	sprintf(cmdline, "%s \"%s\"", device_discovery, devstr);
+
+	free(devstr);
+
+	FILE *pipe = popen(cmdline, "r");
+
+	unsigned int dev_cnt = count_devices(needs_devices);
+	char *devices[dev_cnt];
+	unsigned int devlist_cnt = 0;
+
+	memset(devices, 0, sizeof(devices));
+
+	while (fgets(buf, sizeof(buf), pipe)) {
+		char *tok, *save, *str = buf;
+
+		while ((tok = strtok_r(str, " \n\t", &save))) {
+			int i = get_index(tok, needs_devices);
+
+			if (i < 0) {
+				tst_res(TWARN, "Invalid env var '%s'", tok);
+				break;
+			}
+
+			if (devices[i]) {
+				tst_res(TWARN,
+				        "Duplicated env var '%s' and '%s'",
+				        tok, devices[i]);
+				break;
+			}
+
+			devices[i] = strdup(tok);
+
+			str = NULL;
+		}
+
+		struct tst_devlist *list = new_devlist(devices, dev_cnt, needs_devices);
+
+		memset(devices, 0, sizeof(devices));
+
+		if (!list)
+			continue;
+
+		list->next = root;
+		root = list;
+		devlist_cnt++;
+	}
+
+	free(cmdline);
+
+	if (!pipe)
+		tst_res(TWARN | TERRNO, "Failed to execute device discovery");
+
+	pclose(pipe);
+
+	tst_res(TINFO, "Loaded %i device list(s)", devlist_cnt);
+
+	return root;
+}
+
+unsigned int tst_devlist_cnt(struct tst_devlist *self)
+{
+	struct tst_devlist *i;
+	unsigned int cnt = 0;
+
+	for (i = self; i; i = i->next)
+		cnt++;
+
+	return cnt;
+}
+
+void tst_devlist_setup(struct tst_devlist *self, unsigned int i)
+{
+	struct tst_devlist *l;
+	unsigned int j, cnt = 0;
+
+	for (l = self; l; l = l->next) {
+		if (i == cnt)
+			break;
+		cnt++;
+	}
+
+	for (j = 0; j < l->dev_cnt; j++)
+		putenv(l->devs[j]);
+}
diff --git a/lib/tst_devices.h b/lib/tst_devices.h
new file mode 100644
index 000000000..dd0047716
--- /dev/null
+++ b/lib/tst_devices.h
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Cyril Hrubis <chrubis@suse.cz>
+ */
+
+/*
+ * Device discovery code.
+ */
+
+#ifndef TST_DEVICES_H__
+#define TST_DEVICES_H__
+
+struct tst_devlist;
+
+/*
+ * Attempts to run a device discovery scripts for a given needs_devices list.
+ */
+struct tst_devlist *tst_devlist_discover(const char *const needs_devices[]);
+
+/*
+ * Returns the number of device configurations.
+ */
+unsigned int tst_devlist_cnt(struct tst_devlist *self);
+
+/*
+ * Setups the environment for a device list with index i.
+ *
+ * Exports the device list base on the variables.
+ */
+void tst_devlist_setup(struct tst_devlist *self, unsigned int i);
+
+#endif /* TST_DEVICES_H__ */
diff --git a/lib/tst_test.c b/lib/tst_test.c
index e93c88ba5..4ae6d7d52 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -27,6 +27,7 @@
 #include "tst_wallclock.h"
 #include "tst_sys_conf.h"
 #include "tst_kconfig.h"
+#include "tst_devices.h"
 
 #include "old_resource.h"
 #include "old_device.h"
@@ -42,6 +43,8 @@ const char *TCID __attribute__((weak));
 
 struct tst_test *tst_test;
 
+static struct tst_devlist *devlist;
+
 static const char *tid;
 static int iterations = 1;
 static float duration = -1;
@@ -471,6 +474,22 @@ static void print_test_tags(void)
 	printf("\n");
 }
 
+static void print_test_devices(void)
+{
+	const char *const *devices = tst_test->needs_devices;
+	int i;
+
+	if (!devices)
+		return;
+
+	printf("\nNeeded devices\n--------------\n");
+
+	for (i = 0; devices[i]; i++)
+		printf("%s\n", devices[i]);
+
+	printf("\n");
+}
+
 static void check_option_collision(void)
 {
 	unsigned int i, j;
@@ -550,6 +569,7 @@ static void parse_opts(int argc, char *argv[])
 		case 'h':
 			print_help();
 			print_test_tags();
+			print_test_devices();
 			exit(0);
 		case 'i':
 			iterations = atoi(optarg);
@@ -907,6 +927,24 @@ static void do_setup(int argc, char *argv[])
 				tst_brk(TCONF, "%s driver not available", name);
 	}
 
+	if (tst_test->needs_devices) {
+		int i;
+		const char *name;
+		int all_set = 1;
+
+		for (i = 0; (name = tst_test->needs_devices[i]); i++) {
+			if (!getenv(name))
+				all_set = 0;
+		}
+
+		if (!all_set) {
+			devlist = tst_devlist_discover(tst_test->needs_devices);
+
+			if (!devlist)
+				tst_brk(TCONF, "No devices discovered");
+		}
+	}
+
 	if (tst_test->format_device)
 		tst_test->needs_device = 1;
 
@@ -1335,6 +1373,7 @@ void tst_run_tcases(int argc, char *argv[], struct tst_test *self)
 {
 	int ret = 0;
 	unsigned int test_variants = 1;
+	unsigned int dev_list, device_lists;
 
 	lib_pid = getpid();
 	tst_test = self;
@@ -1349,14 +1388,21 @@ void tst_run_tcases(int argc, char *argv[], struct tst_test *self)
 	if (tst_test->test_variants)
 		test_variants = tst_test->test_variants;
 
-	for (tst_variant = 0; tst_variant < test_variants; tst_variant++) {
-		if (tst_test->all_filesystems)
-			ret |= run_tcases_per_fs();
-		else
-			ret |= fork_testrun();
+	device_lists = tst_devlist_cnt(devlist);
+
+	for (dev_list = 0; dev_list < device_lists; dev_list++) {
 
-		if (ret & ~(TCONF))
-			goto exit;
+		tst_devlist_setup(devlist, dev_list);
+
+		for (tst_variant = 0; tst_variant < test_variants; tst_variant++) {
+			if (tst_test->all_filesystems)
+				ret |= run_tcases_per_fs();
+			else
+				ret |= fork_testrun();
+
+			if (ret & ~(TCONF))
+				goto exit;
+		}
 	}
 
 exit:
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
