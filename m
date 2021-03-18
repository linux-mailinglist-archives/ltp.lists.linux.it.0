Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8213E34067B
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Mar 2021 14:10:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 51BE53C839F
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Mar 2021 14:10:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 61B643C603A
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 14:10:04 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4F166200FCF
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 14:10:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1616073003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vBp2OY65Nm8EVwQMwH5cS1ct0nRVIFZGG1Mov/zWHPw=;
 b=gWzIuCws1Ghu5t5uLJ6yyqTsKbsDUjP9pk4z3NuNP9+aHRHNM2dJboxcEfn6HeuRZvmsds
 SkKW7yHy4rUhMkVOa+AuNVGVfFCB37L2fmzMJhYeDkthNcIUUnaB8qCfydhy746A+qBKzX
 Jf9XJO3ct7cvHrFmljfDaWl4QRnhmy0=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D25ECAD20;
 Thu, 18 Mar 2021 13:10:03 +0000 (UTC)
To: ltp@lists.linux.it
Date: Thu, 18 Mar 2021 13:09:30 +0000
Message-Id: <20210318130935.28528-3-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210318130935.28528-1-rpalethorpe@suse.com>
References: <20210318130935.28528-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/7] fzsync: Reset delay bias
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
2.30.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
