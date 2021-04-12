Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B3635C944
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Apr 2021 16:55:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 77E2F3C79E4
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Apr 2021 16:55:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 92F413C74F0
 for <ltp@lists.linux.it>; Mon, 12 Apr 2021 16:55:31 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1F8AA600922
 for <ltp@lists.linux.it>; Mon, 12 Apr 2021 16:55:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1618239330; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+X8wH/NM/LTyjPlfFP4OYdK0FSgSnDzyVcoNbKEDpfg=;
 b=OyknwcSklm/F+VqmdNbZA2Q41zaqjsaLunQIImXDLxnJyxn5YG7o7NLax5xm2NEagYS1++
 XxmP1BnEljKrXcIHvcLqN66XJ/BGBOHocnc0CV4qXbziuOV4aN7jbHVgsJPc47QkdQi4dK
 rvkDs7RzRdTQBs/Jx9rAk0UT9PixqNY=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BCD9FB1BC;
 Mon, 12 Apr 2021 14:55:30 +0000 (UTC)
To: ltp@lists.linux.it
Date: Mon, 12 Apr 2021 15:55:01 +0100
Message-Id: <20210412145506.26894-3-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210412145506.26894-1-rpalethorpe@suse.com>
References: <20210412145506.26894-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v3 2/7] API: Add macro for the container_of trick
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
 include/tst_common.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/tst_common.h b/include/tst_common.h
index fd7a900d4..317925d1d 100644
--- a/include/tst_common.h
+++ b/include/tst_common.h
@@ -83,4 +83,9 @@
 #define TST_RES_SUPPORTS_TCONF_TFAIL_TINFO_TPASS_TWARN(condition) \
 	TST_BUILD_BUG_ON(condition)
 
+#define tst_container_of(ptr, type, member) ({		     \
+	const typeof( ((type *)0)->member ) *__mptr = (ptr); \
+	(type *)( (char *)__mptr - offsetof(type,member) );  \
+})
+
 #endif /* TST_COMMON_H__ */
-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
