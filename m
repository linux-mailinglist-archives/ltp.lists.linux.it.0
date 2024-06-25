Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 265839164D6
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Jun 2024 12:01:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B76403D0FC6
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Jun 2024 12:01:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 739403D0DB6
 for <ltp@lists.linux.it>; Tue, 25 Jun 2024 12:01:45 +0200 (CEST)
Authentication-Results: in-6.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=liwang@redhat.com;
 receiver=lists.linux.it)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 37FC91402F8D
 for <ltp@lists.linux.it>; Tue, 25 Jun 2024 12:01:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719309703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tB8ZB+AAtcjPGPuov9fG9wgBLZ/OTOMYLaf5soWJwac=;
 b=GBSo5q8qZrsSOPBtdr2rcEaIO6sRuBSXMEMxoSVyxHXkLgZgS6gQ+3R8BBc/hONZPd5Mjf
 7uEGbSTskHRAN+W4nie4hdUHZlptlZctjx53qn7ywJPeYz4BQStlzFvOLJ/Guk3lotIcmq
 4o/cYFUIv0mcYZmyqeq96bp0JmLToqw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-649-oCJkax2nNLGw6yAG-bNGdg-1; Tue,
 25 Jun 2024 06:01:39 -0400
X-MC-Unique: oCJkax2nNLGw6yAG-bNGdg-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 864D919560B5; Tue, 25 Jun 2024 10:01:38 +0000 (UTC)
Received: from dell-per7425-02.rhts.eng.pek2.redhat.com
 (dell-per7425-02.rhts.eng.pek2.redhat.com [10.73.116.18])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4244E1955E72; Tue, 25 Jun 2024 10:01:35 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: chrubis@suse.cz,
	ltp@lists.linux.it
Date: Tue, 25 Jun 2024 18:01:30 +0800
Message-ID: <20240625100130.735643-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] msgstress01: remove TWARN type from runtime remaining
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

To mask the issue where a warning is being treated as a failure in CI
logs, we modify the code to change the message type from TWARN to TINFO.

This warning easily happens especaill on debug/slower kernel:

    msgstress01.c:217: TWARN: Out of runtime during forking...

Signed-off-by: Li Wang <liwang@redhat.com>
---
 testcases/kernel/syscalls/ipc/msgstress/msgstress01.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/ipc/msgstress/msgstress01.c b/testcases/kernel/syscalls/ipc/msgstress/msgstress01.c
index 8b1e9a8c0..9f0ba105d 100644
--- a/testcases/kernel/syscalls/ipc/msgstress/msgstress01.c
+++ b/testcases/kernel/syscalls/ipc/msgstress/msgstress01.c
@@ -214,7 +214,7 @@ static void run(void)
 			break;
 
 		if (!tst_remaining_runtime()) {
-			tst_res(TWARN, "Out of runtime during forking...");
+			tst_res(TINFO, "Warning: Out of runtime during forking...");
 			*stop = 1;
 			break;
 		}
-- 
2.45.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
