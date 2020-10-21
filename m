Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BA8294D20
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Oct 2020 14:58:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DD3F13C56A6
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Oct 2020 14:58:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id D97D23C56B8
 for <ltp@lists.linux.it>; Wed, 21 Oct 2020 14:58:38 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 228D1200B77
 for <ltp@lists.linux.it>; Wed, 21 Oct 2020 14:58:37 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.77,401,1596470400"; d="scan'208";a="100375826"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 21 Oct 2020 20:58:37 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 61F314CE1504;
 Wed, 21 Oct 2020 20:58:36 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 21 Oct 2020 20:58:32 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>
Date: Wed, 21 Oct 2020 20:57:54 +0800
Message-ID: <1603285074-28392-4-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1603285074-28392-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <20200722154558.GB2714@yuki.lan>
 <1603285074-28392-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 61F314CE1504.AA0B9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v3 4/4] lipipc: Remove useless get_max_msgqueues api
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

Only old msgstress cases use this api and we have used
SAFE_FILE_SCANF("/proc/sys/kernel/msgmni", "%d", &nr_msgqs) to get the max msgqueues.
So remove this uesless api.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 include/ipcmsg.h        |  1 -
 libs/libltpipc/libipc.c | 23 -----------------------
 2 files changed, 24 deletions(-)

diff --git a/include/ipcmsg.h b/include/ipcmsg.h
index d89894b72..21eb81b6b 100644
--- a/include/ipcmsg.h
+++ b/include/ipcmsg.h
@@ -62,7 +62,6 @@ void rm_queue(int);
 key_t getipckey();
 int getuserid(char *);
 
-int get_max_msgqueues(void);
 int get_used_msgqueues(void);
 
 #endif /* ipcmsg.h */
diff --git a/libs/libltpipc/libipc.c b/libs/libltpipc/libipc.c
index d94880f54..9c2da11b0 100644
--- a/libs/libltpipc/libipc.c
+++ b/libs/libltpipc/libipc.c
@@ -195,26 +195,3 @@ int get_used_msgqueues(void)
 	}
 	return used_queues;
 }
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
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
