Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DD9D20D8
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Oct 2019 08:38:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 48FDA3C1CFD
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Oct 2019 08:38:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 9065F3C0B92
 for <ltp@lists.linux.it>; Thu, 10 Oct 2019 08:37:59 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8E6876011AB
 for <ltp@lists.linux.it>; Thu, 10 Oct 2019 08:36:32 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CA83A18C4283
 for <ltp@lists.linux.it>; Thu, 10 Oct 2019 06:37:55 +0000 (UTC)
Received: from dhcp-0-148.nay.redhat.com (dhcp-0-148.nay.redhat.com
 [10.66.0.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C352919D70;
 Thu, 10 Oct 2019 06:37:54 +0000 (UTC)
From: Ping Fang <pifang@redhat.com>
To: ltp@lists.linux.it
Date: Thu, 10 Oct 2019 14:37:50 +0800
Message-Id: <20191010063750.9605-1-pifang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Thu, 10 Oct 2019 06:37:55 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] acct: fix version check on big endian system
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
Cc: liwan@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

ac_version = ACCT_VERION | ACCT_BYTEORDER
which is 0x83 (131) on big endian system.

failure output:
tst_kconfig.c:62: INFO: Parsing kernel config
'/boot/config-4.18.0-147.el8.s390x'
tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
tst_kconfig.c:62: INFO: Parsing kernel config
'/boot/config-4.18.0-147.el8.s390x'
acct02.c:239: INFO: Verifying using 'struct acct_v3'
acct02.c:192: INFO: == entry 1 ==
acct02.c:147: INFO: ac_version != 3 (131)
acct02.c:192: INFO: == entry 2 ==
acct02.c:82: INFO: ac_comm != 'acct02_helper' ('acct02')
acct02.c:133: INFO: ac_exitcode != 32768 (0)
acct02.c:141: INFO: ac_ppid != 34501 (34500)
acct02.c:147: INFO: ac_version != 3 (131)
acct02.c:182: FAIL: end of file reached

Signed-off-by: Ping Fang <pifang@redhat.com>
---
 testcases/kernel/syscalls/acct/acct02.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/acct/acct02.c b/testcases/kernel/syscalls/acct/acct02.c
index 7c2a27046..c513b2145 100644
--- a/testcases/kernel/syscalls/acct/acct02.c
+++ b/testcases/kernel/syscalls/acct/acct02.c
@@ -142,7 +142,8 @@ static int verify_acct(void *acc, int elap_time)
 		ret = 1;
 	}
 
-	if (ACCT_MEMBER_V3(ac_version) != 3) {
+	/* In big endian system accout version have a ACCT_BYTEORDER 0x80 flag*/
+	if (ACCT_MEMBER_V3(ac_version) != 3 || ACC_MEMBER_V3(ac_version) != 131) {
 		tst_res(TINFO, "ac_version != 3 (%d)",
 			ACCT_MEMBER_V3(ac_version));
 		ret = 1;
-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
