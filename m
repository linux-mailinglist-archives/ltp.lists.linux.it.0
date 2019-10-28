Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B8678E6F15
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Oct 2019 10:30:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 109593C2273
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Oct 2019 10:30:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 8CE863C063A
 for <ltp@lists.linux.it>; Mon, 28 Oct 2019 10:30:26 +0100 (CET)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 527146009EA
 for <ltp@lists.linux.it>; Mon, 28 Oct 2019 10:30:26 +0100 (CET)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id CD071F1F54F664214FCC
 for <ltp@lists.linux.it>; Mon, 28 Oct 2019 17:30:21 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.439.0; Mon, 28 Oct 2019 17:30:14 +0800
From: Song Jian <songjian15@huawei.com>
To: <ltp@lists.linux.it>
Date: Mon, 28 Oct 2019 17:31:32 +0800
Message-ID: <1572255092-105929-1-git-send-email-songjian15@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH]kernel/mem/mtest01:Fix mtest01's options
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

Signed-off-by: Song Jian <songjian15@huawei.com>
---
 testcases/kernel/mem/mtest01/mtest01.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/mem/mtest01/mtest01.c b/testcases/kernel/mem/mtest01/mtest01.c
index eaf1026..960a2ce 100644
--- a/testcases/kernel/mem/mtest01/mtest01.c
+++ b/testcases/kernel/mem/mtest01/mtest01.c
@@ -58,7 +58,7 @@ static char *opt_chunksize, *opt_maxbytes, *opt_maxpercent;
 static struct tst_option mtest_options[] = {
 	{"c:", &opt_chunksize,	"-c  size of chunk in bytes to malloc on each pass"},
 	{"b:", &opt_maxbytes,	"-b  maximum number of bytes to allocate before stopping"},
-	{"p:", &opt_maxpercent, "-u  percent of total memory used at which the program stops"},
+	{"p:", &opt_maxpercent, "-p  percent of total memory used at which the program stops"},
 	{"w",  &dowrite,   	"-w  write to the memory after allocating"},
 	{"v",  &verbose,     	"-v  verbose"},
 	{NULL, NULL, 		NULL}
--
2.6.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
