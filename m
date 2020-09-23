Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 66298275A3E
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Sep 2020 16:36:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E321F3C4D5C
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Sep 2020 16:36:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 5B1323C29D5
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 16:36:02 +0200 (CEST)
Received: from mail-m973.mail.163.com (mail-m973.mail.163.com [123.126.97.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 46143600A07
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 16:35:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=joXg1
 ckgMqherHWGE+Ez8kiMPAExLFEZXZrbufTbb1w=; b=Uc22K/dl4aC8PPD7NfHRy
 Jd5EZfoEk8hjPQgORxSLMVVaGJIj37fd0G9T+xwLhgQlOCTzO79vxPQrQRQzuFjB
 PLG9gR7du9ek0ZODOy38T3wRi0c36V93v11GT5tsglWxbm1iTH41ANYGcxZN8cqp
 zYgsPhC3frPy9+aA11kA74=
Received: from localhost.localdomain (unknown [122.96.46.107])
 by smtp3 (Coremail) with SMTP id G9xpCgDnm0U5XWtf9QZODw--.10984S2;
 Wed, 23 Sep 2020 22:35:38 +0800 (CST)
From: Xiao Yang <ice_yangxiao@163.com>
To: ltp@lists.linux.it
Date: Wed, 23 Sep 2020 22:35:35 +0800
Message-Id: <20200923143535.6124-1-ice_yangxiao@163.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CM-TRANSID: G9xpCgDnm0U5XWtf9QZODw--.10984S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrAF1kJr1UtrW3XF13uFWruFg_yoWxArb_KF
 1UWFy8KFW5tFWvq3WrCrs5WF4jyry3Jr48GrsxCrZ5Gw43Zw1DC3ZYvryjyFn5W3W09F93
 Cw45Gws09ryFyjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbwZ2PUUUUU==
X-Originating-IP: [122.96.46.107]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/xtbB0hqoXlUMY3lsSgAAsb
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/recvmmsg: Add missing .gitignore
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

From: Xiao Yang <yangx.jy@cn.fujitsu.com>

Fixes: 135af8ededd4 ("syscalls/{send|recv}mmsg: add a test case for timeout and errno test")
Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
---
 testcases/kernel/syscalls/recvmmsg/.gitignore | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 testcases/kernel/syscalls/recvmmsg/.gitignore

diff --git a/testcases/kernel/syscalls/recvmmsg/.gitignore b/testcases/kernel/syscalls/recvmmsg/.gitignore
new file mode 100644
index 000000000..974ae1ef9
--- /dev/null
+++ b/testcases/kernel/syscalls/recvmmsg/.gitignore
@@ -0,0 +1 @@
+recvmmsg01
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
