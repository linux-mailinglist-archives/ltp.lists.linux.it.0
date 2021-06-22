Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE0A3B0450
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 14:26:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3C09B3C96E2
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 14:26:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 405F33C8705
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 14:25:48 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id BE7AC6007BF
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 14:25:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624364746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=inqBvEqdG3k1WomYCpRXm5dO5HpE8ub4VHyleRA1Xi8=;
 b=Xs7VcITbXEHmt0PrtGayAL+nHrlkIYSEZkA3+xAk//Hz3IxbPsxHTUXSWHePs4BUoPIDMD
 vAtGsnnFIDoxoPpoxX/79ycco+vYEi3IfyU+F9bR8awuuQuWdjmREB44TPG2DKu6eY9aO9
 puIHsViRIaNKOYNoMJkx+ApiqZjyoMo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-RKB0ybmZOSK7bhuBujDhaQ-1; Tue, 22 Jun 2021 08:25:45 -0400
X-MC-Unique: RKB0ybmZOSK7bhuBujDhaQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 576D591270;
 Tue, 22 Jun 2021 12:25:44 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com
 (dhcp-66-81-187.nay.redhat.com [10.66.81.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44B8510023B5;
 Tue, 22 Jun 2021 12:25:43 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Tue, 22 Jun 2021 20:25:38 +0800
Message-Id: <20210622122538.402907-3-liwang@redhat.com>
In-Reply-To: <20210622122538.402907-1-liwang@redhat.com>
References: <20210622122538.402907-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 3/3] tst_cgroup: make use of alias in
 safe_cgroup_has
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

This is to fix the check issue of 'memory.swap.max' on CGroup v1.

Signed-off-by: Li Wang <liwang@redhat.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
---
 lib/tst_cgroup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c
index 18e3b6169..61cc02fa7 100644
--- a/lib/tst_cgroup.c
+++ b/lib/tst_cgroup.c
@@ -1010,7 +1010,7 @@ int safe_cgroup_has(const char *const file, const int lineno,
 		if (!(alias = cgroup_file_alias(cfile, *dir)))
 		    continue;
 
-		if (!faccessat((*dir)->dir_fd, file_name, F_OK, 0))
+		if (!faccessat((*dir)->dir_fd, alias, F_OK, 0))
 			return 1;
 
 		if (errno == ENOENT)
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
