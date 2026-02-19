Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NdfGyIbl2kEuwIAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Feb 2026 15:16:02 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 056AE15F5EB
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Feb 2026 15:16:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 70B563D0755
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Feb 2026 15:16:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3DE083D0748
 for <ltp@lists.linux.it>; Thu, 19 Feb 2026 15:15:59 +0100 (CET)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id AF5B5600A0E
 for <ltp@lists.linux.it>; Thu, 19 Feb 2026 15:15:58 +0100 (CET)
Received: by mail-pl1-x644.google.com with SMTP id
 d9443c01a7336-2a8a7269547so9289915ad.0
 for <ltp@lists.linux.it>; Thu, 19 Feb 2026 06:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771510557; x=1772115357; darn=lists.linux.it;
 h=content-transfer-encoding:kfrom:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TIqTr+IdJH+hxMlxBkfBLhUBXbqH29RLt5l+Ehj/C74=;
 b=i59pZO802MUgvMQMXCrdtSZ0fC9z8ewwCJ5DmT0dM4R9cQpp4a/3TRxL51k94/D+la
 h/kQbbbjsNxRMQTQljnJwgR/YycS/hduWqf2w3RwV7hR/O5qVQDzHbkzttQckR6pVrM2
 jL5EHUneZS8+out07knBS0IHa3OMU3yB0Y6Z0jKDCLESIVW0pmpUUt+hbZ1IKduOkZUW
 OqtN8lTqoWXs2OsTb98GiSlt/rMiRpEAEtAyWkTr4vF1L3lspxa7wOXYGfUYoCVpCmPZ
 eIUjXXpuN+Hb31fo50mUohvYIzFg/pTLJC/VciQxazziljlpEmU5e9pzlrvFeYpvXnLi
 5TRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771510557; x=1772115357;
 h=content-transfer-encoding:kfrom:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TIqTr+IdJH+hxMlxBkfBLhUBXbqH29RLt5l+Ehj/C74=;
 b=rNZgYcRt17q2wqOuv8Ec3pwmOmVvMGP+9T/PiQP/aSMBtjGxBqNB5vzurcq6MBNF+Q
 +rLawUq0g/qseXOgqilvrSXjgoUTphfET5WFqlF7VXBt/DQ+vVaekDUlQKN7Clc+7sNx
 a177LMGIj2HrGW8cBBLoXSD79NpdkM1s/pWrgk74d4sajnyXhbuZY1ZHiLczBZf4tP+O
 7WteEIZRIe2jCeRWgDCpJImjJUoZ6z4PKZ3jPCg6e3XnnZL3bCvT3f70GGTUt3XICmcX
 9P7KXdOuWjPaXV2PlcnNlUolFEU5zhV+KEUnxSPAysSBxToXaVtSfnR4T+0wGK20OPVc
 7BSg==
X-Gm-Message-State: AOJu0YzbwRQIU0JjvYZ8V25ADjTYVgCloca854VisSuxxULsKbSF6baK
 FOuroV756c04S/fbIKp1jbyXAzo337CfpGUVdoJcX4G7RWkdESUFDEIBeTdg380g4Q==
X-Gm-Gg: AZuq6aKWcSrH+QCJXC7r9VC18gnc/hFB2MbEoUG/EdG8+aY0beXJ73EKD+c93Whut2t
 WYqkENbhekRcQ3/q68IbKiq8R6shPY9HK3RwfN0U6+4IpgUKiIFm0YmJ4U6HEvutKBS6sHaQRH8
 lStRKANW7F6+s96SaF2kcdb86fdbgQUEMQYV33IihfxaLIQRWhgZGz1WyXXeixuCBtHeDBIoU/T
 n3nQkr4a+4a6kmtLqvTxoLkrwqf2NZfrn05cXkcscaTnQs0CYTjojHUsa4LXN/Ydp5tsouwKVIg
 3TGZFxSoSsDNAqNJO3o+f7QBI3zXBC9ct1+DCCNT350Agi3aQwPM7tJxaaWcBiDOyPcRLImAztB
 7228MZyze5dAgoaVpOLbEiNtkOP7nKDvL7BSPzBzbH4kMFsQsirx6L1P5Eiu81Vx1D/7l7PX2ek
 C3SXb96Czll+J7XGKyyKl1USrY/54n2FNS+SXhrMQ3MA==
X-Received: by 2002:a17:902:d4d0:b0:2aa:d61d:79bf with SMTP id
 d9443c01a7336-2ab4d04e925mr219666995ad.42.1771510556683; 
 Thu, 19 Feb 2026 06:15:56 -0800 (PST)
Received: from localhost.localdomain ([59.16.109.172])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3589d80cc18sm298022a91.3.2026.02.19.06.15.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 06:15:55 -0800 (PST)
From: Jinseok Kim <always.starving0@gmail.com>
To: ltp@lists.linux.it,
	andrea.cervesato@suse.com
Date: Thu, 19 Feb 2026 23:15:17 +0900
Message-ID: <20260219141532.6513-1-always.starving0@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DGIU5TUBY8DA.1O11NEVRMZTZK@suse.com>
References: <DGIU5TUBY8DA.1O11NEVRMZTZK@suse.com>
MIME-Version: 1.0
kFrom: Jinseok Kim <always.starving0@gmail.com>
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v3 1/2] open: fix cleanup condition and use snprintf
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
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:-];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[alwaysstarving0@gmail.com,ltp-bounces@lists.linux.it];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-ltp];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url]
X-Rspamd-Queue-Id: 056AE15F5EB
X-Rspamd-Action: no action

The test uses sprintf() to build temporary file names, which may
overflow the fixed-size buffer. Replace it with snprintf() to avoid
potential buffer overflows.

The cleanup logic also checked '!first' to decide whether to close
file descriptors. Since file descriptor 0 is valid, this condition
can incorrectly skip cleanup and leak file descriptors.

To fix this:
- Initialize first = -1 to correctly detect uninitialized state
- Initialize fds array with -1 after malloc to avoid closing invalid fds

Signed-off-by: Jinseok Kim <always.starving0@gmail.com>
---
 testcases/kernel/syscalls/open/open04.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/syscalls/open/open04.c b/testcases/kernel/syscalls/open/open04.c
index 3dc3486d3..152bec2d4 100644
--- a/testcases/kernel/syscalls/open/open04.c
+++ b/testcases/kernel/syscalls/open/open04.c
@@ -15,7 +15,8 @@

 #define FNAME "open04"

-static int fds_limit, first, i;
+static int fds_limit, i;
+static int first = -1;
 static int *fds;
 static char fname[20];

@@ -27,10 +28,11 @@ static void setup(void)
 	first = SAFE_OPEN(FNAME, O_RDWR | O_CREAT, 0777);

 	fds = SAFE_MALLOC(sizeof(int) * (fds_limit - first));
+	memset(fds, -1, sizeof(int) * (fds_limit - first));
 	fds[0] = first;

 	for (i = first + 1; i < fds_limit; i++) {
-		sprintf(fname, FNAME ".%d", i);
+		snprintf(fname, sizeof(fname), FNAME ".%d", i);
 		fd = open(fname, O_RDWR | O_CREAT, 0777);
 		if (fd == -1) {
 			if (errno != EMFILE)
@@ -44,13 +46,13 @@ static void setup(void)

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
