Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 392593736DA
	for <lists+linux-ltp@lfdr.de>; Wed,  5 May 2021 11:16:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 27DE63C5795
	for <lists+linux-ltp@lfdr.de>; Wed,  5 May 2021 11:16:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7A93E3C56FC
 for <ltp@lists.linux.it>; Wed,  5 May 2021 11:16:30 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0701B2001B3
 for <ltp@lists.linux.it>; Wed,  5 May 2021 11:16:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1620206189; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ybJFQt0CjfXD+J3Nq8Xp7z5noKxcmbPonX/7+PtI9qI=;
 b=R3k8zdk7nQyejqseCd38bAsgiHPNBFDojANl0vpXJWoLq3qe1uK7hqB6fjfTmdJ805nq2Q
 /4tlbLbQSPkol0c6YOFYiEQW3ixgwznO6vNVVNtQ5sO3RhNKQgH4pXl+bZuQifCCgz+S9/
 L7s96iMkqI2H9r5NqP2NpXZVIz0FNjQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A7888B158;
 Wed,  5 May 2021 09:16:29 +0000 (UTC)
To: ltp@lists.linux.it
Date: Wed,  5 May 2021 10:16:20 +0100
Message-Id: <20210505091623.29121-2-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505091623.29121-1-rpalethorpe@suse.com>
References: <20210505091623.29121-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v3 1/4] lapi/bpf: Add /= and %=
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

Add div and mod instructions.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 include/lapi/bpf.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/lapi/bpf.h b/include/lapi/bpf.h
index f27a92146..5ae25293b 100644
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
 
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
