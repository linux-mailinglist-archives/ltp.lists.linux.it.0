Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D21E2EE592
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 18:09:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6015B3C257A
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 18:09:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 44A243C2438
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 18:09:20 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 8692D200764
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 18:09:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572887357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QgAYj1Hwcuk36fDbC6YTOrLPnpnsq5NAvfXnTDzssCg=;
 b=Qmyj0saFI2F2cxeHpMqq+jrWK9265rm2ek/JIiI9vic7CRWb5Fm4tnBY2QyoKAh1FdUrza
 g74/ZrFtDPyW1wK6mWesg5NnLj3Z1W7r56cG/Nc0b/Cy3cUu9gOOUdUjMMQHmNpAuMMP49
 erh7n5S5QyuR++jslBJfiPK5Ku364b8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-MbfdK_HWPP-TbK2Y98hfaA-1; Mon, 04 Nov 2019 12:09:15 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2D931005500
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 17:09:14 +0000 (UTC)
Received: from dustball.brq.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C8E75E242
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 17:09:14 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Mon,  4 Nov 2019 18:09:07 +0100
Message-Id: <2086f9d5a3ce152780833993e6e21d3fbd074441.1572887015.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: MbfdK_HWPP-TbK2Y98hfaA-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] read_all: move blacklist to source
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
 testcases/kernel/fs/read_all/read_all.c | 28 ++++++++++++++++++++++++----
 2 files changed, 25 insertions(+), 5 deletions(-)

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
index 4edccff03a4f..cef55e20d671 100644
--- a/testcases/kernel/fs/read_all/read_all.c
+++ b/testcases/kernel/fs/read_all/read_all.c
@@ -81,6 +81,11 @@ static long max_workers = 15;
 static struct worker *workers;
 static char *drop_privs;
 
+static char *blacklist[] = {
+	"/sys/power/wakeup_count",
+};
+static unsigned int blacklist_sz = ARRAY_SIZE(blacklist);
+
 static struct tst_option options[] = {
 	{"v", &verbose,
 	 "-v       Print information about successful reads."},
@@ -182,17 +187,32 @@ static void sanitize_str(char *buf, ssize_t count)
 		strcpy(buf + MAX_DISPLAY, "...");
 }
 
+static int is_blacklisted(const char *path)
+{
+	unsigned int i;
+	char *bstr;
+
+	for (i = 0; i < blacklist_sz + 1; i++) {
+		bstr = i < blacklist_sz ? blacklist[i] : exclude;
+
+		if (bstr && !fnmatch(bstr, path, FNM_EXTMATCH)) {
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
