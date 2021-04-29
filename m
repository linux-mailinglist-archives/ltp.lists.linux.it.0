Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8242C36EC4D
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Apr 2021 16:23:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E0F183C618C
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Apr 2021 16:23:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6DFD93C19C3
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 16:23:21 +0200 (CEST)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6E6212001B3
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 16:23:19 +0200 (CEST)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FWHjB0phdz16MBd
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 22:20:46 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Thu, 29 Apr 2021 22:23:09 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Thu, 29 Apr 2021 22:22:32 +0800
Message-ID: <20210429142232.29596-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] lib/tst_checkpoint.c: Replace SAFE_CLOSE with
 SAFE_UNLINK
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

When we call tst_checkpoint_init and set the cleanup_fn to NULL, the file
checkpoint_futex_base_file might be left over.

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 lib/tst_checkpoint.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/tst_checkpoint.c b/lib/tst_checkpoint.c
index 9e9dcf9e6..3360ab07b 100644
--- a/lib/tst_checkpoint.c
+++ b/lib/tst_checkpoint.c
@@ -78,7 +78,7 @@ void tst_checkpoint_init(const char *file, const int lineno,

 	tst_max_futexes = page_size / sizeof(uint32_t);

-	SAFE_CLOSE(cleanup_fn, fd);
+	SAFE_UNLINK(cleanup_fn, "checkpoint_futex_base_file");
 }

 int tst_checkpoint_wait(unsigned int id, unsigned int msec_timeout)
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
