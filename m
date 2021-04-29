Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8DD36ECF6
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Apr 2021 17:05:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ED8423C61B5
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Apr 2021 17:05:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 17DDE3C58A8
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 17:05:19 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 8072C1400E64
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 17:05:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1619708718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VfGWDHLNbk5VFzJZbluj2FXjO0oIaxhEYBD3BY5dvzk=;
 b=BzRBi6oL1ViBr9INsJi/5VluK1S1W3yVt3sHG2I7VzyMsVEwi/0i9+/liY9H+/8H32XGvS
 VSwWpRdj+EH949zJkStk7sYnS6ubZanWMe7fSvjvcODtoAEjdtcqT1iyQT8hsfqirfZoWq
 GyQKPQKyQNlWgQdUTbJC8kfEpOALaRE=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DA38DB174;
 Thu, 29 Apr 2021 15:05:18 +0000 (UTC)
To: ltp@lists.linux.it
Date: Thu, 29 Apr 2021 16:05:06 +0100
Message-Id: <20210429150510.21585-2-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429150510.21585-1-rpalethorpe@suse.com>
References: <20210429150510.21585-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/5] lapi/bpf: Add /=, %= and BPF_MAXINSNS
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

Add div and mod instructions and the max program size.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 include/lapi/bpf.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/lapi/bpf.h b/include/lapi/bpf.h
index f27a92146..0a25edb73 100644
--- a/include/lapi/bpf.h
+++ b/include/lapi/bpf.h
@@ -37,8 +37,10 @@
 #define BPF_OP(code)    ((code) & 0xf0)
 #define		BPF_ADD		0x00
 #define		BPF_SUB		0x10
+#define		BPF_DIV		0x30
 #define		BPF_LSH		0x60
 #define		BPF_RSH		0x70
+#define		BPF_MOD		0x90
 
 #define		BPF_JEQ		0x10
 
@@ -46,6 +48,10 @@
 #define		BPF_K		0x00
 #define		BPF_X		0x08
 
+#ifndef BPF_MAXINSNS
+#define BPF_MAXINSNS 4096
+#endif
+
 #define BPF_ALU64	0x07	/* alu mode in double word width */
 #define BPF_MOV		0xb0	/* mov reg to reg */
 #define BPF_CALL	0x80	/* function call */
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
