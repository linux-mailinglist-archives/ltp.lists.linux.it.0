Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CE7EFD1C
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 13:24:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C49803C22C6
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 13:23:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 455AE3C22A7
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 13:23:58 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 7244214017ED
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 13:23:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572956636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dFnWwVSwliBDy+leo4eAs0jMOeo4lfOvxL0b/1GfHHo=;
 b=C5F2mIOd75AeX7wIf5Rm6vzyAk+r9EA9f9dPxR58++u5kaXoU3d0ICr1Be66loYbaCRQIv
 8EIMZNENRPJVpyY5ixaoiVqMTCO/zmMVB5siOd+R9090SDJaN5AYc+cpdBBN5HFZRsAOMY
 EGyjDRL9r1w4NE9ekTDE7Y0k53xAtEE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-ku9PlCmZMdiCTiaIFwiy3g-1; Tue, 05 Nov 2019 07:23:52 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BD0D107ACC2;
 Tue,  5 Nov 2019 12:23:51 +0000 (UTC)
Received: from dustball.brq.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72DAF60FC4;
 Tue,  5 Nov 2019 12:23:50 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Tue,  5 Nov 2019 13:23:42 +0100
Message-Id: <4647b3bced96c66c040078a32c13dab65558816d.1572956488.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: ku9PlCmZMdiCTiaIFwiy3g-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/2] read_all: move blacklist to source
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

library doesn't support multiple parameters for same option.

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 runtest/fs                              |  2 +-
 testcases/kernel/fs/read_all/read_all.c | 28 ++++++++++++++++++++++------
 2 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/runtest/fs b/runtest/fs
index 07d6e2b67964..46318575653e 100644
--- a/runtest/fs
+++ b/runtest/fs
@@ -71,7 +71,7 @@ proc01 proc01 -m 128
 
 read_all_dev read_all -d /dev -p -q -r 10
 read_all_proc read_all -d /proc -q -r 10
-read_all_sys read_all -d /sys -q -r 10 -e /sys/power/wakeup_count
+read_all_sys read_all -d /sys -q -r 10
 
 #Run the File System Race Condition Check tests as well
 fs_racer fs_racer.sh -t 5
diff --git a/testcases/kernel/fs/read_all/read_all.c b/testcases/kernel/fs/read_all/read_all.c
index 4edccff03a4f..46f88af2270c 100644
--- a/testcases/kernel/fs/read_all/read_all.c
+++ b/testcases/kernel/fs/read_all/read_all.c
@@ -71,7 +71,6 @@ enum dent_action {
 static char *verbose;
 static char *quiet;
 static char *root_dir;
-static char *exclude;
 static char *str_reads;
 static int reads = 1;
 static char *str_worker_count;
@@ -81,6 +80,11 @@ static long max_workers = 15;
 static struct worker *workers;
 static char *drop_privs;
 
+static char *blacklist[] = {
+	NULL, /* reserved for -e parameter */
+	"/sys/power/wakeup_count",
+};
+
 static struct tst_option options[] = {
 	{"v", &verbose,
 	 "-v       Print information about successful reads."},
@@ -88,7 +92,7 @@ static struct tst_option options[] = {
 	 "-q       Don't print file read or open errors."},
 	{"d:", &root_dir,
 	 "-d path  Path to the directory to read from, defaults to /sys."},
-	{"e:", &exclude,
+	{"e:", &blacklist[0],
 	 "-e pattern Ignore files which match an 'extended' pattern, see fnmatch(3)."},
 	{"r:", &str_reads,
 	 "-r count The number of times to schedule a file for reading."},
@@ -182,17 +186,29 @@ static void sanitize_str(char *buf, ssize_t count)
 		strcpy(buf + MAX_DISPLAY, "...");
 }
 
+static int is_blacklisted(const char *path)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(blacklist); i++) {
+		if (blacklist[i] && !fnmatch(blacklist[i], path, FNM_EXTMATCH)) {
+			if (verbose)
+				tst_res(TINFO, "Ignoring %s", path);
+			return 1;
+		}
+	}
+
+	return 0;
+}
+
 static void read_test(const char *path)
 {
 	char buf[BUFFER_SIZE];
 	int fd;
 	ssize_t count;
 
-	if (exclude && !fnmatch(exclude, path, FNM_EXTMATCH)) {
-		if (verbose)
-			tst_res(TINFO, "Ignoring %s", path);
+	if (is_blacklisted(path))
 		return;
-	}
 
 	if (verbose)
 		tst_res(TINFO, "%s(%s)", __func__, path);
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
