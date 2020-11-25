Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2DB2C3D47
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Nov 2020 11:10:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 417023C5E31
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Nov 2020 11:10:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 7E18B3C223E
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 11:10:20 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 2709F600A13
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 11:10:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1606299019; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=kY8+4Kgu+FBtWf0XiKQC0v5OmDa3chnLuBEhs44En8E=;
 b=D2dvTNoaZPx1nPm0S8oA7Mdv/3omDOeBdIGHRHRqJGYoVEehXAig0TIgSICjvcFrguOZwC
 vOCabyZJ696KaZ7TdSvhXAKcWeJH/P6DXKOiASb9lRkJUqjP7oDtFGrZJZFVUWVNwaigoF
 ZDGRBcT0L2qcLkhGcti9RuLhSim1WOY=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8935AAEFB;
 Wed, 25 Nov 2020 10:10:19 +0000 (UTC)
To: ltp@lists.linux.it
Date: Wed, 25 Nov 2020 10:09:10 +0000
Message-Id: <20201125100910.25617-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] Annotate tst_brk with noreturn
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

Prevents compiler warnings when tst_brk is placed at the end of a
non-void function's control flow. Indeed tst_brk never returns control
to the caller.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 include/tst_test.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/tst_test.h b/include/tst_test.h
index c91d3f18a..b49243e4b 100644
--- a/include/tst_test.h
+++ b/include/tst_test.h
@@ -70,7 +70,7 @@ void tst_resm_hexd_(const char *file, const int lineno, int ttype,
  */
 void tst_brk_(const char *file, const int lineno, int ttype,
               const char *fmt, ...)
-              __attribute__ ((format (printf, 4, 5)));
+              __attribute__ ((format (printf, 4, 5))) LTP_ATTRIBUTE_NORETURN;
 
 #define tst_brk(ttype, arg_fmt, ...)						\
 	({									\
-- 
2.29.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
