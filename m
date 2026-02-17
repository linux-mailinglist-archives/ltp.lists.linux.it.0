Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKC8JrxdlGnODAIAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Feb 2026 13:23:24 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFF114BE59
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Feb 2026 13:23:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2A5343D062F
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Feb 2026 13:23:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 18BDD3CFF11
 for <ltp@lists.linux.it>; Tue, 17 Feb 2026 13:23:11 +0100 (CET)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 98733200763
 for <ltp@lists.linux.it>; Tue, 17 Feb 2026 13:23:11 +0100 (CET)
Received: by mail-pf1-x443.google.com with SMTP id
 d2e1a72fcca58-8230c839409so535402b3a.3
 for <ltp@lists.linux.it>; Tue, 17 Feb 2026 04:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771330990; x=1771935790; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=c4Xrqizvk8U4AKZLrVY18O8agZ1rJ9g7J6AlDTQ391A=;
 b=Bc7RAEovE3UYJeaYMpFff5THsueMn0gjPMKsHS+x79rjUvL8NVdrjyAK8pR51JgCdZ
 ZMKMBdRAG3AzMccDOhpuT7EEkWGo3gRIkjL+Bg2kCGA0EXaCh9iNdg8no3oB9vJvGScu
 3ZtHQkzmOXkCjF6DaUZp/0jemCxFPCw5eM08UznzKBhYDb0QxJYHV5rFu5C6/y1GqLEz
 +1feWq7kVwdHuEnlf+ipWde+/ZCTdCQocCPYUSArtPuAwcQx+rCIiAtiX+/YKdhCecDa
 GmHYxDUc38fFkipQKCjeCFHNmO4Qdo91gUhtusrkk3wpVjnvGj3hcwKgmTCDbDaQLawe
 zbgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771330990; x=1771935790;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=c4Xrqizvk8U4AKZLrVY18O8agZ1rJ9g7J6AlDTQ391A=;
 b=mrhOFY93OwqA1oNk+ra5LYoH7LF1UPaVi5FiMHET3A5PY+rYF83+HrhgolxMVR64mY
 jsxiboLWwpIewVb6xNiZhQWO0RllQeNAex+6Bf6J94JwiezgI1+ffXdISOzgt1hkl8il
 7J0GYcQRVHEJoQMIHhbUQG5ei57ORUO4jaCDOKoncSkJeqHNry9+Yfcxrmh3MlfWYVe8
 QomX5zQcQgkWu6+1uCSPswJNmScxL4d2NkCeWIqC7X9CYKOJ0G7Pnj7cxOFrd/2pYjh8
 4/R+611+QtqWY8hrP8EujORYtNQKpAiG5CjaLGg5IOEO3iKJJ5PJSs1JUJZ0u4KIYqVy
 VvzA==
X-Gm-Message-State: AOJu0Yxs8CPXpdOfBIYEBajAWMY/9nO1dH3C7mrFShiEwrTkN/T9qoy+
 SmCGELXA91t1sDdvXtmzMQXTcJD6ElU9og/CwRui7NBykibMMqnWGdTlLP9RJcy/CA==
X-Gm-Gg: AZuq6aIpJOWfTSxScI5sJjsR+JeVoOuP+mBAmgjKAWEYG/GJ1D9ETGB2IX/KNFt7jFv
 RBIBwZ0w4lmk5Sp4x3FHQJblsBzuAO0zuvtc4i6xgfnzE7h7nMKEltg2M60qWF/Cn1zhkcJplnQ
 P+kgU9P6VkrewnxVuketoWt7o4knc1JryJ90XpunKJvpdsAWNx/Rg38lNDbwfn5Q1l776z+x32C
 HsY0mSy/cQo5MiJ44lvGmmSJAc0lnBQiPA98FoN6iB0m5Hqbp0GVr+w93brvZcJwhidTR2SJeUN
 lKq9vjf4DM8ukGui4/KghxlvGBdrbiIfhB86LN7nF72219m5eGHTnALUE8wiTWk8Jty346g97bL
 6vvRsgKp5Y8hw08rlu7/2ThNyvTKH1sXb/0NoyhV3OCtTErS4ySgKk41tB8S17FtSQZ8qwgfEOI
 ILGq8V9uD57hR+IVZiLv8jIbZQFzSm4PjLUodU3BdGnA==
X-Received: by 2002:a05:6a00:b904:b0:824:374a:140d with SMTP id
 d2e1a72fcca58-824c944908emr12949195b3a.4.1771330989691; 
 Tue, 17 Feb 2026 04:23:09 -0800 (PST)
Received: from localhost.localdomain ([59.16.109.172])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-824c6b6a3edsm13559606b3a.41.2026.02.17.04.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Feb 2026 04:23:09 -0800 (PST)
From: Jinseok Kim <always.starving0@gmail.com>
To: ltp@lists.linux.it,
	andrea.cervesato@suse.com
Date: Tue, 17 Feb 2026 21:22:36 +0900
Message-ID: <20260217122245.5806-1-always.starving0@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DGH7IUS12FMT.QMUF16MQGD6U@suse.com>
References: <DGH7IUS12FMT.QMUF16MQGD6U@suse.com>
MIME-Version: 1.0
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2 1/2] open: fix cleanup condition and use snprintf
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:-];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[alwaysstarving0@gmail.com,ltp-bounces@lists.linux.it];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: 2BFF114BE59
X-Rspamd-Action: no action

Hi Cervesato.

Thanks for the review!

Changes since v1:
- Replace remaining sprintf() with snprintf() in setup()

Thanks,
Jinseok.

Signed-off-by: Jinseok Kim <always.starving0@gmail.com>
---
 testcases/kernel/syscalls/open/open04.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/open/open04.c b/testcases/kernel/syscalls/open/open04.c
index 3dc3486d3..5d39c1569 100644
--- a/testcases/kernel/syscalls/open/open04.c
+++ b/testcases/kernel/syscalls/open/open04.c
@@ -30,7 +30,7 @@ static void setup(void)
 	fds[0] = first;

 	for (i = first + 1; i < fds_limit; i++) {
-		sprintf(fname, FNAME ".%d", i);
+		snprintf(fname, sizeof(fname), FNAME ".%d", i);
 		fd = open(fname, O_RDWR | O_CREAT, 0777);
 		if (fd == -1) {
 			if (errno != EMFILE)
@@ -44,13 +44,13 @@ static void setup(void)

 static void run(void)
 {
-	sprintf(fname, FNAME ".%d", fds_limit);
+	snprintf(fname, sizeof(fname), FNAME ".%d", fds_limit);
 	TST_EXP_FAIL2(open(fname, O_RDWR | O_CREAT, 0777), EMFILE);
 }

 static void cleanup(void)
 {
-	if (!first || !fds)
+	if (first < 0 || !fds)
 		return;

 	for (i = first; i < fds_limit; i++)
--
2.43.0

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
