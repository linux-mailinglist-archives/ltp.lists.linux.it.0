Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB5348B01A
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jan 2022 16:00:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 735823C9404
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jan 2022 16:00:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DB5863C0F6A
 for <ltp@lists.linux.it>; Tue, 11 Jan 2022 16:00:44 +0100 (CET)
Received: from sender-op-o11.zoho.in (sender-op-o11.zoho.in [103.117.158.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 24206200049
 for <ltp@lists.linux.it>; Tue, 11 Jan 2022 16:00:42 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; t=1641913236; cv=none; d=zohomail.in; s=zohoarc; 
 b=echWdHaisy71WvbcUdW2AFykP9Q/M8gUJ4WD2qVL6lGYk1HsXGoTfjFKD1tImhPkzClaiYz3uockUJoJ6BBthMaKu0XIgAAvRFeSnOz2FpXtZNmk/IkV0zeiBLOZRuI3+F8qaKuKhazlgojVKebejLX9C6yDPRTQX3QEyv+L/AA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1641913236;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=saug25meq7Oaghaz+5b3k3qSeYvTHzFKTtf39jkWrUI=; 
 b=LEe8Bz8EHxkDgtlmTG2wz8qOG5dL9VaC2mNRFGwWFvgW0hlmyhAJCHVaznsH/1s4HyBE0Mh92s2ZoUrRaopUO7tHLfon4WVMzpOydJyMWsvAWEg6AiLBvxxH58B5la0vPUDY4la61GOQ471J+pCbKNitP47pLBIWPjK49RaKcLA=
ARC-Authentication-Results: i=1; mx.zohomail.in;
 dkim=pass  header.i=zilogic.com;
 spf=pass  smtp.mailfrom=kushalchand@zilogic.com;
 dmarc=pass header.from=<kushalchand@zilogic.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1641913236; 
 s=zoho; d=zilogic.com; i=kushalchand@zilogic.com;
 h=From:To:Cc:Message-ID:Subject:Date:MIME-Version:Content-Transfer-Encoding:Content-Type;
 bh=saug25meq7Oaghaz+5b3k3qSeYvTHzFKTtf39jkWrUI=;
 b=qB3+/rrQKlhm7ktV+PDl9CSici0C/7wVi4DvX1utsmcvo9LsX9GlsFAI238L0TFh
 oDlPrSYRmB2rmdNtS1uc+QUaIM7n7QuD/5xlWNNqwr96w87SBz4z55ogfL8XySy4sUZ
 Mw9CmLFFpoP9yn4n0urVO6pfIVQ7a1gFLXfmjhUg=
Received: from localhost.localdomain (49.37.219.189 [49.37.219.189]) by
 mx.zoho.in with SMTPS id 16419132347106.9741646594720805;
 Tue, 11 Jan 2022 20:30:34 +0530 (IST)
From: Kushal Chand <kushalchand@zilogic.com>
To: ltp@lists.linux.it
Message-ID: <20220111150028.92961-1-kushalchand@zilogic.com>
Date: Tue, 11 Jan 2022 20:30:28 +0530
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-ZohoMailClient: External
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v1] tst_taint: Print readable error message instead of
 numerical code
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
Cc: Kushal Chand <kushalchand@zilogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

---
 lib/tst_taint.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/tst_taint.c b/lib/tst_taint.c
index 49146aacb..af94656ed 100644
--- a/lib/tst_taint.c
+++ b/lib/tst_taint.c
@@ -90,7 +90,7 @@ void tst_taint_init(unsigned int mask)
 	}
 
 	if ((taint & taint_mask) != 0)
-		tst_brk(TBROK, "Kernel is already tainted: %u", taint);
+		tst_brk(TBROK, "Kernel is already tainted: TAINT_D (OOPS)");
 }
 
 
-- 
2.25.1



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
