Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A2243AD85
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Oct 2021 09:48:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 840253C673A
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Oct 2021 09:48:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 14C863C6639
 for <ltp@lists.linux.it>; Tue, 26 Oct 2021 09:48:51 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 1716B60007A
 for <ltp@lists.linux.it>; Tue, 26 Oct 2021 09:48:49 +0200 (CEST)
Received: from dggeml753-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HdkNQ3PR2zbnCR
 for <ltp@lists.linux.it>; Tue, 26 Oct 2021 15:44:06 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 dggeml753-chm.china.huawei.com (10.1.199.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.15; Tue, 26 Oct 2021 15:48:43 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Tue, 26 Oct 2021 15:50:25 +0800
Message-ID: <20211026075025.29117-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggeml753-chm.china.huawei.com (10.1.199.152)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] lapi/syscalls: Add epoll_create for aarch64.in
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

Add epoll_create for aarch64.in and modify the value of epoll_ctl
for aarch64.in. Otherwise, the testcase epoll_create01/epoll_create02 will
fail.

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 include/lapi/syscalls/aarch64.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/lapi/syscalls/aarch64.in b/include/lapi/syscalls/aarch64.in
index a47185954..e9023a1d0 100644
--- a/include/lapi/syscalls/aarch64.in
+++ b/include/lapi/syscalls/aarch64.in
@@ -19,7 +19,6 @@ getcwd 17
 lookup_dcookie 18
 eventfd2 19
 epoll_create1 20
-epoll_ctl 21
 epoll_pwait 22
 dup 23
 dup3 24
@@ -243,6 +242,8 @@ rt_tgsigqueueinfo 240
 perf_event_open 241
 accept4 242
 recvmmsg 243
+epoll_create 250
+epoll_ctl 251
 wait4 260
 prlimit64 261
 fanotify_init 262
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
