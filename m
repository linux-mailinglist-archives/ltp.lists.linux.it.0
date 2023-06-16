Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 60052732C2F
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jun 2023 11:41:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B5C673CBF57
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jun 2023 11:41:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B05D63CB0C9
 for <ltp@lists.linux.it>; Fri, 16 Jun 2023 11:41:06 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E3C88100093D
 for <ltp@lists.linux.it>; Fri, 16 Jun 2023 11:41:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686908464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=y6PF8GmYg55H0/Mpyu99zv89v4qk9tUaSEnWc7NGmcc=;
 b=D6PtKOcDMsRVPztJr5OO+1bGapqBIKWJvOonMMD1sUysVCl8KqRgwbuWCx+nRVWGsRdCvZ
 hyk7xzNB3MFVzG0LONLeNcTU3FXoZe1uUPlcXmzcmKd6/ESgKYtFfp1StYRFR6fpU5Jrax
 24urLhaa06lJ+/xeWWTvJPzuw+99RyY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-sGEGH9DfPI2By6hMk-lsXg-1; Fri, 16 Jun 2023 05:41:02 -0400
X-MC-Unique: sGEGH9DfPI2By6hMk-lsXg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 707C229A9D43
 for <ltp@lists.linux.it>; Fri, 16 Jun 2023 09:41:02 +0000 (UTC)
Received: from liwang-workstation.lab.eng.nay.redhat.com (unknown
 [10.66.145.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F9FB1121314
 for <ltp@lists.linux.it>; Fri, 16 Jun 2023 09:41:01 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Fri, 16 Jun 2023 17:40:59 +0800
Message-Id: <20230616094059.165814-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 1.0.1 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
Subject: [LTP] [COMMITTED] safe_mount: tolerate the realpath fails
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

realpath() failure is not a fatal error in safe_mount,
it's safe to tolerate them.

Follow-up-fix: 3490c2842b93bbde71168d8598d06f15ea5d4010
Signed-off-by: Li Wang <liwang@redhat.com>
---
 lib/safe_macros.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/safe_macros.c b/lib/safe_macros.c
index 037eb0e62..951e1b064 100644
--- a/lib/safe_macros.c
+++ b/lib/safe_macros.c
@@ -905,7 +905,7 @@ int safe_mount(const char *file, const int lineno, void (*cleanup_fn)(void),
 			"Mounting %s to %s fstyp=%s flags=%lx",
 			source, mpath, filesystemtype, mountflags);
 	} else {
-		tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
+		tst_resm_(file, lineno, TINFO | TERRNO,
 			"Cannot resolve the absolute path of %s", target);
 	}
 	/*
@@ -962,7 +962,7 @@ int safe_umount(const char *file, const int lineno, void (*cleanup_fn)(void),
 	if (realpath(target, mpath)) {
 		tst_resm_(file, lineno, TINFO, "Umounting %s", mpath);
 	} else {
-		tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
+		tst_resm_(file, lineno, TINFO | TERRNO,
 			"Cannot resolve the absolute path of %s", target);
 	}
 
-- 
2.40.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
