Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGwnFNY9qGl6rQAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Mar 2026 15:12:38 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9C7201133
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Mar 2026 15:12:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6B5373DCD30
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Mar 2026 15:12:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5A1AC3CD1F8
 for <ltp@lists.linux.it>; Wed,  4 Mar 2026 15:12:28 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D9E48600B31
 for <ltp@lists.linux.it>; Wed,  4 Mar 2026 15:12:27 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0D2395BD65
 for <ltp@lists.linux.it>; Wed,  4 Mar 2026 14:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772633547; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KiKRts17DDBpAMTWVvdXlEllrTCGPDo9paX0t94W0Po=;
 b=e15QbsoO3ot2neV4+pCFGTLlyC41/LPZjqEI071zYRyYJ2HBXbUiOjPITL9qYmkmnTwURW
 ASzUsUBCPw5KktoLhRIhDFlwM4nccOgq9enjRWoSb2Cqm90F6oKaDKh2cK+1OcTZFYwlLJ
 LWD7c7c6O9HgOi5U7hjL3kl0xviWgtM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772633547;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KiKRts17DDBpAMTWVvdXlEllrTCGPDo9paX0t94W0Po=;
 b=ZdVZNZN/iqo4aAxyi+qz9dAIuw5266CsHLv9R5z9FAV1Sh3TQTiLnbThNkWfb4G5HEsvjK
 UNWGS1rW1xZNxKBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772633547; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KiKRts17DDBpAMTWVvdXlEllrTCGPDo9paX0t94W0Po=;
 b=e15QbsoO3ot2neV4+pCFGTLlyC41/LPZjqEI071zYRyYJ2HBXbUiOjPITL9qYmkmnTwURW
 ASzUsUBCPw5KktoLhRIhDFlwM4nccOgq9enjRWoSb2Cqm90F6oKaDKh2cK+1OcTZFYwlLJ
 LWD7c7c6O9HgOi5U7hjL3kl0xviWgtM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772633547;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KiKRts17DDBpAMTWVvdXlEllrTCGPDo9paX0t94W0Po=;
 b=ZdVZNZN/iqo4aAxyi+qz9dAIuw5266CsHLv9R5z9FAV1Sh3TQTiLnbThNkWfb4G5HEsvjK
 UNWGS1rW1xZNxKBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EE1553EA69
 for <ltp@lists.linux.it>; Wed,  4 Mar 2026 14:12:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id NPTvOMo9qGl1fwAAD6G6ig
 (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Wed, 04 Mar 2026 14:12:26 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Wed,  4 Mar 2026 15:12:34 +0100
Message-ID: <20260304141236.9080-2-chrubis@suse.cz>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260304141236.9080-1-chrubis@suse.cz>
References: <20260304141236.9080-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 1/3] tst_test_macros: Add TST_EXP_LE_LU*()
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
X-Rspamd-Queue-Id: DF9C7201133
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.49 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[suse.cz];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-];
	NEURAL_SPAM(0.00)[0.344];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[chrubis@suse.cz,ltp-bounces@lists.linux.it];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url]
X-Rspamd-Action: no action

For less or equal comparsions.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 include/tst_test_macros.h | 45 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/include/tst_test_macros.h b/include/tst_test_macros.h
index ee6599df2..3d2287753 100644
--- a/include/tst_test_macros.h
+++ b/include/tst_test_macros.h
@@ -693,6 +693,51 @@ const char *tst_errno_names(char *buf, const int *exp_errs, int exp_errs_cnt);
 	}                                                                      \
 } while (0)
 
+#define TST_EXP_LE_SILENT_(VAL_A, SVAL_A, VAL_B, SVAL_B, TYPE, PFS) do {       \
+	TYPE tst_tmp_a__ = VAL_A;                                              \
+	TYPE tst_tmp_b__ = VAL_B;                                              \
+                                                                               \
+	TST_PASS = 0;                                                          \
+                                                                               \
+	if (tst_tmp_a__ > tst_tmp_b__) {                                       \
+		tst_res_(__FILE__, __LINE__, TFAIL,                            \
+			SVAL_A " (" PFS ") > " SVAL_B " (" PFS ")",            \
+			tst_tmp_a__, tst_tmp_b__);                             \
+	} else {                                                               \
+		TST_PASS = 1;                                                  \
+	}                                                                      \
+} while (0)
+
+/**
+ * TST_EXP_LE_LU() - Compare two unsigned long long values, expect A <= B.
+ *
+ * @VAL_A: unsigned long long value A.
+ * @VAL_B: unsigned long long value B.
+ *
+ * Reports a pass if A <= B and a fail otherwise.
+ */
+#define TST_EXP_LE_LU(VAL_A, VAL_B) do {                                              \
+	TST_EXP_LE_SILENT_(VAL_A, #VAL_A, VAL_B, #VAL_B, unsigned long long, "%llu"); \
+									              \
+	if (TST_PASS) {                                                               \
+		tst_res_(__FILE__, __LINE__, TPASS,                                   \
+			#VAL_A " <= " #VAL_B " (%llu <= %llu)",                       \
+			(unsigned long long)VAL_A, (unsigned long long)VAL_B);        \
+	}                                                                             \
+} while (0)
+
+/**
+ * TST_EXP_LE_LU_SILENT() - Compare two unsigned long long values, silent variant.
+ *
+ * @VAL_A: unsigned long long value A.
+ * @VAL_B: unsigned long long value B.
+ *
+ * Unlike TST_EXP_LE_LU() does not print :c:enum:`TPASS <tst_res_flags>` on
+ * success, only prints :c:enum:`TFAIL <tst_res_flags>` on failure.
+ */
+#define TST_EXP_LE_LU_SILENT(VAL_A, VAL_B) \
+	TST_EXP_LE_SILENT_(VAL_A, #VAL_A, VAL_B, #VAL_B, unsigned long long, "%llu")
+
 /**
  * TST_EXP_EQ_LI() - Compare two long long values.
  *
-- 
2.52.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
