Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C61943ED2FD
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Aug 2021 13:17:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E34013C5ADE
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Aug 2021 13:17:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5DC4A3C5906
 for <ltp@lists.linux.it>; Mon, 16 Aug 2021 13:17:34 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 6442A600776
 for <ltp@lists.linux.it>; Mon, 16 Aug 2021 13:17:33 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id C3A7E1FEB8;
 Mon, 16 Aug 2021 11:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1629112652; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yEqiqMz/UJtFsyh5fkAFkAAjno8Fe5Z1HcAiqd/58FA=;
 b=CI8OXpvrHGxxiYSdC9bHveO0VtZmQwmjBgeBlssxokfGcghjqUtqBgzGDI66MHtKxwV3YT
 oQFMoZjWLvR8I1Lhq+SwCYq5HitN95/ApgayCYziQmueQAfNtkyZVC+nN1T5xF+3M3EH1n
 k0cjp2l4UstX9V3GO5zI2oq6vSeWNd4=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 88B4FA3B88;
 Mon, 16 Aug 2021 11:17:32 +0000 (UTC)
To: ltp@lists.linux.it
Date: Mon, 16 Aug 2021 12:16:51 +0100
Message-Id: <20210816111651.29860-2-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210816111651.29860-1-rpalethorpe@suse.com>
References: <20210812064741.4246-1-rpalethorpe@suse.com>
 <20210816111651.29860-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v4 2/2] setsockopt08: Avoid confusion by removing TCONF
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

When not in compat mode this only tests that bad offsets result in
EINVAL. When in compat mode, we also test for the vulnerability.

Therefor I view this as two tests. The TCONF was supposed to indicate
the configuration didn't allow one of these tests. However it just
caused confusion with multiple people asking me to change it to
tst_brk.

So change it to TINFO.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 testcases/kernel/syscalls/setsockopt/setsockopt08.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/setsockopt/setsockopt08.c b/testcases/kernel/syscalls/setsockopt/setsockopt08.c
index 20abe85b4..1ffc69178 100644
--- a/testcases/kernel/syscalls/setsockopt/setsockopt08.c
+++ b/testcases/kernel/syscalls/setsockopt/setsockopt08.c
@@ -91,7 +91,7 @@ static void *buffer;
 void setup(void)
 {
 	if (tst_kernel_bits() == 32 || sizeof(long) > 4) {
-		tst_res(TCONF,
+		tst_res(TINFO,
 			"The vulnerability was only present in 32-bit compat mode");
 	}
 
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
