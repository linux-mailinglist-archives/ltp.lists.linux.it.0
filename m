Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 815C9E48D2
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Oct 2019 12:48:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 25B6B3C22B9
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Oct 2019 12:48:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 64DD53C224B
 for <ltp@lists.linux.it>; Fri, 25 Oct 2019 12:48:38 +0200 (CEST)
Received: from mail-m971.mail.163.com (mail-m971.mail.163.com [123.126.97.1])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id DD55514016B6
 for <ltp@lists.linux.it>; Fri, 25 Oct 2019 12:48:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=V3cw8
 SHixNA9Pwq165mhawQulkB1mbaVKQ8lceG47c4=; b=GEMvqnLg+VYUKNhxycP9P
 k7gFezQSlQLTx7IKEpnRizgxjbFx+JvPKrIk4fW1LNcfFrwMWNLP3nDj8OmvCRQ9
 13RydV/6XqO3LixTDAev/qri36Jeq+BbPnVQpbscjwI1UJCig0j5Y8Xs5q5rPxDc
 yu2VxadgJQdh2ytZ7ocFc8=
Received: from Fedora-30-workstation.localdomain (unknown [122.194.3.30])
 by smtp1 (Coremail) with SMTP id GdxpCgCHjCz+0rJdOHtnKA--.402S2;
 Fri, 25 Oct 2019 18:48:31 +0800 (CST)
From: Xiao Yang <ice_yangxiao@163.com>
To: ltp@lists.linux.it
Date: Fri, 25 Oct 2019 18:48:29 +0800
Message-Id: <20191025104829.8988-1-ice_yangxiao@163.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CM-TRANSID: GdxpCgCHjCz+0rJdOHtnKA--.402S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrurykur4DAFW7JF48WFy3Arb_yoW3Krg_Ka
 15tr1vgw4jyFZrZF15Aw4qgF45K34UGFs5Ar93GFW5Ar47Xw1DGr9Yvry5XrZ8ur90vr9x
 Cr45WrWqq34UAjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUU-6pJUUUUU==
X-Originating-IP: [122.194.3.30]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/1tbiMwZZXlXlz4d7LgAAsf
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [COMMITTED] [PATCH] syscalls/prctl02.c: Fix wrong type of
 test result
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

Reported-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Signed-off-by: Xiao Yang <ice_yangxiao@163.com>
---
 testcases/kernel/syscalls/prctl/prctl02.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/prctl/prctl02.c b/testcases/kernel/syscalls/prctl/prctl02.c
index a6a852011..ec45911fd 100644
--- a/testcases/kernel/syscalls/prctl/prctl02.c
+++ b/testcases/kernel/syscalls/prctl/prctl02.c
@@ -38,7 +38,7 @@ static void verify_prctl(unsigned int n)
 	if (tc->exp_errno == TST_ERR) {
 		tst_res(TPASS | TTERRNO, "prctl() failed as expected");
 	} else {
-		tst_res(TPASS | TTERRNO, "prctl() failed unexpectedly, expected %s",
+		tst_res(TFAIL | TTERRNO, "prctl() failed unexpectedly, expected %s",
 				tst_strerrno(tc->exp_errno));
 	}
 }
-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
