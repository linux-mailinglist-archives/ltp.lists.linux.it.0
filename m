Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C5C1EF39F
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Jun 2020 11:02:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 556D13C2F6D
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Jun 2020 11:02:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 878563C209F
 for <ltp@lists.linux.it>; Fri,  5 Jun 2020 11:02:34 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id E9E2B1417626
 for <ltp@lists.linux.it>; Fri,  5 Jun 2020 11:02:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591347752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=7kJ+pTZ/S8p5qNukbUJccTRtqmLQYTcj5LFmNjFXCWI=;
 b=BzbKINAKOLtX3z+irJW0Nc4rangvjwUOX+CY531rZazWiqz50J+ryHAsVtfdnNo8CeiUta
 WtTBVFBo5LJXrDCFFHxJWpYnuoj9iWX72m2h+KyAEE12B9HdA2DP86SSHzew9Pu1KPzeCX
 /1l7QyTWg4TSDYTX188YzwXKz/3PoZE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-ipIJY1zAMX6yBsF8SuOvhg-1; Fri, 05 Jun 2020 05:02:30 -0400
X-MC-Unique: ipIJY1zAMX6yBsF8SuOvhg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 106B48018AC
 for <ltp@lists.linux.it>; Fri,  5 Jun 2020 09:02:30 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.43.17.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A39D6111F
 for <ltp@lists.linux.it>; Fri,  5 Jun 2020 09:02:29 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Fri,  5 Jun 2020 11:02:21 +0200
Message-Id: <5632b2169cfe32807e8380be50ced5e5d6ff93cb.1591347655.git.jstancek@redhat.com>
In-Reply-To: <9b9e3d35b4fddb668b02595e418a997332f98491.1591347655.git.jstancek@redhat.com>
References: <9b9e3d35b4fddb668b02595e418a997332f98491.1591347655.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] syscalls/setns01: accept also EBADF for regular fd
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

commit 303cc571d107 ("nsproxy: attach to namespaces via pidfds")
changed errno that is returned for regular file from EINVAL to EBADF.

Accept any of the two as expect errno code.

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 testcases/kernel/syscalls/setns/setns01.c | 51 ++++++++++++++++-------
 1 file changed, 36 insertions(+), 15 deletions(-)

diff --git a/testcases/kernel/syscalls/setns/setns01.c b/testcases/kernel/syscalls/setns/setns01.c
index 0cf2684ba6ef..2115b81e647f 100644
--- a/testcases/kernel/syscalls/setns/setns01.c
+++ b/testcases/kernel/syscalls/setns/setns01.c
@@ -41,7 +41,7 @@ struct testcase_t {
 	int fd;
 	int ns_type;
 	int exp_ret;
-	int exp_errno;
+	int exp_errno[2];
 	int skip;
 	void (*setup) (struct testcase_t *, int i);
 	void (*cleanup) (struct testcase_t *);
@@ -60,13 +60,13 @@ struct testcase_t tcases[] = {
 		.msg = "invalid fd",
 		.fd = -1,
 		.exp_ret = -1,
-		.exp_errno = EBADF,
+		.exp_errno = { EBADF },
 		.setup = setup0,
 	},
 	{
 		.msg = "regular file fd",
 		.exp_ret = -1,
-		.exp_errno = EINVAL,
+		.exp_errno = { EINVAL, EBADF },
 		.setup = setup1,
 		.cleanup = cleanup1
 	},
@@ -74,19 +74,19 @@ struct testcase_t tcases[] = {
 		.msg = "invalid ns_type",
 		.ns_type = -1,
 		.exp_ret = -1,
-		.exp_errno = EINVAL,
+		.exp_errno = { EINVAL },
 		.setup = setup2,
 	},
 	{
 		.msg = "mismatch ns_type/fd",
 		.exp_ret = -1,
-		.exp_errno = EINVAL,
+		.exp_errno = { EINVAL },
 		.setup = setup3,
 	},
 	{
 		.msg = "without CAP_SYS_ADMIN",
 		.exp_ret = -1,
-		.exp_errno = EPERM,
+		.exp_errno = { EPERM },
 		.setup = setup4,
 		.cleanup = cleanup4,
 	}
@@ -145,7 +145,9 @@ static void cleanup4(LTP_ATTRIBUTE_UNUSED struct testcase_t *t)
 
 static void test_setns(unsigned int testno)
 {
-	int ret, i;
+	int ret, i, tres, saved_errno;
+	unsigned int j;
+	char errnos_str[256], *errnos_pos;
 	struct testcase_t *t = &tcases[testno];
 
 	for (i = 0; i < ns_total; i++) {
@@ -159,18 +161,37 @@ static void test_setns(unsigned int testno)
 
 		tst_res(TINFO, "setns(%d, 0x%x)", t->fd, t->ns_type);
 		ret = tst_syscall(__NR_setns, t->fd, t->ns_type);
-		if (ret == t->exp_ret) {
-			if (ret == -1 && errno == t->exp_errno)
-				tst_res(TPASS, "%s exp_errno=%d", t->msg,
-						t->exp_errno);
-			else
-				tst_res(TFAIL|TERRNO, "%s exp_errno=%d",
-					t->msg, t->exp_errno);
-		} else {
+		saved_errno = errno;
+
+		if (ret != t->exp_ret) {
 			tst_res(TFAIL, "%s ret=%d expected=%d", t->msg,
 					ret, t->exp_ret);
+			goto done;
 		}
 
+		/* Consider PASS if any errno matches */
+		tres = TFAIL;
+		memset(errnos_str, 0, sizeof(errnos_str));
+		errnos_pos = errnos_str;
+		for (j = 0; j < ARRAY_SIZE(t->exp_errno); j++) {
+			if (!t->exp_errno[j])
+				break;
+
+			ret = sprintf(errnos_pos, "%s%s",
+				(j == 0) ? "" : ",",
+				tst_strerrno(t->exp_errno[j]));
+
+			if (ret >= 0)
+				errnos_pos += ret;
+
+			if (saved_errno == t->exp_errno[j])
+				tres = TPASS;
+		}
+
+		tst_res(tres, "%s exp_errno(%s), got(%s)", t->msg,
+			errnos_str, tst_strerrno(saved_errno));
+
+done:
 		if (t->cleanup)
 			t->cleanup(t);
 	}
-- 
2.18.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
