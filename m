Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D31D4E372D
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Mar 2022 04:03:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2424D3C8145
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Mar 2022 04:03:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5D3363C7ACE
 for <ltp@lists.linux.it>; Tue, 22 Mar 2022 04:03:33 +0100 (CET)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id CC1742003A2
 for <ltp@lists.linux.it>; Tue, 22 Mar 2022 04:03:31 +0100 (CET)
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KMx8x4MQmzfZ5L
 for <ltp@lists.linux.it>; Tue, 22 Mar 2022 11:01:53 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 canpemm500005.china.huawei.com (7.192.104.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 22 Mar 2022 11:03:25 +0800
To: <ltp@lists.linux.it>
Date: Tue, 22 Mar 2022 11:02:45 +0800
Message-ID: <20220322030245.209032-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 canpemm500005.china.huawei.com (7.192.104.229)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] memfd_create04: Add SAFE_CLOSE before test return
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
From: Zhao Gongyi via ltp <ltp@lists.linux.it>
Reply-To: Zhao Gongyi <zhaogongyi@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

If we run the test with the option -i 511, and the ulimit of
open files little than 1024, the test would fail and report:
memfd_create04.c:75: TFAIL: memfd_create() failed unexpectedly: EMFILE (24)

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 testcases/kernel/syscalls/memfd_create/memfd_create04.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/testcases/kernel/syscalls/memfd_create/memfd_create04.c b/testcases/kernel/syscalls/memfd_create/memfd_create04.c
index dc6e195f0..7b699b218 100644
--- a/testcases/kernel/syscalls/memfd_create/memfd_create04.c
+++ b/testcases/kernel/syscalls/memfd_create/memfd_create04.c
@@ -79,6 +79,8 @@ static void memfd_huge_x_controller(unsigned int n)
 	tst_res(TPASS,
 		"memfd_create succeeded for %s page size",
 		tflag.h_size);
+
+	SAFE_CLOSE(fd);
 }

 static void setup(void)
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
