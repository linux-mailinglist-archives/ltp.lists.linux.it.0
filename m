Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A3035D87C
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Apr 2021 09:08:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E98433C71FB
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Apr 2021 09:08:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8990B3C1B0A
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 09:08:06 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4A2A2200DC8
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 09:08:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1618297686; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9n/nzcOhiIh7GD16iYVdxGI0HurL5MM1D+gOHIa2WXs=;
 b=o73Arxb3MDoj27yOxM5o9pf1l8IUcxdC4A+QN5mj41ks7UIDrxLP+VbwCgIZLfuyRhPzIr
 Em0OU/HwwntCE1j/liEKgZPSrULjJNVLmFpDkqzLdX0L2SoCSNIJQi8/e2X43B5wBpl7Xs
 kGiiupOrlr/v1HeBiPz0gqKq1FAEiB0=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DE0B2AF4F;
 Tue, 13 Apr 2021 07:08:05 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue, 13 Apr 2021 08:07:48 +0100
Message-Id: <20210413070753.1691-3-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210413070753.1691-1-rpalethorpe@suse.com>
References: <20210413070753.1691-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v4 2/7] fzsync: Reset delay bias
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

If the delay bias a preserved then it breaks tests which have multiple
scenarios and/or use -i. The test author could reset it manually in
this case, but it's likely to be error prone.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
Acked-by: Petr Vorel <pvorel@suse.cz>
Reviewed-by: Li Wang <liwang@redhat.com>
---
 include/tst_fuzzy_sync.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/tst_fuzzy_sync.h b/include/tst_fuzzy_sync.h
index 4141f5c64..b8841d96d 100644
--- a/include/tst_fuzzy_sync.h
+++ b/include/tst_fuzzy_sync.h
@@ -289,6 +289,7 @@ static void tst_fzsync_pair_reset(struct tst_fzsync_pair *pair,
 	tst_init_stat(&pair->diff_ab);
 	tst_init_stat(&pair->spins_avg);
 	pair->delay = 0;
+	pair->delay_bias = 0;
 	pair->sampling = pair->min_samples;
 
 	pair->exec_loop = 0;
-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
