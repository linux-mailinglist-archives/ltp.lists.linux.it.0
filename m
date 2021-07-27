Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F13D83D753E
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jul 2021 14:44:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3C1713C915E
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jul 2021 14:44:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 49EF03C6E10
 for <ltp@lists.linux.it>; Tue, 27 Jul 2021 14:44:29 +0200 (CEST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D14481000DD5
 for <ltp@lists.linux.it>; Tue, 27 Jul 2021 14:44:28 +0200 (CEST)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GYxGb6Wp3z80CB;
 Tue, 27 Jul 2021 20:40:39 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 27 Jul 2021 20:44:24 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 27 Jul 2021 20:44:24 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Tue, 27 Jul 2021 20:45:06 +0800
Message-ID: <20210727124507.28356-3-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210727124507.28356-1-xieziyao@huawei.com>
References: <20210727124507.28356-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] lapi: Add epoll_pwait_supported() and
 epoll_pwait2_supported() check
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

Add the function of checking whether epoll_pwait or epoll_pwait2 is supported.

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 include/lapi/epoll.h | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/include/lapi/epoll.h b/include/lapi/epoll.h
index e5b4387f1..fc068ae20 100644
--- a/include/lapi/epoll.h
+++ b/include/lapi/epoll.h
@@ -14,18 +14,32 @@
 #define EPOLL_CLOEXEC 02000000
 #endif

+static inline void epoll_pwait_supported(void)
+{
+	/* allow the tests to fail early */
+	tst_syscall(__NR_epoll_pwait);
+}
+
 #ifndef HAVE_EPOLL_PWAIT
-int epoll_pwait(int epfd, struct epoll_event *events, int maxevents,
-		int timeout, const sigset_t *sigmask)
+static inline int epoll_pwait(int epfd, struct epoll_event *events,
+			      int maxevents, int timeout,
+			      const sigset_t *sigmask)
 {
 	return tst_syscall(__NR_epoll_pwait, epfd, events, maxevents,
 			   timeout, sigmask, _NSIG / 8);
 }
 #endif

+static inline void epoll_pwait2_supported(void)
+{
+	/* allow the tests to fail early */
+	tst_syscall(__NR_epoll_pwait2);
+}
+
 #ifndef HAVE_EPOLL_PWAIT2
-int epoll_pwait2(int epfd, struct epoll_event *events, int maxevents,
-		 const struct timespec *timeout, const sigset_t *sigmask)
+static inline int epoll_pwait2(int epfd, struct epoll_event *events,
+			       int maxevents, const struct timespec *timeout,
+			       const sigset_t *sigmask)
 {
 	if (timeout == NULL)
 		return tst_syscall(__NR_epoll_pwait2, epfd, events, maxevents,
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
