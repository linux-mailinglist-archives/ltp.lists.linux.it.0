Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 616C1F8B7F
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 10:15:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 204433C2480
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 10:15:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 9C3793C0051
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 10:15:32 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 593E72014D8
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 10:15:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573550130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OLuLl/CXD+XL9VFAimywCP6iHIj7MyKw8i87yokuWE8=;
 b=cP87jjheoOGLAz9H414qRBQouaHm3F/skYoycYiUG2ZupSXW8fazJBkA2r4fyeHhD8qjrC
 88EgmTPZPSgL6VAQh8WGCNI2eMyumW64hx9pCeFeeY1Djqpmsg6T9Dn7molBXKAufxVE+J
 z43/LpNgkEi/Erszh5UO5JoJ5Qmm1GU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-HXZy_EJ0NK-5P94dnfQJ0A-1; Tue, 12 Nov 2019 04:15:29 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 359B11005500
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 09:15:28 +0000 (UTC)
Received: from dustball.usersys.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B1F7D9F62
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 09:15:27 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Tue, 12 Nov 2019 10:15:18 +0100
Message-Id: <95d94fede00533a07fc604de3252636b094fc8f8.1573550061.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: HXZy_EJ0NK-5P94dnfQJ0A-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] acct02: relax ac_btime checks
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

ac_btime is calculated back from current time and isn't accurate.
Problems include nanoseconds accumulation (lags behind gettimeofday),
suspend/resume isn't taken into account and any adjtime() (like DST
change) will cause ac_btime to jump as well.

Relax the condition to ~2h around gettimeofday value at start of
the test. That should be enough to cover usual DST time jumps.

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 testcases/kernel/syscalls/acct/acct02.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/testcases/kernel/syscalls/acct/acct02.c b/testcases/kernel/syscalls/acct/acct02.c
index 890568b08774..2f1290fa287f 100644
--- a/testcases/kernel/syscalls/acct/acct02.c
+++ b/testcases/kernel/syscalls/acct/acct02.c
@@ -74,7 +74,8 @@ static int verify_acct(void *acc, int elap_time)
 {
 	int sys_time  = UNPACK(ACCT_MEMBER(ac_stime));
 	int user_time = UNPACK(ACCT_MEMBER(ac_stime));
-	int ret = 0, tmp;
+	unsigned int btime_diff;
+	int ret = 0;
 	float tmp2;
 
 	if (strcmp(ACCT_MEMBER(ac_comm), COMMAND)) {
@@ -83,15 +84,13 @@ static int verify_acct(void *acc, int elap_time)
 		ret = 1;
 	}
 
-	if (ACCT_MEMBER(ac_btime) < start_time) {
-		tst_res(TINFO, "ac_btime < %d (%d)", start_time,
-			ACCT_MEMBER(ac_btime));
-		ret = 1;
-	}
+	if (start_time > ACCT_MEMBER(ac_btime))
+		btime_diff = start_time - ACCT_MEMBER(ac_btime);
+	else
+		btime_diff = ACCT_MEMBER(ac_btime) - start_time;
 
-	tmp = ACCT_MEMBER(ac_btime) - start_time;
-	if (tmp > 1) {
-		tst_res(TINFO, "ac_btime - %d > 1 (%d)", start_time, tmp);
+	if (btime_diff > 7200) {
+		tst_res(TINFO, "ac_btime_diff %u", btime_diff);
 		ret = 1;
 	}
 
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
