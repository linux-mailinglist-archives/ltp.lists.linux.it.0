Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D029A341815
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 10:19:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 79EE03C6023
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 10:19:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 56C223C5FAC
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 10:19:15 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 22318200967
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 10:19:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1616145554; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vBp2OY65Nm8EVwQMwH5cS1ct0nRVIFZGG1Mov/zWHPw=;
 b=FAtgyVzBABuuIPs6K66GYi7X1v5mjuE9p1pIHqk6iP8PSt4oBbASpa/a5S000aT6c7KIPn
 9WYCNgVgNkmvhpmWhUfOmaBKhtgKjxKFoChl4dN5ThZKrFPOsMxd6Dj24ELguWYs+T+m3Z
 6BpUFRikTFNRvZ4xQlqVcGrtTndl8m0=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C20EAAC1D;
 Fri, 19 Mar 2021 09:19:14 +0000 (UTC)
To: ltp@lists.linux.it
Date: Fri, 19 Mar 2021 09:18:32 +0000
Message-Id: <20210319091837.27319-3-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210319091837.27319-1-rpalethorpe@suse.com>
References: <20210319091837.27319-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v3 2/7] fzsync: Reset delay bias
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
