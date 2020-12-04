Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 338072CE82E
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Dec 2020 07:33:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ED07D3C2BAA
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Dec 2020 07:33:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 7D9173C2413
 for <ltp@lists.linux.it>; Fri,  4 Dec 2020 07:33:13 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id BACA51001168
 for <ltp@lists.linux.it>; Fri,  4 Dec 2020 07:33:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607063591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7n4CpWjUXumR2knAzw9lGsWVOnRHO5peJ9tVU/IOmEQ=;
 b=P4XUAosSZ3SjAOrGZY8YPvQdbhkedX3/s/HpE0Nu2tm22T7CaPYEbERFFExhCFihf8ljIF
 P1FcGlNP6K8e94TYY1WXAFgK8tuMSkyRHuBKV2OFT02SV5L04u2t5jswEtsuCj4yVxJJG4
 guFi0NYfoffrzF5Wy6CcOmZ10uE0V3E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-86zOx-6-MyKjCLfHTEUH7g-1; Fri, 04 Dec 2020 01:33:09 -0500
X-MC-Unique: 86zOx-6-MyKjCLfHTEUH7g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 728D4107ACE8
 for <ltp@lists.linux.it>; Fri,  4 Dec 2020 06:33:08 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A512D5D9CA
 for <ltp@lists.linux.it>; Fri,  4 Dec 2020 06:33:07 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Fri,  4 Dec 2020 06:33:03 +0000
Message-Id: <20201204063305.6820-1-liwang@redhat.com>
In-Reply-To: <20201203110616.28302-1-liwang@redhat.com>
References: <20201203110616.28302-1-liwang@redhat.com>
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
Subject: [LTP] [PATCH v2 1/3] lib: add .min_cpus in tst_test struct
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

As the name implies, this new field is mainly to set minimum numbers
of CPU for LTP testcase. If system online CPUs are less than .min_cpus,
test will be exit with TCONF.

Note: I wouldn't add more description in test-writing-guidelines.txt,
because it is easy to understand the usage from the name.

Signed-off-by: Li Wang <liwang@redhat.com>
---
 include/tst_test.h | 3 +++
 lib/tst_test.c     | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/include/tst_test.h b/include/tst_test.h
index c91d3f18a..b4fc4db47 100644
--- a/include/tst_test.h
+++ b/include/tst_test.h
@@ -157,6 +157,9 @@ struct tst_test {
 	 */
 	int all_filesystems:1;
 
+	/* Minimum numbers of online CPU required by the test */
+	unsigned long min_cpus;
+
 	/*
 	 * If set non-zero number of request_hugepages, test will try to reserve the
 	 * expected number of hugepage for testing in setup phase. If system does not
diff --git a/lib/tst_test.c b/lib/tst_test.c
index 535c0ff4c..c4e04eb4a 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -918,6 +918,9 @@ static void do_setup(int argc, char *argv[])
 	if (tst_test->all_filesystems)
 		tst_test->needs_device = 1;
 
+	if (tst_test->min_cpus > tst_ncpus())
+		tst_brk(TCONF, "Test needs at least %lu CPUs online", tst_test->min_cpus);
+
 	if (tst_test->request_hugepages)
 		tst_request_hugepages(tst_test->request_hugepages);
 
-- 
2.21.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
