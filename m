Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C317C2FA553
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Jan 2021 16:58:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 570693C30B3
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Jan 2021 16:58:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 43D9B3C0548
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 16:58:39 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 34DCA1A0089B
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 16:58:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1610985518; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jSiwzG9v12CmlwVWx06gp4Le3pkLYm57ocpNi5Q6huo=;
 b=bgIPlb3I3ni03hC30jrmOTvDkKohhDinmPgMe2nPTvout4JwojhSY0KrDREzYDRJ9Oxjqy
 //UXGu0/3+IYVaTPEwIAHxQ6trxuzzMwxD+GZtF4vatO3r23mVOEAJ4PwgDnBbdf1x1EU2
 rFR9nhwvtnD79m96apOX3sdH4yIfyGU=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 66B95AC6E;
 Mon, 18 Jan 2021 15:58:38 +0000 (UTC)
To: ltp@lists.linux.it
Date: Mon, 18 Jan 2021 15:56:24 +0000
Message-Id: <20210118155628.9248-2-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210118155628.9248-1-rpalethorpe@suse.com>
References: <20210118155628.9248-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/5] API: Add FILE_SCANF to new lib
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
Cc: socketcan-users@lists.berlios.de,
 Oliver Hartkopp <oliver.hartkopp@volkswagen.de>,
 Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 include/tst_safe_file_ops.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/tst_safe_file_ops.h b/include/tst_safe_file_ops.h
index 894c16123..ea8f89263 100644
--- a/include/tst_safe_file_ops.h
+++ b/include/tst_safe_file_ops.h
@@ -7,6 +7,9 @@
 
 #include "safe_file_ops_fn.h"
 
+#define FILE_SCANF(path, fmt, ...) \
+	file_scanf(__FILE__, __LINE__, (path), (fmt), ## __VA_ARGS__)
+
 #define SAFE_FILE_SCANF(path, fmt, ...) \
 	safe_file_scanf(__FILE__, __LINE__, NULL, \
 	                (path), (fmt), ## __VA_ARGS__)
-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
