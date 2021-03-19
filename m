Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 19947341819
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 10:19:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BAD343C5FAC
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 10:19:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 228F53C5FAC
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 10:19:15 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 7517D600845
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 10:19:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1616145555; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XrTeGK8ZLzqi5+sLsj6JgeWOwCTK7rplfbNCCgZzmEc=;
 b=TIzGTXIxjhhsEj2U4/++Egtz1uge2nzhZmFVo05PNY9YLuou/4cMwrNPuepe3rxge/KjEW
 rz+BoUbvUQFoMpNdE92pwVGzeptR/9Whi1iwtGowCEmyvsiecZSX9xQT7cjNfpZg3OZhZt
 4yqymRMoyNO6wyMI7Kvzmfs5aY28qI4=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1531EAE05;
 Fri, 19 Mar 2021 09:19:15 +0000 (UTC)
To: ltp@lists.linux.it
Date: Fri, 19 Mar 2021 09:18:33 +0000
Message-Id: <20210319091837.27319-4-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210319091837.27319-1-rpalethorpe@suse.com>
References: <20210319091837.27319-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v3 3/7] fzsync: Correctly print positive lower delay
 range bound
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

If the magnitude of delay_bias is large enough then it can turn the
lower bound positive.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 include/tst_fuzzy_sync.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/tst_fuzzy_sync.h b/include/tst_fuzzy_sync.h
index b8841d96d..4063e95cb 100644
--- a/include/tst_fuzzy_sync.h
+++ b/include/tst_fuzzy_sync.h
@@ -518,9 +518,9 @@ static void tst_fzsync_pair_update(struct tst_fzsync_pair *pair)
 			tst_res(TINFO,
 				"Reached deviation ratios < %.2f, introducing randomness",
 				pair->max_dev_ratio);
-			tst_res(TINFO, "Delay range is [-%d, %d]",
-				(int)(pair->diff_sb.avg / per_spin_time) + pair->delay_bias,
-				(int)(pair->diff_sa.avg / per_spin_time) - pair->delay_bias);
+			tst_res(TINFO, "Delay range is [%d, %d]",
+				-(int)(pair->diff_sb.avg / per_spin_time) + pair->delay_bias,
+				(int)(pair->diff_sa.avg / per_spin_time) + pair->delay_bias);
 			tst_fzsync_pair_info(pair);
 			pair->sampling = -1;
 		}
-- 
2.30.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
