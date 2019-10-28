Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C15E72A9
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Oct 2019 14:33:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 863483C25B9
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Oct 2019 14:33:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 32E8C3C1CA7
 for <ltp@lists.linux.it>; Mon, 28 Oct 2019 14:33:40 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 7D81960076D
 for <ltp@lists.linux.it>; Mon, 28 Oct 2019 14:33:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572269618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FxsYHfHwkCdGvAxUWeV54EPXcTUxkrIXs/dkbkaATDc=;
 b=VmHJAFdFV1tBQZZ+ipJh4NmepA8pInvTxUCjqP76BQwPHl6IC/7fAgCrpMQrJR2vsLkG60
 kVb0GtMOVGF6byrBT/f33cs8TZ+DqrfCa5OFa0trd8UOfQ9kDim45X4cjyYHwFCrVAYZjb
 IkbnWzMu5sKsonIm3uTtrmgz5yRLJbU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-DFNU3hQeM_6bLW3J5Wr7pA-1; Mon, 28 Oct 2019 09:33:35 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 019A0801E56;
 Mon, 28 Oct 2019 13:33:35 +0000 (UTC)
Received: from dustball.usersys.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 464023CCA;
 Mon, 28 Oct 2019 13:33:33 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Mon, 28 Oct 2019 14:33:26 +0100
Message-Id: <a5174e749dd7b6089fa861b5369baf9f80c51ef8.1572269566.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: DFNU3hQeM_6bLW3J5Wr7pA-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] pt_test: skip pt_disable_branch on Broadwell CPUs
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
Cc: ammy.yi@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

commit d35869ba348d ("perf/x86/intel/pt: Allow the disabling of branch tracing")
disallows not setting BRANCH_EN due to erratum BDM106 on Broadwell CPUs.

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 testcases/kernel/tracing/pt_test/pt_test.c | 31 ++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/testcases/kernel/tracing/pt_test/pt_test.c b/testcases/kernel/tracing/pt_test/pt_test.c
index 1095e800f721..f9903fdcd396 100644
--- a/testcases/kernel/tracing/pt_test/pt_test.c
+++ b/testcases/kernel/tracing/pt_test/pt_test.c
@@ -124,6 +124,32 @@ static void intel_pt_trace_check(void)
 	tst_res(TPASS, "perf trace test passed");
 }
 
+static int is_affected_by_erratum_BDM106(void)
+{
+	int family = -1, model = -1;
+
+	if (FILE_LINES_SCANF("/proc/cpuinfo", "cpu family%*s%d", &family)
+		|| family != 6)
+		return 0;
+
+	if (!FILE_LINES_SCANF("/proc/cpuinfo", "model%*s%d", &model)) {
+		tst_res(TINFO, "Intel FAM6 model %d", model);
+
+		switch (model) {
+		case 0x3D: /* INTEL_FAM6_BROADWELL */
+		/* fallthrough */
+		case 0x47: /* INTEL_FAM6_BROADWELL_G */
+		/* fallthrough */
+		case 0x4F: /* INTEL_FAM6_BROADWELL_X */
+		/* fallthrough */
+		case 0x56: /* INTEL_FAM6_BROADWELL_D */
+			return 1;
+		}
+	}
+
+	return 0;
+}
+
 static void setup(void)
 {
 	struct perf_event_attr attr = {};
@@ -145,6 +171,11 @@ static void setup(void)
 	attr.size	= sizeof(struct perf_event_attr);
 	attr.mmap			= 1;
 	if (str_branch_flag) {
+		if (is_affected_by_erratum_BDM106()) {
+			tst_brk(TCONF, "erratum BDM106 disallows not "
+				"setting BRANCH_EN on this CPU");
+		}
+
 		tst_res(TINFO, "Intel PT will disable branch trace");
 		attr.config |= 1;
 	}
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
