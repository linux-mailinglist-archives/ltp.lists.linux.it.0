Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA71249856
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Aug 2020 10:39:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C1B253C2FCB
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Aug 2020 10:39:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 8E4823C2FC3
 for <ltp@lists.linux.it>; Wed, 19 Aug 2020 10:38:57 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 348EC2009A9
 for <ltp@lists.linux.it>; Wed, 19 Aug 2020 10:38:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597826335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JUlsawEPdPiryaj7ozbBaoid6G5wH/9WX3aSiblsLTc=;
 b=XLQ28woGfeSk74EKUQedQHR4kernN0FZ/SzgKVV9NRkx5zhRBW/cyIqqz/LC8JJD7SxgJJ
 2Y0RXNVcjI9JKNU5z9suZeQJXS8NUGZJA8ngmXsVrsPWgz+ZN+hDNlPvQ0vDWuOsbmoZr7
 X40bnlzzOUCv24PLvHes6J6MdNP4Riw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-9beVWHb9NbG7WuwyEELuZg-1; Wed, 19 Aug 2020 04:38:51 -0400
X-MC-Unique: 9beVWHb9NbG7WuwyEELuZg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A250A100670A;
 Wed, 19 Aug 2020 08:38:50 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 016277AEC0;
 Wed, 19 Aug 2020 08:38:44 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it,
	liwang@redhat.com
Date: Wed, 19 Aug 2020 08:38:43 +0000
Message-Id: <20200819083843.26435-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwang@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2] clock_settime03: change to use CLOCK_REALTIME
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CLOCK_REALTIME_ALARM requires an RTC with alarm support, which may not be
present on a system. In that case, the kernel will return EOPNOTSUPP, which
is defined as ENOTSUP in userspace.

Here use CLOCK_REALTIME instead of the CLOCK_REALTIME_ALARM because we do
NOT need suspend the SUT during test.

For issue #712:
  https://github.com/linux-test-project/ltp/issues/712

Signed-off-by: Li Wang <liwang@redhat.com>
Cc: Viresh Kumar<viresh.kumar@linaro.org>
Cc: Cyril Hrubis <chrubis@suse.cz>
Cc: Jan Stancek <jstancek@redhat.com>
Tested-by: Li Wang <liwang@redhat.com>
---
 testcases/kernel/syscalls/clock_settime/clock_settime03.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/clock_settime/clock_settime03.c b/testcases/kernel/syscalls/clock_settime/clock_settime03.c
index 5b75afbe7..ad6183e4c 100644
--- a/testcases/kernel/syscalls/clock_settime/clock_settime03.c
+++ b/testcases/kernel/syscalls/clock_settime/clock_settime03.c
@@ -65,7 +65,7 @@ static void run(void)
 	SAFE_SIGADDSET(&set, SIGABRT);
 	SAFE_SIGPROCMASK(SIG_BLOCK, &set, NULL);
 
-	TEST(tst_syscall(__NR_timer_create, CLOCK_REALTIME_ALARM, &ev, &timer));
+	TEST(tst_syscall(__NR_timer_create, CLOCK_REALTIME, &ev, &timer));
 	if (TST_RET != 0)
 		tst_brk(TBROK | TERRNO, "timer_create() failed");
 
-- 
2.21.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
