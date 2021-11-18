Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6324566B0
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Nov 2021 00:57:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 90E9B3C891C
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Nov 2021 00:57:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D18693C0930
 for <ltp@lists.linux.it>; Fri, 19 Nov 2021 00:57:57 +0100 (CET)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4753B1000D3D
 for <ltp@lists.linux.it>; Fri, 19 Nov 2021 00:57:56 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 40C031F4709C
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637279876; bh=NcVyMlBPKgXYpOVhQDPfsPDkKy9i3A0eWmNha6N06ig=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QZNaO+bKd35Q5w0KbNyDPh2TvukDLxZrrGWMq1S37lT71mhCeiKwONECH0u7/srdn
 6RdirCmTD4VNg47Z486ATCPZlmQy45Q0TeUZy3TQG6f/s6fMUoySY+4o7amINIyN1E
 1r7IcAZBGVN5NqIXr7trgObPNoN07mfhHG4FWGg5pnF1uPZkIW2IE32mTNBwQhShwj
 8yC5QjY6drgVV1pUmlwfgdvmzV3uGBLyr2W+W3jrhQ3WtRq64SWZKpx/vNImAFvdA4
 lK4nufJnKO5B8o159CzsvYExO9Ga9IqtX34EZKf6S6p5L87luntIc+dacYMD06OVh1
 4wdFpQOLTfb+A==
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: pvorel@suse.cz,
	jack@suse.com,
	amir73il@gmail.com,
	repnop@google.com
Date: Thu, 18 Nov 2021 18:57:36 -0500
Message-Id: <20211118235744.802584-2-krisman@collabora.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211118235744.802584-1-krisman@collabora.com>
References: <20211118235744.802584-1-krisman@collabora.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v4 1/9] syscalls: fanotify: Add macro to require
 specific mark types
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
Cc: Gabriel Krisman Bertazi <krisman@collabora.com>, linux-ext4@vger.kernel.org,
 kernel@collabora.com, ltp@lists.linux.it, khazhy@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Like done for init flags and event types, and a macro to require a
specific mark type.

Reviewed-by: Matthew Bobrowski <repnop@google.com>
Reviewed-by: Amir Goldstein <amir73il@gmail.com>
Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
---
 testcases/kernel/syscalls/fanotify/fanotify.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
index c91162d97a89..b9f430fe0c35 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify.h
+++ b/testcases/kernel/syscalls/fanotify/fanotify.h
@@ -399,4 +399,9 @@ static inline int fanotify_mark_supported_by_kernel(uint64_t flag)
 	return rval;
 }
 
+#define REQUIRE_MARK_TYPE_SUPPORTED_BY_KERNEL(mark_type) do { \
+	fanotify_init_flags_err_msg(#mark_type, __FILE__, __LINE__, tst_brk_, \
+				    fanotify_mark_supported_by_kernel(mark_type)); \
+} while (0)
+
 #endif /* __FANOTIFY_H__ */
-- 
2.33.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
