Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCC4450822
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Nov 2021 16:21:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 278FB3C84F9
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Nov 2021 16:21:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BE48D3C0E98
 for <ltp@lists.linux.it>; Mon, 15 Nov 2021 16:20:58 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 483E7601C55
 for <ltp@lists.linux.it>; Mon, 15 Nov 2021 16:20:58 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 98AC921940;
 Mon, 15 Nov 2021 15:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1636989657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Zu/d/5gXbzwcgsvecdgAxwvlkcuEK3GHfvbT+sJl9iw=;
 b=YBYcxYSuZt80lSyIpNSlrLL+XIS9YxGyqPDClVjuU7UbS9yTgnM7nF5SK+GlrkRpg7L/QU
 xw/BtiIe8K1gI/3SYI+i6xdxueCOtQJExQfPJfQi9cJz6Kt6zBgn3JPtLGPvTM8yYQkq8h
 TzpikXbXJxn7Ez062RvxECxABukt3kg=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 60D6DA3B81;
 Mon, 15 Nov 2021 15:20:57 +0000 (UTC)
To: ltp@lists.linux.it
Date: Mon, 15 Nov 2021 15:20:28 +0000
Message-Id: <20211115152029.22552-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] lib: Cache kernel_bits value
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

This is primarily to avoid printing the uname info two or more
times. Which is increasingly likely with using tst_kernel_bits in
other library functions. Also with features like test variants where
setup may be run multiple times.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 lib/tst_kernel.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/lib/tst_kernel.c b/lib/tst_kernel.c
index c908bb04c..6db85bff0 100644
--- a/lib/tst_kernel.c
+++ b/lib/tst_kernel.c
@@ -37,7 +37,12 @@ static int get_kernel_bits_from_uname(struct utsname *buf)
 int tst_kernel_bits(void)
 {
 	struct utsname buf;
-	int kernel_bits = get_kernel_bits_from_uname(&buf);
+	static int kernel_bits;
+
+	if (kernel_bits)
+		return kernel_bits;
+
+	kernel_bits = get_kernel_bits_from_uname(&buf);
 
 	if (kernel_bits == -1)
 		return -1;
-- 
2.33.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
