Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 836F77160E
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Jul 2019 12:28:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3CC0B3C13D8
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Jul 2019 12:28:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id DAF0A3C13D8
 for <ltp@lists.linux.it>; Tue, 23 Jul 2019 12:28:33 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 9EC7D1000DE2
 for <ltp@lists.linux.it>; Tue, 23 Jul 2019 12:28:27 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8E32F307D985;
 Tue, 23 Jul 2019 10:28:31 +0000 (UTC)
Received: from dhcp-3-207.nay.redhat.com (dhcp-3-207.nay.redhat.com
 [10.66.3.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F14119C58;
 Tue, 23 Jul 2019 10:28:30 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Tue, 23 Jul 2019 18:28:26 +0800
Message-Id: <20190723102826.9679-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Tue, 23 Jul 2019 10:28:31 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] setdomainname: use strlen() to get length of string
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

The sizeof(new) is only to get the size of char *, and it's not corret to pass
it as 'len' in setdomainname(). Here replace by strlen() to get the correct number
of characters for string.

On x86_64, we get this failures if the LTP compilied in 32bit.

  -----Error Log-----
  setdomainname.h:24: INFO: Testing libc setdomainname()
  setdomainname01.c:24: FAIL: getdomainname() returned wrong domainname: 'test'
  setdomainname.h:27: INFO: Testing __NR_setdomainname syscall
  setdomainname01.c:24: FAIL: getdomainname() returned wrong domainname: 'test'
  -------------------

Signed-off-by: Li Wang <liwang@redhat.com>
Cc: Petr Vorel <pvorel@suse.cz>
---
 testcases/kernel/syscalls/setdomainname/setdomainname01.c | 2 +-
 testcases/kernel/syscalls/setdomainname/setdomainname03.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/setdomainname/setdomainname01.c b/testcases/kernel/syscalls/setdomainname/setdomainname01.c
index 57d58ab42..1731af733 100644
--- a/testcases/kernel/syscalls/setdomainname/setdomainname01.c
+++ b/testcases/kernel/syscalls/setdomainname/setdomainname01.c
@@ -12,7 +12,7 @@ static void do_test(void)
 	char *new = TST_VALID_DOMAIN_NAME;
 	static char tmp[_UTSNAME_DOMAIN_LENGTH];
 
-	TEST(do_setdomainname(new, sizeof(new)));
+	TEST(do_setdomainname(new, strlen(new)));
 
 	if (TST_RET != 0)
 		tst_brk(TFAIL | TTERRNO, "setdomainname() failed: %d", TST_ERR);
diff --git a/testcases/kernel/syscalls/setdomainname/setdomainname03.c b/testcases/kernel/syscalls/setdomainname/setdomainname03.c
index e53ea8806..b8d17d8da 100644
--- a/testcases/kernel/syscalls/setdomainname/setdomainname03.c
+++ b/testcases/kernel/syscalls/setdomainname/setdomainname03.c
@@ -16,7 +16,7 @@ static void do_test(void)
 {
 	char *new = TST_VALID_DOMAIN_NAME;
 
-	TEST(do_setdomainname(new, sizeof(new)));
+	TEST(do_setdomainname(new, strlen(new)));
 
 	if (TST_RET != -1) {
 		tst_res(TFAIL, "unexpected exit code: %ld", TST_RET);
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
