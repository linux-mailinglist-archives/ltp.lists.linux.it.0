Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3851F410F55
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Sep 2021 07:35:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E3C703C8631
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Sep 2021 07:35:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C02AC3C1B0A
 for <ltp@lists.linux.it>; Mon, 20 Sep 2021 07:35:15 +0200 (CEST)
Received: from m12-16.163.com (m12-16.163.com [220.181.12.16])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 2ECE860063A
 for <ltp@lists.linux.it>; Mon, 20 Sep 2021 07:35:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=ITqvh
 jtPz30+6/0ecPfUy+QWtO3j+dpAN4OR5cgZVuQ=; b=QDcH5EQvw1yAKGSCvjn19
 5WQZ+FMcghWb99QHd2AQe9WhFRJneFE7O6B54sUGwM7MCK/kz2DyVHofhPDseGTo
 kKHF6iWY0d+WNmdIfmwSIxmux0aCKrRYM8k73joVEFjpjJfbdhLc6JZa139wE6en
 dmcUW1eBiW2dkOjZqdzsf4=
Received: from localhost.localdomain (unknown [183.210.46.254])
 by smtp12 (Coremail) with SMTP id EMCowACXr5+BHUhhrkxMBg--.1058S2;
 Mon, 20 Sep 2021 13:34:59 +0800 (CST)
From: ice_yangxiao@163.com
To: ltp@lists.linux.it
Date: Mon, 20 Sep 2021 13:34:53 +0800
Message-Id: <20210920053453.139195-1-ice_yangxiao@163.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CM-TRANSID: EMCowACXr5+BHUhhrkxMBg--.1058S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jr13JF48CF1UWryfKw1fXrb_yoWDJFX_Aa
 4UXF1UG3yUJw4UJr13Gr4rXr45tr1UGFs5JrnxGrWrJrsFvr1UGF9Yvrs8XFn5WrWrWF93
 Grs0qrs0qrsxAjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8GiiDUUUUU==
X-Originating-IP: [183.210.46.254]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/xtbBIw0UXl3l-eVaOQABsm
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [COMMITTED] [PATCH] syscalls/dup203.c: Fix a compiler error
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
Cc: qi.fuli@fujitsu.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Xiao Yang <yangx.jy@fujitsu.com>

Building dup203 threw the following error:
-----------------------------------------
dup203.c:40:2: error: format string is not a string literal
-----------------------------------------

Fixes: 711f40c09bdb ("syscalls/dup2/dup203: Convert to new API")
Signed-off-by: Xiao Yang <yangx.jy@fujitsu.com>
---
 testcases/kernel/syscalls/dup2/dup203.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/dup2/dup203.c b/testcases/kernel/syscalls/dup2/dup203.c
index e2282ed2b..c76f125a1 100644
--- a/testcases/kernel/syscalls/dup2/dup203.c
+++ b/testcases/kernel/syscalls/dup2/dup203.c
@@ -37,7 +37,7 @@ static void run(unsigned int i)
 
 	struct tcase *tc = tcases + i;
 
-	tst_res(TINFO, tc->desc);
+	tst_res(TINFO, "%s", tc->desc);
 
 	fd0 = SAFE_CREAT(filename0, 0666);
 	SAFE_WRITE(1, fd0, filename0, strlen(filename0));
-- 
2.26.2



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
