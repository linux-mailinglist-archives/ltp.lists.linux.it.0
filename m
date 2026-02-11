Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LApFoq5jGlHsgAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Feb 2026 18:16:58 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E05491268AE
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Feb 2026 18:16:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B5DEA3CEF73
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Feb 2026 18:16:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2DD593CA180
 for <ltp@lists.linux.it>; Wed, 11 Feb 2026 18:16:53 +0100 (CET)
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9EEB7600669
 for <ltp@lists.linux.it>; Wed, 11 Feb 2026 18:16:53 +0100 (CET)
Received: by mail-pg1-x544.google.com with SMTP id
 41be03b00d2f7-c5513f598c0so2563355a12.0
 for <ltp@lists.linux.it>; Wed, 11 Feb 2026 09:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770830212; x=1771435012; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=F6VbfvrUGfirs8wZ9jekLF/tj6jIYv1abQmYkmCDxug=;
 b=eBKhZumyXFtLRTU8Qcbl/ZA7H6T7e0+QDt4Tk5QLPN1yrLyJGqMLIAPClVhMPB6Jiw
 H/FMX8MV5xtgRC4DsAHDaSoD1Mx+O7D/h4aeu0CllrBYmUym5uMqjPyf87pY6kaV9rit
 +fUqYaRtEvDxYb8ig0+WifupKC5jwGPdRUgG403L3dK1BwMg7Ogd03Psj7pJZCDOkRu0
 i9yQ99r6afT7FIaYQ3R0THj/ZupldtYoKty/rvXjtXFAH0yo9Uyu5G73fiJsz0Gx5b+A
 UqwXfr3TMLpOvaDzeP4MW4ofC22lHyoW0P8x4aYxmtNOoKTQp0V28QOWZ+XM09W0pgLP
 YW8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770830212; x=1771435012;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F6VbfvrUGfirs8wZ9jekLF/tj6jIYv1abQmYkmCDxug=;
 b=fiVexcIk9W8EaTwnC5jmfU6Gv6s6BRYqiYDAsm2fFh/U8Q87NjnY3RXcZe8xoxdOBO
 7FQp4hQElLyxPjyRPF95QjLmvs8oCvXtUxXXI1bBfysMU5ke0Jhl5mJbV3oXhvRAPJnu
 vo2XnoERoeo4Sr12L/JayUnRKtAaFGlVlmyEP9ZqJx+UMicy0pL2IqR6iIBfNK5tCUTi
 CE6iyhKbbGqeiStAgomqKc6OMnaa7jdWSKsjhlufXnqpOd9WQ2+UgpcqcOeEVTGJqLvS
 vDn0j+zLH8xpHncBxMcgP8wzd0WiD4A9/jQskngPfAFJ0odZyS6aQrsqf6ootDBQy8OE
 qRoQ==
X-Gm-Message-State: AOJu0YxvQffFWahu5w4yyRFHRKoQTpuTmkzhl65iJjU5b5ZXpjROnaNS
 WcONJ5PWGz4g4mKLiTK2YTTzoYbKiar+zFSJq30bsCK9SQp01n31JT1rdVlHBgdJAveY
X-Gm-Gg: AZuq6aKAf5ezkxGdf8SVxSEk1yKYy0Gy8mvi+YcA7Pce7NIXe+KbgbVBG+EZwH8eAxn
 lEn8tlaJ4JRujLQJ6ifFDQ7ChG3F/VNxn4vF0myI3kH4uCyfyFLNqZL6Jw5TQ3GBBzBl3wP1M1E
 0Kq8RfmW1OM2NsIzXk06kjaOlIcOAr3W4eEJYrNGoF37CrAxxcRVn9Xgtk+dkRL6gaV27U84XBm
 tbAnZreNkUiQWCdeP6e5bVzBigsOWp+dFUKhhTsPeOaDGcYAkwkZXgfFIFpTtUQr1E8lqdmwdH4
 GSHwRuuMmgdKBO7PHCH7MaVW7/Rnnf5ALga0d8lBh6jci8D7M0HQHJTxYXBqoVHh+nzZxEp4XZX
 R7EFbLxYs8+3jp2tZ80/+NiU/idx1uRy/ZHK7BJ+5G45CbUOdw/xOQJ7gT3fDJlvvljj5/jOmy1
 UYr040AJxTbJjSE7590mKrlDCrDAov26Ug4bBUhIWopw==
X-Received: by 2002:a17:903:19ee:b0:2aa:e6fa:2f67 with SMTP id
 d9443c01a7336-2ab29e71661mr27523235ad.29.1770830211729; 
 Wed, 11 Feb 2026 09:16:51 -0800 (PST)
Received: from localhost.localdomain ([59.16.109.172])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ab2997b3d8sm28558235ad.68.2026.02.11.09.16.50
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 09:16:51 -0800 (PST)
From: Jinseok Kim <always.starving0@gmail.com>
To: ltp@lists.linux.it
Date: Thu, 12 Feb 2026 02:16:10 +0900
Message-ID: <20260211171627.11410-1-always.starving0@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] open: fix directory verification and misleading test
 description
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
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_NEQ_ENVFROM(0.00)[alwaysstarving0@gmail.com,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	DBL_BLOCKED_OPENRESOLVER(0.00)[picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: E05491268AE
X-Rspamd-Action: no action

The directory test treated S_IFDIR as a permission bit and verified
it using a generic st_mode bitwise check, which is not appropriate
for file type verification.

Use S_ISDIR() when verifying directories and keep bitwise checks
only for permission bits such as S_ISVTX.

The directory test case also referred to a "directory bit", which is
misleading since directories are identified by file type rather than
a permission bit.

Signed-off-by: Jinseok Kim <always.starving0@gmail.com>
---
 testcases/kernel/syscalls/open/open01.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/testcases/kernel/syscalls/open/open01.c b/testcases/kernel/syscalls/open/open01.c
index baf73ab11..1355592e1 100644
--- a/testcases/kernel/syscalls/open/open01.c
+++ b/testcases/kernel/syscalls/open/open01.c
@@ -37,7 +37,7 @@ static struct tcase {
 	char *desc;
 } tcases[] = {
 	{TEST_FILE, O_RDWR | O_CREAT, 01444, S_ISVTX, "sticky bit"},
-	{TEST_DIR, O_DIRECTORY, 0, S_IFDIR, "sirectory bit"}
+	{TEST_DIR, O_DIRECTORY, 0, S_IFDIR, "directory"}
 };

 static void verify_open(unsigned int n)
@@ -53,11 +53,17 @@ static void verify_open(unsigned int n)
 	fd = TST_RET;

 	SAFE_FSTAT(fd, &buf);
-	if (!(buf.st_mode & tc->tst_bit))
-		tst_res(TFAIL, "%s is cleared unexpectedly", tc->desc);
-	else
-		tst_res(TPASS, "%s is set as expected", tc->desc);
-
+	if (tc->tst_bit == S_ISVTX) {
+		if (!(buf.st_mode & S_ISVTX))
+			tst_res(TFAIL, "%s is cleared unexpectedly", tc->desc);
+		else
+			tst_res(TPASS, "%s is set as expected", tc->desc);
+	} else if (tc->tst_bit == S_IFDIR) {
+		if (!S_ISDIR(buf.st_mode))
+			tst_res(TFAIL, "%s is not a directory", tc->desc);
+		else
+			tst_res(TPASS, "%s is a directory", tc->desc);
+	}
 	SAFE_CLOSE(fd);
 	if (S_ISREG(buf.st_mode))
 		SAFE_UNLINK(tc->filename);
--
2.43.0

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
