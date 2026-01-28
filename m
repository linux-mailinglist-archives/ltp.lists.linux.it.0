Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDStGz5YeWldwgEAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jan 2026 01:28:46 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D51319BA63
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jan 2026 01:28:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1769560125; h=to : date :
 message-id : mime-version : subject : list-id : list-unsubscribe :
 list-archive : list-post : list-help : list-subscribe : from :
 reply-to : content-type : content-transfer-encoding : sender : from;
 bh=FE3fjCINtxmb6nFGZP9FOvEnzVVaG029g6DUcuZYMKg=;
 b=hlUC4pj+diSHUNWimKeX5NMqJRu+8CgwTs5hv2ksvAXf6vc+azCWxCgyyfpqadB1kk629
 KA6Pbwp9oPu9Guthzurg78iIEMGOOlw8CesO0emKrxdA1nBqHEtEDEqUEFis/NQ4glbODky
 Fwgo3HUMXX52BBd1LC+fgLHAFDkPotU=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 41EB63CA066
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jan 2026 01:28:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5CC6E3C58A1
 for <ltp@lists.linux.it>; Wed, 28 Jan 2026 01:28:33 +0100 (CET)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id F0EC71A00607
 for <ltp@lists.linux.it>; Wed, 28 Jan 2026 01:28:31 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4801c2fae63so49296335e9.2
 for <ltp@lists.linux.it>; Tue, 27 Jan 2026 16:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1769560111; x=1770164911; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bDGgDaLA3kgaRPn/fgo3nqqFBTPQ3w54cFAAIfZZWiE=;
 b=bIqWbaWRDv4TNVaGn1xilLjUfuVb+SBv/d6PK4li0XAwqvZHmgcxVsMIWjFNnVqK77
 bHTvkQgWHAFAaOE1k1Cg4JaVHv6HyhLMSCjSibuucxXG60odQhBbP+EP2+0Xki3tQ5wD
 KGEqs4bBWi3rgVSQdjOe+2pXpCcwL2rTf4pshzq3smlbmT4uo8VEa1GDaoVpdutxQgHl
 cET4fxyeOeuuhYgqC2Er5t5TkyecY9nGKQfTQvv4A2ZriNjx7kufH9bc6lUmzzhXjOFm
 VCMRbPvSxaqnciYPEQlL7lQrjsTkqsQunCEbpAbtSjhHBEIP8cgjpayTuV/ug+FOWwrj
 eneg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769560111; x=1770164911;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bDGgDaLA3kgaRPn/fgo3nqqFBTPQ3w54cFAAIfZZWiE=;
 b=TETwF48uDWbp4H8jb9X6gmUc1HX3Dh+ZKM45xx9AZCxb+ReL+YEAn4+jbBh8r4yLsP
 rIbD1c2iz7y/XrzRugX+hWOHVtwp/MEkarln7TtxFJx8PQ3T1uok9Sm7rrITikk6nI+U
 KiY6AyE5B1SxmRf+EZplpoDXldwEY4jLB6vw+fMatAsJck0Ekscq74FxWhRcDL3zrPCf
 GFemP9dUeVm2wIVgVadqRVwqBJb1+2SEFClVvvj0HOwgqm3ksYQXPL+SqTMFb4/eoWxp
 0sK/AMKxZyTeysbgf2aE3hXVTiiixvmRJoicgw5CEKXudPlsC48v8FK7+CFcMN5N9RJy
 C45Q==
X-Gm-Message-State: AOJu0YypSjGO8bSvo+YY7eh1K4HmdRcMH2PXOHlZTgVrZy/JX2Fvo2Ng
 T+3cpmgWDFCtiSZQjDMMbuIjAG6BNCTPPh6S8SB5KgjdCVfPigs6BmP0tA83dhoKsZ3sgSwaHNm
 zld8=
X-Gm-Gg: AZuq6aLsZFH8X8heOyRjFt3tyUwtHusS+lhsSSfc9V28t1GMoHS9fbomJwMA7egNG8X
 oi2MQsIgL+VsqttscHN4Fz41EGtCLPTCBs4fz/eBgcu6oePf9od/+VAdL15LNz/dZ70CBIfK67W
 ij5mIss4VnyB/C6XTJQOH8z1/7QDqOf8SGH9qGrCdEO1+YdLhGs9wuN3xHxP679cXyek75o4fJ9
 w0mihi1pZL+pIJHnz2YYhQ+IR3sGlVvnLD6IuZa0UoouPnh/zPgsFjBpJkfJk+5YzyEsRyQ4Idy
 4XV3WwXM93NetwbAEAL3blTayfqCzKkk2187OXxgzdoqzCHvNJHU723GIQ3A8mZs2DxsVdkI14R
 mt5q28IX9b7mcIibKWiOdYsdzluXfHM736jAPWw+4gZJQx5rxIfWcLNnVtfxYTDAMwU1ohX6tTn
 g=
X-Received: by 2002:a05:600c:a08c:b0:47e:f481:24b7 with SMTP id
 5b1f17b1804b1-48069c480camr44087275e9.17.1769560111054; 
 Tue, 27 Jan 2026 16:28:31 -0800 (PST)
Received: from localhost ([2a07:de40:b240:0:2ad6:ed42:2ad6:ed42])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4806d98c8desm16386975e9.3.2026.01.27.16.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 16:28:30 -0800 (PST)
To: ltp@lists.linux.it
Date: Wed, 28 Jan 2026 00:28:24 +0000
Message-ID: <20260128002828.424-1-wegao@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v1] mseal02: Handle multiple errnos for 32-bit compat
 mode
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
From: Wei Gao via ltp <ltp@lists.linux.it>
Reply-To: Wei Gao <wegao@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_EQ_FROM(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[wegao@suse.com];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: D51319BA63
X-Rspamd-Action: no action

In 32-bit compat mode, the overflow_size (calculated using a 32-bit ULONG_MAX)
does not cause a 64-bit integer wrap-around when added to the start address.
Consequently, the kernel see valid range that points to unmapped space, returning
ENOMEM instead of the expected EINVAL.

Signed-off-by: Wei Gao <wegao@suse.com>
---
 testcases/kernel/syscalls/mseal/mseal02.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/testcases/kernel/syscalls/mseal/mseal02.c b/testcases/kernel/syscalls/mseal/mseal02.c
index e11d7dbf4..d941f6c40 100644
--- a/testcases/kernel/syscalls/mseal/mseal02.c
+++ b/testcases/kernel/syscalls/mseal/mseal02.c
@@ -21,6 +21,8 @@
 #include "tst_test.h"
 #include "lapi/syscalls.h"
 
+#define MAX_ERRNOS 5
+
 static void *start_addr, *unaligned_start_addr, *unallocated_start_addr, *unallocated_end_addr;
 static size_t page_size, twopages_size, fourpages_size, overflow_size;
 
@@ -28,22 +30,22 @@ static struct tcase {
 	void **addr;
 	size_t *len;
 	unsigned long flags;
-	int exp_err;
+	int exp_errs[MAX_ERRNOS];
 } tcases[] = {
-	{&start_addr, &page_size, ULONG_MAX, EINVAL},
-	{&unaligned_start_addr, &page_size, 0, EINVAL},
-	{&start_addr, &overflow_size, 0, EINVAL},
-	{&unallocated_start_addr, &twopages_size, 0, ENOMEM},
-	{&unallocated_end_addr, &twopages_size, 0, ENOMEM},
-	{&start_addr, &fourpages_size, 0, ENOMEM},
+	{&start_addr, &page_size, ULONG_MAX, {EINVAL}},
+	{&unaligned_start_addr, &page_size, 0, {EINVAL}},
+	{&start_addr, &overflow_size, 0, {EINVAL, ENOMEM}},
+	{&unallocated_start_addr, &twopages_size, 0, {ENOMEM}},
+	{&unallocated_end_addr, &twopages_size, 0, {ENOMEM}},
+	{&start_addr, &fourpages_size, 0, {ENOMEM}},
 };
 
 static void run(unsigned int n)
 {
 	struct tcase *tc = &tcases[n];
 
-	TST_EXP_FAIL(tst_syscall(__NR_mseal, *tc->addr, *tc->len, tc->flags), tc->exp_err,
-		"mseal(%p, %lu, %lu)", *tc->addr, *tc->len, tc->flags);
+	TST_EXP_FAIL2_ARR(tst_syscall(__NR_mseal, *tc->addr, *tc->len, tc->flags),
+		tc->exp_errs, MAX_ERRNOS, "mseal(%p, %lu, %lu)", *tc->addr, *tc->len, tc->flags);
 }
 
 static void setup(void)
-- 
2.52.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
