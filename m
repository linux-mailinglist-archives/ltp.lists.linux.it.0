Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPY0LDCvn2kAdQQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Feb 2026 03:25:52 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B971A0152
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Feb 2026 03:25:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1772072751; h=to : date :
 message-id : in-reply-to : references : mime-version : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=OQWzNUljFFASn8rZNNzoo0hmnAkjbDOhNKSWyOxAK7o=;
 b=FI7gLZpA/P2jmz/M+OCueAvh+QThqa5oJM4NPEMp7cViWm8rR1ftTl9UgWiD0G4d6QAd0
 UH9eaq7jeFY/GGpmbWiVqN3qD22Jlfcfht8MjMVXvDsv0AQY54Qdspw4JXYIg/uBqlduFMQ
 nztTkUOqWucJfEX9YbCplCDNxglR7JI=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 649523CB44A
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Feb 2026 03:25:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 077743C7831
 for <ltp@lists.linux.it>; Thu, 26 Feb 2026 03:25:39 +0100 (CET)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3ABB0200269
 for <ltp@lists.linux.it>; Thu, 26 Feb 2026 03:25:39 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4806f3fc50bso4172955e9.0
 for <ltp@lists.linux.it>; Wed, 25 Feb 2026 18:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1772072738; x=1772677538; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LlZe5ddiaJqrPXg5sZOa7Zt0NVjMttHmjQFiYSS3elw=;
 b=YYZaRLt7pgcn1Bie+E7puHT7tZJhXg7k0rHlmzWvJzsfKwUdoVnnc13sKrbJDnPmZ/
 H8LwZrc+253+bvLjHUE933sb2t6+e+WkvpIEiFFGznhDXpSb8FwXaSLGxFh5uTHw1JhB
 kXGorGBOw4WSKz2+6Vo76KNHWIQBoNZa2IQOqUFMjfw540+vb+f7I3gGan8nMUof7l9Z
 9BOtydvtR4i0DJooqgbkHe92c5k76+Hp5qjcWf3farCeICXcRoOBD6+vVtlgD8/TafCs
 nbYDjYuvimJLQvpJZEmn5IfWc/Ax9W7idkg06OjrArntjAThT7WW2mI9PZStDvu2i8PY
 pdag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772072738; x=1772677538;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LlZe5ddiaJqrPXg5sZOa7Zt0NVjMttHmjQFiYSS3elw=;
 b=Et6BvZouNV78y+zsMtVJeTadEyqj9GXvZdupeJFeVchSrhKOKBIE19QY2/vNW2mOxR
 NwCO4StwLORqem3TIoBTAJLHJreeXaXhZtmubTsVht34HBMlu7fORgqyBAqm0wDJU770
 ywlXpwoOYxc1fp7SkUYC6iJ2hTNFQdbJViK3pAvzcdOBKgdpP+rHbefSeyrdDMbG4Ou5
 o4tsyRzR45lRo4oWjbc/MYudIAhwOU0kwzLROlTfluMSbjPpMSNrIn7gZqxxbsiqbPnW
 U4n42YExAlq21uUWjpioKfcNgGWXNob2wSqq5gFReqplzQTxcxXh4W72YFgFcqc7J6iU
 9MeQ==
X-Gm-Message-State: AOJu0YzczaHkLSyVdrz3QvIYiJ7KMNb9avuT/UiY9KRS910lydAFIINB
 KxssEJ1jtnHVeN8aiaFpg15IGKpz+oYBhVXq2FhrMekpMRUdTjMQ0uHpf2t45sur4Mdt2GglZWi
 gL1s=
X-Gm-Gg: ATEYQzxoGb2tb9jMTLUxfiUY8GjJXRxWn/zh/7y5CzFh7sa9mwysrAYbEtBFNFAQJsF
 6l3/Fgj0+5wGPWZnV2Ug9ufYmAOdrWfFS99S7LdUnB3uMYd//wqSDwwjBiNbFI4AxoWuxwtiIWN
 FNws16ESbdinblKm4Wbh2Z7EjmEPM/Q9Tz0ha45Hlb6mCPzgE38ovnAJHA4oKNrI4uviHXuUaki
 Ssi9IG70xFsWRXqlBifb/pw1WknG/t8yiDf65dbH0HEOvqLhpTcu68K6geEuKJkq6RV1ZosYvok
 BEveNvz6pFFvQtRkLkGvseEbjrGoKrKdA9Qi7a736HWMZEf+4ux+WUmlDi0+1Ns0ZSSWkbHPxdL
 ioxYonokkcEx1xtFZu2pVwbIlYLYCafrzfAE43sbOPOkG8Op9KvfciNOJIwQHkJt8u+HA6+YnWN
 vubuYdZJ88nJc=
X-Received: by 2002:a05:600c:3b89:b0:483:7432:a761 with SMTP id
 5b1f17b1804b1-483c21a11dcmr46881395e9.24.1772072738279; 
 Wed, 25 Feb 2026 18:25:38 -0800 (PST)
Received: from localhost ([2a07:de40:b240:0:2ad6:ed42:2ad6:ed42])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-483bd68826asm170589925e9.0.2026.02.25.18.25.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 18:25:37 -0800 (PST)
To: ltp@lists.linux.it
Date: Thu, 26 Feb 2026 02:25:25 +0000
Message-ID: <20260226022536.20175-1-wegao@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128002828.424-1-wegao@suse.com>
References: <20260128002828.424-1-wegao@suse.com>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2] mseal02: Handle multiple errnos for 32-bit compat
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
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TO_EQ_FROM(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	TAGGED_RCPT(0.00)[linux-ltp];
	HAS_REPLYTO(0.00)[wegao@suse.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,lists.linux.it:dkim]
X-Rspamd-Queue-Id: 40B971A0152
X-Rspamd-Action: no action

In 32-bit compat mode, the overflow_size (calculated using a 32-bit ULONG_MAX)
does not cause a 64-bit integer wrap-around when added to the start address.
Consequently, the kernel see valid range that points to unmapped space, returning
ENOMEM instead of the expected EINVAL.

Signed-off-by: Wei Gao <wegao@suse.com>
---
 testcases/kernel/syscalls/mseal/mseal02.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/testcases/kernel/syscalls/mseal/mseal02.c b/testcases/kernel/syscalls/mseal/mseal02.c
index e11d7dbf4..7e0172bc3 100644
--- a/testcases/kernel/syscalls/mseal/mseal02.c
+++ b/testcases/kernel/syscalls/mseal/mseal02.c
@@ -58,6 +58,9 @@ static void setup(void)
 	SAFE_MUNMAP(start_addr + twopages_size, page_size);
 	unallocated_start_addr = start_addr + twopages_size;
 	unallocated_end_addr = start_addr + page_size;
+
+	if (tst_is_compat_mode())
+		tcases[2].exp_err = ENOMEM;
 }
 
 static void cleanup(void)
-- 
2.52.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
