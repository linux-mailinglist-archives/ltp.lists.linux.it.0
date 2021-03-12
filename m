Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E3D338C4C
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Mar 2021 13:03:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 549603C685F
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Mar 2021 13:03:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 414233C6830
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 13:03:15 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 8B4C0100127C
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 13:03:13 +0100 (CET)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AMy95Rq/Zuiib8N0UY3puk+A4I+orLtY04lQ7?=
 =?us-ascii?q?vn1ZYxpTb8CeioSSjO0WvCWE7Ao5dVMBvZS7OKeGSW7B7pId2+QsFJqrQQWOgg?=
 =?us-ascii?q?WVBa5v4YboyzfjXw3Sn9Q26Y5OaK57YeeQMXFfreLXpDa1CMwhxt7vytHMuc77?=
 =?us-ascii?q?w212RQ9nL4FMhj0JaTqzKUF9SAlYCZdRLvP1ifZvnSaqengcc62Adxs4dtXEzu?=
 =?us-ascii?q?eqqLvWJTYCBzMCrDKFlC6U7tfBeCSw71MzVCxuzN4ZnVT4rw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.81,243,1610380800"; d="scan'208";a="105549625"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 12 Mar 2021 20:03:12 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 35A524CEA9B7
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 20:03:12 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 12 Mar 2021 20:03:02 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Fri, 12 Mar 2021 20:02:21 +0800
Message-ID: <1615550541-21714-5-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1615550541-21714-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <20201111163114.GB23576@yuki.lan>
 <1615550541-21714-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 35A524CEA9B7.ADF3E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.1 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v4 5/5] libs/libltpipc: Remove useless function and c
 file
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Only old msgstress* case use these apis, so we can remove them

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 include/libmsgctl.h        |  39 ----------
 libs/libltpipc/libipc.c    |  46 ------------
 libs/libltpipc/libmsgctl.c | 147 -------------------------------------
 3 files changed, 232 deletions(-)
 delete mode 100644 include/libmsgctl.h
 delete mode 100644 libs/libltpipc/libmsgctl.c

diff --git a/include/libmsgctl.h b/include/libmsgctl.h
deleted file mode 100644
index e1afeab5f..000000000
--- a/include/libmsgctl.h
+++ /dev/null
@@ -1,39 +0,0 @@
-/*
- * Copyright (c) International Business Machines  Corp., 2002
- * Copyright (c) 2013 Oracle and/or its affiliates. All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License as
- * published by the Free Software Foundation; either version 2 of
- * the License, or (at your option) any later version.
- *
- * This program is distributed in the hope that it would be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write the Free Software Foundation,
- * Inc.,  51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
- */
-
-#ifndef __LIBMSGCTL_H__
-#define __LIBMSGCTL_H__
-
-#define FAIL	1
-#define PASS	0
-
-struct mbuffer {
-	long type;
-	struct {
-		char len;
-		char pbytes[99];
-	} data;
-};
-
-int doreader(long key, int tid, long type, int child, int nreps);
-int dowriter(long key, int tid, long type, int child, int nreps);
-int fill_buffer(char *buf, char val, int size);
-int verify(char *buf, char val, int size, int child);
-
-#endif /*__LIBMSGCTL_H__ */
diff --git a/libs/libltpipc/libipc.c b/libs/libltpipc/libipc.c
index d94880f54..aeefaa9f4 100644
--- a/libs/libltpipc/libipc.c
+++ b/libs/libltpipc/libipc.c
@@ -172,49 +172,3 @@ void rm_shm(int shm_id)
 }
 
 #define BUFSIZE 512
-
-/*
- * Get the number of message queues already in use
- */
-int get_used_msgqueues(void)
-{
-	FILE *f;
-	int used_queues;
-	char buff[BUFSIZE];
-
-	f = popen("ipcs -q", "r");
-	if (!f) {
-		tst_brkm(TBROK | TERRNO, NULL, "pipe failed");
-	}
-	/* FIXME: Start at -4 because ipcs prints four lines of header */
-	for (used_queues = -4; fgets(buff, BUFSIZE, f); used_queues++) ;
-	pclose(f);
-	if (used_queues < 0) {
-		tst_brkm(TBROK, NULL, "Could not read output of 'ipcs' to "
-			 "calculate used message queues");
-	}
-	return used_queues;
-}
-
-/*
- * Get the max number of message queues allowed on system
- */
-int get_max_msgqueues(void)
-{
-	FILE *f;
-	char buff[BUFSIZE];
-
-	/* Get the max number of message queues allowed on system */
-	f = fopen("/proc/sys/kernel/msgmni", "r");
-	if (!f) {
-		tst_resm(TBROK, "Could not open /proc/sys/kernel/msgmni");
-		return -1;
-	}
-	if (!fgets(buff, BUFSIZE, f)) {
-		fclose(f);
-		tst_resm(TBROK, "Could not read /proc/sys/kernel/msgmni");
-		return -1;
-	}
-	fclose(f);
-	return atoi(buff);
-}
diff --git a/libs/libltpipc/libmsgctl.c b/libs/libltpipc/libmsgctl.c
deleted file mode 100644
index ae459d480..000000000
--- a/libs/libltpipc/libmsgctl.c
+++ /dev/null
@@ -1,147 +0,0 @@
-/*
- * Copyright (c) International Business Machines  Corp., 2002
- * Copyright (c) 2013 Oracle and/or its affiliates. All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License as
- * published by the Free Software Foundation; either version 2 of
- * the License, or (at your option) any later version.
- *
- * This program is distributed in the hope that it would be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write the Free Software Foundation,
- * Inc.,  51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
- */
-
-#include <errno.h>
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-#include <sys/stat.h>
-#include <sys/types.h>
-#include <sys/ipc.h>
-#include <sys/msg.h>
-#include "libmsgctl.h"
-
-int doreader(long key, int tid, long type, int child, int nreps)
-{
-	int i, size;
-	int id;
-	struct mbuffer buffer;
-
-	id = msgget(key, 0);
-	if (id < 0) {
-		printf("msgget() error in the reader of child group %d: %s\n",
-			child, strerror(errno));
-
-		return FAIL;
-	}
-	if (id != tid) {
-		printf("Message queue mismatch in the reader of child group %d for message queue id %d\n",
-			child, id);
-
-		return FAIL;
-	}
-	for (i = 0; i < nreps; i++) {
-		memset(&buffer, 0, sizeof(buffer));
-
-		size = msgrcv(id, &buffer, 100, type, 0);
-		if (size < 0) {
-			printf("msgrcv() error in child %d, read # = %d: %s\n",
-				child, (i + 1), strerror(errno));
-
-			return FAIL;
-		}
-		if (buffer.type != type) {
-			printf("Type mismatch in child %d, read #d = %d: ",
-				child, (i + 1));
-			printf("for message got %ld, expected - %ld\n",
-				buffer.type, type);
-
-			return FAIL;
-		}
-		if (buffer.data.len + 1 != size) {
-			printf("Size mismatch in child %d, read # = %d: ",
-				child, (i + 1));
-			printf("for message got %d, expected - %d\n",
-				buffer.data.len + 1, size);
-
-			return FAIL;
-		}
-		if (verify(buffer.data.pbytes, (key % 255), size - 1, child)) {
-			printf("Verify failed in child %d read # = %d, key = %lx\n",
-				child, (i + 1), key);
-
-			return FAIL;
-		}
-		key++;
-	}
-	return PASS;
-}
-
-int dowriter(long key, int tid, long type, int child, int nreps)
-{
-	int i, size;
-	int id;
-	struct mbuffer buffer;
-
-	id = msgget(key, 0);
-	if (id < 0) {
-		printf("msgget() error in the writer of child group %d: %s\n",
-			child, strerror(errno));
-
-		return FAIL;
-	}
-	if (id != tid) {
-		printf("Message queue mismatch in the reader of child group %d for message queue id %d\n",
-			child, id);
-
-		return FAIL;
-	}
-
-	for (i = 0; i < nreps; i++) {
-		memset(&buffer, 0, sizeof(buffer));
-
-		do {
-			size = (lrand48() % 99);
-		} while (size == 0);
-		fill_buffer(buffer.data.pbytes, (key % 255), size);
-		buffer.data.len = size;
-		buffer.type = type;
-		if (msgsnd(id, &buffer, size + 1, 0) < 0) {
-			printf("msgsnd() error in child %d, write # = %d, key = %lx: %s\n",
-				child, nreps, key, strerror(errno));
-
-			return FAIL;
-		}
-		key++;
-	}
-	return PASS;
-}
-
-int fill_buffer(char *buf, char val, int size)
-{
-	int i;
-
-	for (i = 0; i < size; i++)
-		buf[i] = val;
-	return 0;
-}
-
-/* Check a buffer for correct values */
-int verify(char *buf, char val, int size, int child)
-{
-	while (size-- > 0) {
-		if (*buf++ != val) {
-			printf("Verify error in child %d, *buf = %x, val = %x, size = %d\n",
-				child, *buf, val, size);
-
-			return FAIL;
-		}
-	}
-	return PASS;
-}
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
