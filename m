Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E23783A20
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Aug 2023 08:45:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3D5853CC769
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Aug 2023 08:45:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6A3513CBAB0
 for <ltp@lists.linux.it>; Tue, 22 Aug 2023 08:45:48 +0200 (CEST)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B7DA7140013A
 for <ltp@lists.linux.it>; Tue, 22 Aug 2023 08:45:46 +0200 (CEST)
Received: from kwepemm600014.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RVKXY1j3FzLp7J
 for <ltp@lists.linux.it>; Tue, 22 Aug 2023 14:42:37 +0800 (CST)
Received: from huawei.com (10.175.100.195) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 22 Aug
 2023 14:45:40 +0800
To: <ltp@lists.linux.it>
Date: Fri, 25 Aug 2023 00:00:08 +0800
Message-ID: <20230824160008.2878325-1-limin154@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Originating-IP: [10.175.100.195]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 1.0.1 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.8 required=7.0 tests=DATE_IN_FUTURE_48_96,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH]network/netstress: bugfix for netstress/netstress.c
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
From: Li Min via ltp <ltp@lists.linux.it>
Reply-To: Li Min <limin154@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

eshutdown_cnt needs to be initialized.

Signed-off-by: Min Li <limin154@huawei.com>
---
 testcases/network/netstress/netstress.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/network/netstress/netstress.c b/testcases/network/netstress/netstress.c
index 6a888f2ee..fb6281cd0 100644
--- a/testcases/network/netstress/netstress.c
+++ b/testcases/network/netstress/netstress.c
@@ -384,6 +384,7 @@ void *client_fn(void *id)

 	inf.raddr_len = sizeof(inf.raddr);
 	inf.etime_cnt = 0;
+	inf.eshutdown_cnt = 0;
 	inf.timeout = wait_timeout;
 	inf.pmtu_err_cnt = 0;

--
2.33.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
