Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E982CE830
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Dec 2020 07:33:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 928683C58F6
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Dec 2020 07:33:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id A6C053C2BAA
 for <ltp@lists.linux.it>; Fri,  4 Dec 2020 07:33:19 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 5234C1001168
 for <ltp@lists.linux.it>; Fri,  4 Dec 2020 07:33:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607063598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KZmtLWG39lqnDDTyocTA2aVv9yQweUHg9LAJyIP0BQQ=;
 b=bIllw7soxwAhe3UunEobRDu6z/R2ykgCANLWuHYu1gSWt9UPc2OhKZQQB5oOOyA9nwlqzV
 My8QJvAjxp0/I71FYfGL2DJkCsSuz5Cc7cuKpR6lM2UF6SkndBRNZ0gJT8InL/0R8SLJk9
 0vBMX4NSqsp12JrP19yBMsiBlP6aijw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-reEowpfrP_md3mccULGneA-1; Fri, 04 Dec 2020 01:33:14 -0500
X-MC-Unique: reEowpfrP_md3mccULGneA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67E33809DC3;
 Fri,  4 Dec 2020 06:33:13 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 42B205D9CA;
 Fri,  4 Dec 2020 06:33:11 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Fri,  4 Dec 2020 06:33:05 +0000
Message-Id: <20201204063305.6820-3-liwang@redhat.com>
In-Reply-To: <20201204063305.6820-1-liwang@redhat.com>
References: <20201203110616.28302-1-liwang@redhat.com>
 <20201204063305.6820-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 3/3] af_alg07: add dynamic bias for ARM
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

We observed that af_alg07 sporadically failed on hpe-moonshot(aarch64) with
fixed kernel, but after trying manually we can NOT reproduce it again, one
possibility is that the FAIL is caused by an unaligned race window between
two threads, so here add dynamic bias adjustment to see if it helps.

From Martin Doucha:

1) fchownat() returns 0 => fchownat() was called too early or the kernel is vulnerable
2) fchwonat() fails with ENOENT => kernel is fixed, print TPASS and exit
3) fchownat() fails with EBADF => fchownat() was called too late

Considering the test does NOT takes too time in 1) so we only adjust
delay when syscalls return an error state that clearly falls outside
the race window.

Signed-off-by: Li Wang <liwang@redhat.com>
CC: Richard Palethorpe <rpalethorpe@suse.com>
CC: Martin Doucha <mdoucha@suse.cz>
CC: Joerg Vehlow <lkml@jv-coder.de>
CC: Chunyu Hu <chuhu@redhat.com>
CC: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/crypto/af_alg07.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/testcases/kernel/crypto/af_alg07.c b/testcases/kernel/crypto/af_alg07.c
index 539ebee11..c94bb292f 100644
--- a/testcases/kernel/crypto/af_alg07.c
+++ b/testcases/kernel/crypto/af_alg07.c
@@ -76,6 +76,11 @@ static void run(void)
 			return;
 		}
 
+		if (TST_RET == -1 && TST_ERR == EBADF) {
+			tst_fzsync_pair_add_bias(&fzsync_pair, 1);
+			continue;
+		}
+
 		if (TST_RET == -1 && TST_ERR == ENOENT) {
 			tst_res(TPASS | TTERRNO,
 				"fchownat() failed successfully");
-- 
2.21.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
