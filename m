Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A5438C4A2
	for <lists+linux-ltp@lfdr.de>; Fri, 21 May 2021 12:25:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8EA623C5745
	for <lists+linux-ltp@lfdr.de>; Fri, 21 May 2021 12:25:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AB5333C3026
 for <ltp@lists.linux.it>; Fri, 21 May 2021 12:25:42 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 54677140133B
 for <ltp@lists.linux.it>; Fri, 21 May 2021 12:25:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1621592742; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tEuabypM/jI6lWtPQlMMDUndgZgELkmqHOeKI9yztME=;
 b=meQMcUthFiGJ1JzLgj1I0eqJ2cGNrCEAo6Q95Kf1fewbX6WTf/n8oTV0JyrDIjOiS1OoUN
 MXjH62bnw/2x9aLq5mojJOhv6dRjaJiY6q9Pf0mXXxg3P8eHfcTWstln+txVKRrZK+CNkd
 OBIuPEncXqEh9c6x2DuNneb2ar4n0Pc=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E62A7ABB1;
 Fri, 21 May 2021 10:25:41 +0000 (UTC)
To: ltp@lists.linux.it
Date: Fri, 21 May 2021 11:25:24 +0100
Message-Id: <20210521102528.21102-3-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210521102528.21102-1-rpalethorpe@suse.com>
References: <20210521102528.21102-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/6] API/cgroups: Remove obsolete function in API
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

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 lib/tst_cgroup.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c
index 793a712e1..8fd5ab288 100644
--- a/lib/tst_cgroup.c
+++ b/lib/tst_cgroup.c
@@ -225,12 +225,6 @@ static void add_ctrl(uint32_t *const ctrl_field,
 	*ctrl_field |= 1 << ctrl->ctrl_indx;
 }
 
-__attribute__ ((warn_unused_result))
-struct cgroup_root *tst_cgroup_root_get(void)
-{
-	return roots[0].ver ? roots : roots + 1;
-}
-
 static int cgroup_v2_mounted(void)
 {
 	return !!roots[0].ver;
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
