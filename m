Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qID8JW6ipWngCwAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Mon, 02 Mar 2026 15:45:02 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 116741DB193
	for <lists+linux-ltp@lfdr.de>; Mon, 02 Mar 2026 15:45:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7767B3CD7C6
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Mar 2026 15:45:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 478103C3256
 for <ltp@lists.linux.it>; Mon,  2 Mar 2026 15:44:49 +0100 (CET)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 1DA9A1400055
 for <ltp@lists.linux.it>; Mon,  2 Mar 2026 15:44:49 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-65f8c8c3a4aso8439013a12.2
 for <ltp@lists.linux.it>; Mon, 02 Mar 2026 06:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772462688; x=1773067488; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=edDqIejgVq7OM2THS5CTwd/eoUBsnTqdxlCt46x+bfE=;
 b=KF4All5a0M2O1PRjaiT/zwVnj8OhslXkv7pjh0GB66Dm6Ug6Y2p9AeWgS2ucoGnVjL
 ULzlKLkfxr09MdS/w/LaAPPswyUAjETw0XU9sal1jbAzM/H/YDXO98YoL8GvK0fwsBk8
 J3Fg2amcVp5h7sop9XDsb6xkT0Tm562NAVLFvUhoFEdkTGYXRNcBYP5z/Ee5I5UzlezM
 /E/fSyBmEeOCkdaImLfPCDSkhJt8khKrdIdxgQz8p+5OJV/MNF8qO8x8N7X35zqoM+Pd
 0TN7UOUWxPmyff3ngnhuZN+I4NVX6Zrptva+A+NDVhar29z+vC7KW1rCvodIDH8ep1A6
 bh/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772462688; x=1773067488;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=edDqIejgVq7OM2THS5CTwd/eoUBsnTqdxlCt46x+bfE=;
 b=Nqs6v+l3yxWh2NwndhPBRLEBNWbj3iq0GR5VQ3TqxR+stuV/9BpW9a8CO8NlJ0vkK3
 ysqYDLaYBv1yBZxznIOlJOEFwhqpN213d6B9yv2DXXcVZqGrU6pjopYTNPnGSbwi80OM
 g1aYy2qP9Wqz30RC9o8N0bf1AqqtT+tlz2ooDFQoO+uaSv6o/IAmnb8YVSrdbRrytDrF
 Yp/8XTJAR09gUI45ByuxrhKHCddFHa1xNjZIsojyI9vsMe4RlaEb27SyEKAZxzBNdyct
 Y5A/qeFSR+ovm0ydCRtNQEzY5I+P3RVTCl93QiGxixMItVN0pZlx+PZLH2L7iR31YTN1
 z/mA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3eYEArrpIhsikIIYq+5mkEFs0YdSskZrGRm5F2UAKewW8/oII085u7hda0AhC0t+948E=@lists.linux.it
X-Gm-Message-State: AOJu0YyUy6TyT/Z/1+CZ8rLJuTm2hn9dp9ZM3maqMBq2YYDDMitgWGv2
 zDGAKN7mnLpTpsk+svyx2uftM4U5GhBxPcKVD/CQq8su1cropEgly28w
X-Gm-Gg: ATEYQzyjGJr+Y4eRzwGpRatFFSLdXEIeQ7Bu4s0oC2YeOhsHgN44YPXhwyKAongumh1
 Z7qPcV5nwnkZVvYW2OpubUA7lKZhoT20vugCM9B9tJ5uZ8fkOoe9j9jZWtJdyNzoOGslk9VKl8u
 Cu/4vKSTtAHqYuh+wGKqA8NoLCi/DTnX/Swr/ljdsqvopAGPZm/EGImvFMfLuRPprKiMPDEjqLu
 cx1LtztWQuitgo8vQ4YwHZbSdtFUowh9ej65adl60XI0ezvb7Wj6Qd5rG2YJJCTY2K+Xft2Dn4u
 NHXZb9GuX15JuJ38OaDlbs1Y30hguWC/TwDsmGkDdpZHohU5neIXj0NIVcVJEZIkIQsirmrrodv
 VVVjKGs6kAjW3XFcopxalrDYMVBQmYfmKx/FQTpcxHt18uiP+H/FkhvBvfBOjwukSXdU6ThCB3e
 lKP+WCfgQsCkLVUdSxzKfFyq6u2gSzoS1/1ogz6FsPB6IqpKDYx8m8q/7FL8CRf3adx9houCVJa
 VpI4BEFFHGUOEm8Vd0xY72neK0=
X-Received: by 2002:a17:907:8e96:b0:b8d:bfb9:aefc with SMTP id
 a640c23a62f3a-b937637a5cdmr751005166b.11.1772462688198; 
 Mon, 02 Mar 2026 06:44:48 -0800 (PST)
Received: from localhost
 (2001-1c00-570d-ee00-11a2-6710-0774-33c0.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:570d:ee00:11a2:6710:774:33c0])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b935ac704b0sm474969366b.22.2026.03.02.06.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 06:44:47 -0800 (PST)
From: Amir Goldstein <amir73il@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Mon,  2 Mar 2026 15:44:46 +0100
Message-ID: <20260302144446.1291724-1-amir73il@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] fanotify25: fix test failure on kernel with
 CONFIG_MODULES=n
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
Cc: ltp@lists.linux.it, Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Queue-Id: 116741DB193
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[amir73il@gmail.com,ltp-bounces@lists.linux.it];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url]
X-Rspamd-Action: no action

On a kernel built without modules loading support the test fails:
fanotify25.c:61: TBROK: write(4,0x55a523b99160,31) failed: EINVAL (22)

Use another symbol which is less likely to be missing.

Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 testcases/kernel/syscalls/fanotify/fanotify25.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify25.c b/testcases/kernel/syscalls/fanotify/fanotify25.c
index c982f3225..9b03fd9ab 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify25.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify25.c
@@ -24,10 +24,10 @@ static const struct traceconfig {
 	const char *filename;
 	const char *wdata;
 } trace_cmds[] = {
-	{EVENTS_SYSFILE, "p:ltp_load_module_0 load_module"},
-	{MNTPOINT "/events/kprobes/ltp_load_module_0/enable", "1"},
-	{MNTPOINT "/events/kprobes/ltp_load_module_0/enable", "0"},
-	{EVENTS_SYSFILE, "-:ltp_load_module_0"},
+	{EVENTS_SYSFILE, "p:ltp_load_script_0 load_script"},
+	{MNTPOINT "/events/kprobes/ltp_load_script_0/enable", "1"},
+	{MNTPOINT "/events/kprobes/ltp_load_script_0/enable", "0"},
+	{EVENTS_SYSFILE, "-:ltp_load_script_0"},
 	{}
 };
 
-- 
2.53.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
