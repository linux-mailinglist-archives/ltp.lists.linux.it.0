Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8FF2C3D89
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Nov 2020 11:16:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7BC013C4E37
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Nov 2020 11:16:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id DF0D23C0489
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 11:16:41 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 529A7200C80
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 11:16:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606299399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dY0WY40n1ldWj15cPBtiqIM8Vau1u4GZ7ZIS8GRbvtI=;
 b=KthDy2sAvoexppwxWrJlmYRBMMMJ0SCD5k6qVWIzY/ZGM28qOwYxCM5/9oeZbYsKnx+Oe6
 UBvz45dPbD/OqItwmjUwMjqErvpNBL1yFimIBRpVinN20SdO57nrj2569aTtIviTvvawUp
 c3GeC4ACy5Dz1WaMbVdhBJyYCX5Q6Q8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-sPHDo1V5MB-Jjul008y4Xw-1; Wed, 25 Nov 2020 05:16:37 -0500
X-MC-Unique: sPHDo1V5MB-Jjul008y4Xw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BB7510082E2;
 Wed, 25 Nov 2020 10:16:36 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 408A69CA0;
 Wed, 25 Nov 2020 10:16:35 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: rpalethorpe@suse.de,
	ltp@lists.linux.it
Date: Wed, 25 Nov 2020 10:16:33 +0000
Message-Id: <20201125101633.30154-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] fzsync: skip test when avaliable CPUs less than 2
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

It makes no sense to run parallel thread to simulate race conditions on
system with CPU number less than two, especially for kvm guest, it does
not have any chance to get real parallel running and probably encounter
failure as below:

=== 100% reproducible on a 1cpu guest ===

cmdline="af_alg07"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1248: TINFO: Timeout per run is 0h 05m 00s
../../../include/tst_fuzzy_sync.h:507: TINFO: Minimum sampling period ended
../../../include/tst_fuzzy_sync.h:330: TINFO: loop = 1024, delay_bias = 0
../../../include/tst_fuzzy_sync.h:318: TINFO: start_a - start_b: { avg = -137522ns, avg_dev = 854248ns, dev_ratio = 6.21 }
../../../include/tst_fuzzy_sync.h:318: TINFO: end_a - start_a  : { avg =  1915ns, avg_dev =   535ns, dev_ratio = 0.28 }
../../../include/tst_fuzzy_sync.h:318: TINFO: end_b - start_b  : { avg =  1885ns, avg_dev =    42ns, dev_ratio = 0.02 }
../../../include/tst_fuzzy_sync.h:318: TINFO: end_a - end_b    : { avg = -137492ns, avg_dev = 854818ns, dev_ratio = 6.22 }
../../../include/tst_fuzzy_sync.h:318: TINFO: spins            : { avg = 554786  , avg_dev =  7355  , dev_ratio = 0.01 }
../../../include/tst_fuzzy_sync.h:636: TINFO: Exceeded execution time, requesting exit
af_alg07.c:96: TFAIL: fchownat() failed to fail, kernel may be vulnerable

Signed-off-by: Li Wang <liwang@redhat.com>
CC: Richard Palethorpe <rpalethorpe@suse.de>
---
 include/tst_fuzzy_sync.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/tst_fuzzy_sync.h b/include/tst_fuzzy_sync.h
index 4141f5c64..2e864b312 100644
--- a/include/tst_fuzzy_sync.h
+++ b/include/tst_fuzzy_sync.h
@@ -281,6 +281,9 @@ static void tst_init_stat(struct tst_fzsync_stat *s)
 static void tst_fzsync_pair_reset(struct tst_fzsync_pair *pair,
 				  void *(*run_b)(void *))
 {
+	if (get_nprocs() < 2)
+		tst_brk(TCONF, "Fuzzy Sync requires at least two CPUs available");
+
 	tst_fzsync_pair_cleanup(pair);
 
 	tst_init_stat(&pair->diff_ss);
-- 
2.21.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
