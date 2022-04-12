Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4E34FDCD2
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Apr 2022 13:06:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 575843CA544
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Apr 2022 13:06:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BFC403CA54D
 for <ltp@lists.linux.it>; Tue, 12 Apr 2022 13:06:45 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 0A39A1A00247
 for <ltp@lists.linux.it>; Tue, 12 Apr 2022 13:06:44 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 48BFD210ED;
 Tue, 12 Apr 2022 11:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1649761604; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VyAQXIjkDqah1VcM50CWM5rnLRrC1EgsdsiSAvnB3Pk=;
 b=ez9fp+0pbXoWV5guuzbeMejuqvzNXyyjGlBmY949GLxOPdZFMUQ7jwsSfD89jTwBB9xOyR
 4aqt9Y/QucrfxcEy9uwyDow1oeU63spJQrLC1ohLqvfX/dnKXH/oF98Kzug2dUDduOO9WX
 A/Vd6IwjKATkJw8pWZUgYvDM6BpnO5c=
Received: from g78.suse.de (unknown [10.163.24.182])
 by relay2.suse.de (Postfix) with ESMTP id 10AFAA3B89;
 Tue, 12 Apr 2022 11:06:44 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue, 12 Apr 2022 12:06:31 +0100
Message-Id: <20220412110631.13865-2-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412110631.13865-1-rpalethorpe@suse.com>
References: <20220412110631.13865-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] tools/sparse: Allow null pointer subtraction
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

Used for the offsetof trick. Technically it is undefined behavior. A
patch to Sparse is waiting upstream:

https://lore.kernel.org/linux-sparse/20220321112119.23308-1-rpalethorpe@suse.com/T/#u

In the meantime we can disable the warning to make it compile.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 tools/sparse/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/sparse/Makefile b/tools/sparse/Makefile
index 4247dd86e..d35c9cabf 100644
--- a/tools/sparse/Makefile
+++ b/tools/sparse/Makefile
@@ -20,7 +20,7 @@ $(SPARSE_SRC)/libsparse.a: $(SPARSE_SRC)/Makefile
 
 HOST_MAKE_TARGETS	:= sparse-ltp
 MAKE_DEPS		+= $(SPARSE_SRC)/libsparse.a
-HOST_CFLAGS		+= -I$(SPARSE_SRC) -Werror
+HOST_CFLAGS		+= -I$(SPARSE_SRC) -Werror -Wno-null-pointer-subtraction
 HOST_LDLIBS		+= $(SPARSE_SRC)/libsparse.a
 
 
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
