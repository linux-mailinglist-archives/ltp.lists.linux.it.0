Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FDAB55C12
	for <lists+linux-ltp@lfdr.de>; Sat, 13 Sep 2025 02:58:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D5F933CB9B8
	for <lists+linux-ltp@lfdr.de>; Sat, 13 Sep 2025 02:58:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 508963C9AC9
 for <ltp@lists.linux.it>; Sat, 13 Sep 2025 02:58:20 +0200 (CEST)
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 915341A004EE
 for <ltp@lists.linux.it>; Sat, 13 Sep 2025 02:58:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=naotchy.com;
 s=protonmail; t=1757725097; x=1757984297;
 bh=6DuzGqZEjPsXLH36TQ2TgL1n2hffJa8BEgkjQYiv+nE=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=mMbjhFRaHvaQZyW4Ey8DiAsx252xtbasC/D5BrFvlEoH+FUxv/m7LIuis3Agf/gzi
 dHvQUgAi1cyyEW3/2jEvSXWzkMgu02CZfp0lX+Gfmlcf/y1SDPxGebrBUa8xKsKH/3
 +Yi9EAwVWVUSzaZmZSCXCj74DLF56bEn4dAaVx5YiI19iFAUs7ZrPMtAnS6ZLG+F7N
 YLYfd+ICAv8LcN8pl0pGozmwSZplIux3sC2YnlXeGGDDl1aYAjfxoss33d5xPNuyh9
 g3DV04c/NgPIK62EyI/c/t+HQHUakROBGovPVTXVvzNRYYBDMVnVzntHIy5KIK2v0u
 XBtCess5TTrng==
Date: Sat, 13 Sep 2025 00:58:09 +0000
To: ltp@lists.linux.it
From: Jack Morgan <jmorgan@naotchy.com>
Message-ID: <20250913005759.2946000-1-jmorgan@naotchy.com>
Feedback-ID: 96944049:user:proton
X-Pm-Message-ID: 4844c25a2f88f7fd180d2ef9f32362214409d900
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 1/2] statmount.h: add check for STATMOUNT_MNT_NS_ID
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Enable mnt_ns_id check for kenels that support it
It's can be deinfed as envornment variable with
LTP_HAVE_STATMOUNT_MNT_NS_ID.

Fixes: #1260

Signed-off-by: Jack Morgan <jmorgan@naotchy.com>
---
 testcases/kernel/syscalls/statmount/statmount.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/testcases/kernel/syscalls/statmount/statmount.h b/testcases/kernel/syscalls/statmount/statmount.h
index d21d7f8da..b1696515d 100644
--- a/testcases/kernel/syscalls/statmount/statmount.h
+++ b/testcases/kernel/syscalls/statmount/statmount.h
@@ -13,6 +13,11 @@
 #include "lapi/syscalls.h"
 #include "tst_safe_stdio.h"

+/* Enable mnt_ns_id check when system struct statmount is not defined. */
+#if !defined(HAVE_STRUCT_STATMOUNT) && !defined(LTP_HAVE_STATMOUNT_MNT_NS_ID)
+#define LTP_HAVE_STATMOUNT_MNT_NS_ID 1
+#endif
+
 static inline int statmount(uint64_t mnt_id, uint64_t mask, struct statmount *buf,
 		     size_t bufsize, unsigned int flags)
 {
--
2.51.0



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
