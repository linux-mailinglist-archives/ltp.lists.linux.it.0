Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DA51A1DDC
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Apr 2020 11:06:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B36C13C2D29
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Apr 2020 11:06:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 59ABD3C061B
 for <ltp@lists.linux.it>; Wed,  8 Apr 2020 11:06:39 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E25A8601175
 for <ltp@lists.linux.it>; Wed,  8 Apr 2020 11:06:38 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A2E1DAEE6;
 Wed,  8 Apr 2020 09:06:37 +0000 (UTC)
From: Richard Palethorpe <rpalethorpe@suse.com>
To: ltp@lists.linux.it
Date: Wed,  8 Apr 2020 11:06:35 +0200
Message-Id: <20200408090635.4686-2-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200408090635.4686-1-rpalethorpe@suse.com>
References: <20200408090635.4686-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] add_key05: Correct formatting
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Use checkpatch.pl

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 testcases/kernel/syscalls/add_key/add_key05.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/add_key/add_key05.c b/testcases/kernel/syscalls/add_key/add_key05.c
index 5691b8579..d83339048 100644
--- a/testcases/kernel/syscalls/add_key/add_key05.c
+++ b/testcases/kernel/syscalls/add_key/add_key05.c
@@ -118,8 +118,8 @@ static void verify_max_btyes(void)
 	plen = max_bytes - used_bytes - delta - strlen("test_xxx") - 1;
 	TEST(add_key("user", "test_max", buf, plen, KEY_SPEC_THREAD_KEYRING));
 	if (TST_RET == -1) {
-		 tst_res(TFAIL | TTERRNO, "add_key(test_max) failed unexpectedly");
-		 return;
+		tst_res(TFAIL | TTERRNO, "add_key(test_max) failed unexpectedly");
+		return;
 	}
 
 	tst_res(TPASS, "add_key(test_max) succeeded as expected");
-- 
2.24.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
