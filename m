Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 769D996622F
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Aug 2024 15:01:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1725022900; h=to : date :
 message-id : mime-version : subject : list-id : list-unsubscribe :
 list-archive : list-post : list-help : list-subscribe : from :
 reply-to : cc : content-type : content-transfer-encoding : sender :
 from; bh=jyljwTGZUMR7W7nClC0dTpnxyc9kPNAcTQmJ58tH1DQ=;
 b=BibdxAXTVPr5ZIuxga4Cz5w3Rc3KtmNwU7B1SWSV5pQsGzMaII6ESKjlFD0gk4Bl7yQai
 ndp352xu5xPpJKBiuQkLqKlHeiM07rG2ekl9tjYMAyJJpvr5JJwILDl/c+7Kt3HdM2LmkYI
 RKd0qDfh5AC1quojvpUKtnEN1WqgN3w=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3388E3D285B
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Aug 2024 15:01:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 666113D283D
 for <ltp@lists.linux.it>; Fri, 30 Aug 2024 15:01:25 +0200 (CEST)
Authentication-Results: in-2.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com;
 envelope-from=wozizhi@huawei.com; receiver=lists.linux.it)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 102A4600BB5
 for <ltp@lists.linux.it>; Fri, 30 Aug 2024 15:01:23 +0200 (CEST)
Received: from mail.maildlp.com (unknown [172.19.88.105])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WwJDF4YxGzyR7f
 for <ltp@lists.linux.it>; Fri, 30 Aug 2024 21:00:45 +0800 (CST)
Received: from kwepemf100017.china.huawei.com (unknown [7.202.181.16])
 by mail.maildlp.com (Postfix) with ESMTPS id 4871714037D
 for <ltp@lists.linux.it>; Fri, 30 Aug 2024 21:01:18 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemf100017.china.huawei.com
 (7.202.181.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 30 Aug
 2024 21:01:17 +0800
To: <ltp@lists.linux.it>, <jack@suse.cz>, <amir73il@gmail.com>
Date: Fri, 30 Aug 2024 21:00:03 +0800
Message-ID: <20240830130003.3245531-1-wozizhi@huawei.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemf100017.china.huawei.com (7.202.181.16)
X-Spam-Status: No, score=-0.0 required=7.0 tests=DMARC_PASS,SPF_HELO_NONE,
 SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled
 version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] fanotify10: Calling drop_cache twice to ensure the
 inode is evicted
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
From: Zizhi Wo via ltp <ltp@lists.linux.it>
Reply-To: Zizhi Wo <wozizhi@huawei.com>
Cc: yangerkun@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

In this test case, some scenarios are designed to verify whether the
FANOTIFY_EVICTABLE flag takes effect: by verifying that information cannot
be obtained from the corresponding inode after drop_cache, as this flag
does not ping the inode.

However, drop_cache is only performed once here, which may result in the
inode not being released in NUMA scenarios. Suppose the inode is located
on NUMA0 and the dentry is located on NUMA1; the first drop_cache can only
ensure that the inode is added to the LRU list, but does not guarantee that
evict() can been called because dispose_list does not yet include this
inode when traversing NUMA0, which causes the testcase execution fail.

For the single-file scenario in this testcase, executing drop_cache twice
is necessary to ensure the inode is evicted, thus allowing the testcase to
pass.

Signed-off-by: Zizhi Wo <wozizhi@huawei.com>
---
 testcases/kernel/syscalls/fanotify/fanotify10.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify10.c b/testcases/kernel/syscalls/fanotify/fanotify10.c
index c6d8ec922..42018de0d 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify10.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify10.c
@@ -515,6 +515,8 @@ static void drop_caches(void)
 	if (syncfs(fd_syncfs) < 0)
 		tst_brk(TBROK | TERRNO, "Unexpected error when syncing filesystem");
 
+	/* Need to drop twice to ensure the inode is evicted. */
+	SAFE_FILE_PRINTF(DROP_CACHES_FILE, "3");
 	SAFE_FILE_PRINTF(DROP_CACHES_FILE, "3");
 }
 
-- 
2.39.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
