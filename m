Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B02294D1F
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Oct 2020 14:58:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 268B83C56AE
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Oct 2020 14:58:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id B7ABA3C322D
 for <ltp@lists.linux.it>; Wed, 21 Oct 2020 14:58:34 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 06378200B73
 for <ltp@lists.linux.it>; Wed, 21 Oct 2020 14:58:32 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.77,401,1596470400"; d="scan'208";a="100375817"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 21 Oct 2020 20:58:31 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id DD4F448990D3;
 Wed, 21 Oct 2020 20:58:29 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 21 Oct 2020 20:58:25 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>
Date: Wed, 21 Oct 2020 20:57:53 +0800
Message-ID: <1603285074-28392-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1603285074-28392-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <20200722154558.GB2714@yuki.lan>
 <1603285074-28392-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: DD4F448990D3.AD16C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v3 3/4] libmsgctl: Remove it
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This lib code was only used by msgstress case and we have created a msgstress_common.c code
in msgstress directory, so it was useless and remove it.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 include/libmsgctl.h        |  39 ----------
 libs/libltpipc/libmsgctl.c | 147 -------------------------------------
 2 files changed, 186 deletions(-)
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
