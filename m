Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9499A2573C2
	for <lists+linux-ltp@lfdr.de>; Mon, 31 Aug 2020 08:36:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 15F713C2DC7
	for <lists+linux-ltp@lfdr.de>; Mon, 31 Aug 2020 08:36:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 2E2E93C2DB2
 for <ltp@lists.linux.it>; Mon, 31 Aug 2020 08:36:00 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id B879B1A002D5
 for <ltp@lists.linux.it>; Mon, 31 Aug 2020 08:35:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598855758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Hxqf+JZe8eIDMAuCOTPzJ6ARTvDEqO87IgZnajZZUF0=;
 b=R48p2bwCqkVmBibiILSlyS0yZn4+FRaqq+2ExP9EF/lBbIP9arSdprVSQrFwLQVrgKIA4t
 +xU8PWnN811kCeGPa/V7F+UHT384bmIOaLYV8lC9w3abBTSR3uWfIqfF72t6wqwTS0vuER
 n+74RLV783pyhYeA4qzjIiGZZXL2RmA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-AblXTXMOPJ6yeejMdK6quQ-1; Mon, 31 Aug 2020 02:35:56 -0400
X-MC-Unique: AblXTXMOPJ6yeejMdK6quQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F9D81084C8F
 for <ltp@lists.linux.it>; Mon, 31 Aug 2020 06:35:55 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A0BD05C230
 for <ltp@lists.linux.it>; Mon, 31 Aug 2020 06:35:53 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Mon, 31 Aug 2020 06:35:52 +0000
Message-Id: <20200831063552.11252-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwang@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [COMMITTED] utimensat01: fix kvers arrary boundary
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

To get rid of errors:
   8 utimensat01.c:295: INFO: Testing variant: syscall with old kernel spec
   9 tst_test.c:1300: BROK: Test killed by SIGSEGV!

and,
  BROK: utimensat01.c:293: mkdir(test_dir,0700) failed: EEXIST (17)

Signed-off-by: Li Wang <liwang@redhat.com>
---
 testcases/kernel/syscalls/utimensat/utimensat01.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/utimensat/utimensat01.c b/testcases/kernel/syscalls/utimensat/utimensat01.c
index 5cc5f1d33..e2d4fee3e 100644
--- a/testcases/kernel/syscalls/utimensat/utimensat01.c
+++ b/testcases/kernel/syscalls/utimensat/utimensat01.c
@@ -161,6 +161,7 @@ static void update_error(struct test_case *tc)
 	static struct tst_kern_exv kvers[] = {
 		/* Ubuntu kernel has patch b3b4283 since 4.4.0-48.69 */
 		{ "UBUNTU", "4.4.0-48.69" },
+		{ NULL, NULL},
 	};
 
 	if (tc->exp_err != -1)
@@ -295,7 +296,8 @@ static void setup(void)
 	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
 
 	bad_addr = tst_get_bad_addr(NULL);
-	SAFE_MKDIR(TEST_DIR, 0700);
+	if (access(TEST_DIR, R_OK))
+		SAFE_MKDIR(TEST_DIR, 0700);
 
 	for (i = 0; i < ARRAY_SIZE(tcase); i++)
 		update_error(&tcase[i]);
-- 
2.21.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
