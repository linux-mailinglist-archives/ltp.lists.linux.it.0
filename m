Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EB736CC2E0
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Oct 2019 20:44:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AB5DA3C226E
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Oct 2019 20:44:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id D4A1A3C2219
 for <ltp@lists.linux.it>; Fri,  4 Oct 2019 20:44:40 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 74A461400437
 for <ltp@lists.linux.it>; Fri,  4 Oct 2019 20:44:39 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 66A413090FDB
 for <ltp@lists.linux.it>; Fri,  4 Oct 2019 18:44:37 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-123-100.rdu2.redhat.com
 [10.10.123.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DB545D9DC
 for <ltp@lists.linux.it>; Fri,  4 Oct 2019 18:44:37 +0000 (UTC)
From: rasibley <rasibley@redhat.com>
To: ltp@lists.linux.it
Date: Fri,  4 Oct 2019 14:44:36 -0400
Message-Id: <20191004184436.30922-1-rasibley@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Fri, 04 Oct 2019 18:44:37 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] Update dynamic_debug grep check
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

If running on debug kernel this check will fail on EDAC DEBUG messages,
update grep to ignore such cases like this.
---
 testcases/kernel/tracing/dynamic_debug/dynamic_debug01.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/tracing/dynamic_debug/dynamic_debug01.sh b/testcases/kernel/tracing/dynamic_debug/dynamic_debug01.sh
index f39d67d0a..7f06c2488 100755
--- a/testcases/kernel/tracing/dynamic_debug/dynamic_debug01.sh
+++ b/testcases/kernel/tracing/dynamic_debug/dynamic_debug01.sh
@@ -127,7 +127,7 @@ ddebug_test()
 	sed -i -e 1,`wc -l < ./dmesg.old`d ./dmesg.new
 	if grep -q -e "Kernel panic" -e "Oops" -e "general protection fault" \
 		-e "general protection handler: wrong gs" -e "\(XEN\) Panic" \
-		-e "fault" -e "warn" -e "BUG" ./dmesg.new ; then
+		-e "fault" -e "warn" -e "\<BUG\>" ./dmesg.new ; then
 		tst_res TFAIL "Issues found in dmesg!"
 	else
 		tst_res TPASS "Dynamic debug OK"
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
