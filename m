Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 245D73681F6
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Apr 2021 15:54:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 71BBA3C6AE0
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Apr 2021 15:54:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3488C3C6AD8
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 15:54:34 +0200 (CEST)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C3D7610018AD
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 15:54:31 +0200 (CEST)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FQzPq5SFgzlXPl
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 21:52:31 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Thu, 22 Apr 2021 21:54:22 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Thu, 22 Apr 2021 21:54:05 +0800
Message-ID: <20210422135405.14269-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/bind01: Close/recreate inet_socket after
 calling bind() successed
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

When the test running with -i option to run more than one time,
it will fail because of calling bind successed more than one time,
as follows:

#bind01 -i 2
tst_test.c:1313: TINFO: Timeout per run is 0h 05m 00s
bind01.c:52: TPASS: invalid salen: EINVAL (22)
bind01.c:52: TPASS: invalid socket: ENOTSOCK (88)
bind01.c:55: TPASS: INADDR_ANYPORT passed
bind01.c:52: TPASS: UNIX-domain of current directory: EAFNOSUPPORT (97)
bind01.c:52: TPASS: non-local address: EADDRNOTAVAIL (99)
bind01.c:52: TPASS: invalid salen: EINVAL (22)
bind01.c:52: TPASS: invalid socket: ENOTSOCK (88)
bind01.c:55: TFAIL: INADDR_ANYPORT failed: EINVAL (22)
bind01.c:52: TPASS: UNIX-domain of current directory: EAFNOSUPPORT (97)
bind01.c:52: TPASS: non-local address: EADDRNOTAVAIL (99)

Summary:
passed   9
failed   1
broken   0
skipped  0
warnings 0

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 testcases/kernel/syscalls/bind/bind01.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/testcases/kernel/syscalls/bind/bind01.c b/testcases/kernel/syscalls/bind/bind01.c
index 758d12863..c008819a8 100644
--- a/testcases/kernel/syscalls/bind/bind01.c
+++ b/testcases/kernel/syscalls/bind/bind01.c
@@ -53,6 +53,8 @@ void verify_bind(unsigned int nr)
 	} else {
 		TST_EXP_PASS(bind(*tcase->socket_fd, tcase->sockaddr, tcase->salen),
 		             "%s", tcase->desc);
+		SAFE_CLOSE(inet_socket);
+		inet_socket = SAFE_SOCKET(PF_INET, SOCK_STREAM, 0);
 	}
 }

--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
