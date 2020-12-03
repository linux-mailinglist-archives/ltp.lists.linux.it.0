Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA982CD444
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Dec 2020 12:06:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BA1F93C4C23
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Dec 2020 12:06:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id DC5603C2C99
 for <ltp@lists.linux.it>; Thu,  3 Dec 2020 12:06:24 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 4D45C140012E
 for <ltp@lists.linux.it>; Thu,  3 Dec 2020 12:06:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606993583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oO4W/p64n/ScJ68eUS/SjDEpEBx30Tq/+ubGp+70o6g=;
 b=BdaKZfnUR/eqSbgfOhfKgwVDMTmS9FqVrk9Kn8VxOdc843NaQwW/prm14OXD9olTeynZ0y
 DnvTqdP852B6d6OaQYtIC/EOhHHhjJ9VUMSOmjDXUFGtsNeXejaak2qJJ2xWGQbZ1zZuv0
 hYsNeJLBw6r+6mLsiukVvC9IvFVk2+k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-T2XfR8buNIK2x7Rx6ECyzQ-1; Thu, 03 Dec 2020 06:06:21 -0500
X-MC-Unique: T2XfR8buNIK2x7Rx6ECyzQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C07EEAFA84
 for <ltp@lists.linux.it>; Thu,  3 Dec 2020 11:06:20 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED2F0189B6
 for <ltp@lists.linux.it>; Thu,  3 Dec 2020 11:06:19 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Thu,  3 Dec 2020 11:06:15 +0000
Message-Id: <20201203110616.28302-2-liwang@redhat.com>
In-Reply-To: <20201203110616.28302-1-liwang@redhat.com>
References: <20201203110616.28302-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] syscalls: take use of .min_cpus
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

To set the minimal numbers of online CPU for test.

[From Martin Doucha]
af_alg07 requires 2 CPUs, otherwise it'll report false positives.
The test will pass only if fchownat() hits a half-closed socket and
returns error. But IIRC the half-closed socket will be destroyed during
reschedule which means there's no race window to hit anymore. But it
would be better to put the TCONF condition into the test itself.

getcwd04: as itself requirements.

Signed-off-by: Li Wang <liwang@redhat.com>
---
 testcases/kernel/crypto/af_alg07.c          | 1 +
 testcases/kernel/syscalls/getcwd/getcwd04.c | 6 ++----
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/crypto/af_alg07.c b/testcases/kernel/crypto/af_alg07.c
index 6ad86f4f3..539ebee11 100644
--- a/testcases/kernel/crypto/af_alg07.c
+++ b/testcases/kernel/crypto/af_alg07.c
@@ -110,6 +110,7 @@ static struct tst_test test = {
 	.setup = setup,
 	.cleanup = cleanup,
 	.min_kver = "4.10.0",
+	.min_cpus = 2,
 	.taint_check = TST_TAINT_W | TST_TAINT_D,
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "9060cb719e61"},
diff --git a/testcases/kernel/syscalls/getcwd/getcwd04.c b/testcases/kernel/syscalls/getcwd/getcwd04.c
index 2fa65fb2c..2e07e675f 100644
--- a/testcases/kernel/syscalls/getcwd/getcwd04.c
+++ b/testcases/kernel/syscalls/getcwd/getcwd04.c
@@ -68,9 +68,6 @@ static void verify_getcwd(void)
 
 static void setup(void)
 {
-	if (tst_ncpus() == 1)
-		tst_brk(TCONF, "This test needs two cpus at least");
-
 	SAFE_SIGNAL(SIGALRM, sigproc);
 
 	alarm(TIMEOUT);
@@ -101,5 +98,6 @@ static struct tst_test test = {
 	.setup = setup,
 	.test_all = verify_getcwd,
 	.needs_tmpdir = 1,
-	.forks_child = 1
+	.forks_child = 1,
+	.min_cpus = 2
 };
-- 
2.21.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
