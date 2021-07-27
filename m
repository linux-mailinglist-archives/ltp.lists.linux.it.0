Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2453D753F
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jul 2021 14:44:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C01793C8152
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jul 2021 14:44:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 799BC3C67AB
 for <ltp@lists.linux.it>; Tue, 27 Jul 2021 14:44:29 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id CE1F91000DD3
 for <ltp@lists.linux.it>; Tue, 27 Jul 2021 14:44:28 +0200 (CEST)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GYxD537FLzYh0w;
 Tue, 27 Jul 2021 20:38:29 +0800 (CST)
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
Date: Tue, 27 Jul 2021 20:45:05 +0800
Message-ID: <20210727124507.28356-2-xieziyao@huawei.com>
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
Subject: [LTP] [PATCH 1/3] tst_process_state: Add tst_process_state_wait2 to
 newlib
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

Add tst_process_state_wait2 to newlib for epoll_pwait01.

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 include/tst_process_state.h | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/include/tst_process_state.h b/include/tst_process_state.h
index 81532524a..4641557bd 100644
--- a/include/tst_process_state.h
+++ b/include/tst_process_state.h
@@ -37,14 +37,6 @@
 	tst_process_exit_wait((pid), (msec_timeout))

 #else
-/*
- * The same as above but does not use tst_brkm() interface.
- *
- * This function is intended to be used from child processes.
- *
- * Returns zero on success, non-zero on failure.
- */
-int tst_process_state_wait2(pid_t pid, const char state);

 #define TST_PROCESS_STATE_WAIT(cleanup_fn, pid, state) \
 	tst_process_state_wait(__FILE__, __LINE__, (cleanup_fn), \
@@ -54,6 +46,16 @@ int tst_process_state_wait2(pid_t pid, const char state);
 int tst_process_state_wait(const char *file, const int lineno,
 			   void (*cleanup_fn)(void), pid_t pid,
 			   const char state, unsigned int msec_timeout);
+
+/*
+ * The same as above but does not use tst_brkm() interface.
+ *
+ * This function is intended to be used from child processes.
+ *
+ * Returns zero on success, non-zero on failure.
+ */
+int tst_process_state_wait2(pid_t pid, const char state);
+
 int tst_process_exit_wait(pid_t pid, unsigned int msec_timeout);

 #endif /* TST_PROCESS_STATE__ */
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
