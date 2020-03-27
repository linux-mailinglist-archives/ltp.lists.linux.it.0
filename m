Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 979A0195846
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Mar 2020 14:47:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 515B33C3300
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Mar 2020 14:47:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 3F3393C0430
 for <ltp@lists.linux.it>; Fri, 27 Mar 2020 14:47:11 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B48171401753
 for <ltp@lists.linux.it>; Fri, 27 Mar 2020 14:47:10 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3E02FADF8;
 Fri, 27 Mar 2020 13:47:10 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 27 Mar 2020 14:47:06 +0100
Message-Id: <20200327134707.4532-2-chrubis@suse.cz>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200327134707.4532-1-chrubis@suse.cz>
References: <20200327134707.4532-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] tst_test: Add support for needs_devices
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
Cc: Carlos Hernandez <ceh@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Which is a list of environment variables needed for a test.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 include/tst_test.h |  3 +++
 lib/tst_test.c     | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/include/tst_test.h b/include/tst_test.h
index 84b6a940f..75d6632a2 100644
--- a/include/tst_test.h
+++ b/include/tst_test.h
@@ -213,6 +213,9 @@ struct tst_test {
 	/* NULL terminated array of needed kernel drivers */
 	const char * const *needs_drivers;
 
+	/* NULL terminated array of devices */
+	const char *const *needs_devices;
+
 	/*
 	 * NULL terminated array of (/proc, /sys) files to save
 	 * before setup and restore after cleanup
diff --git a/lib/tst_test.c b/lib/tst_test.c
index 9479264b2..da7324b78 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -464,6 +464,22 @@ static void print_test_tags(void)
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
@@ -543,6 +559,7 @@ static void parse_opts(int argc, char *argv[])
 		case 'h':
 			print_help();
 			print_test_tags();
+			print_test_devices();
 			exit(0);
 		case 'i':
 			iterations = atoi(optarg);
@@ -890,6 +907,21 @@ static void do_setup(int argc, char *argv[])
 				tst_brk(TCONF, "%s driver not available", name);
 	}
 
+	if (tst_test->needs_devices) {
+		int i;
+		const char *name;
+		int exit = 0;
+
+		for (i = 0; (name = tst_test->needs_devices[i]); i++) {
+			if (!getenv(name)) {
+				tst_res(TINFO, "%s device env variable mising", name);
+				exit = 1;
+			}
+		}
+		if (exit)
+			tst_brk(TCONF, "Device(s) not passed to the test");
+	}
+
 	if (tst_test->format_device)
 		tst_test->needs_device = 1;
 
-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
