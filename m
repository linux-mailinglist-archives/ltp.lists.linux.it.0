Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F13E4A07746
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2025 14:24:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9ADE63C1D33
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2025 14:24:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 593473C223C
 for <ltp@lists.linux.it>; Thu,  9 Jan 2025 14:23:42 +0100 (CET)
Authentication-Results: in-7.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C431621BDAA
 for <ltp@lists.linux.it>; Thu,  9 Jan 2025 14:23:41 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 239FD21125;
 Thu,  9 Jan 2025 13:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1736429020; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tZ5gEittzzFvWpgm7e5muowAEWjRS2d8mTzFMYnrgl0=;
 b=AIMnmknsQBW1IC2PYAb39+4hliGvi8V2JC95N4msTYxpaifnhkbJQMzfBZtEpWbveo8NEp
 Ji1AGyoXd7N1RIzlgH/HlLgrJOZJPMBge9EXFGJ8rfLXkaP4qdpfn66x+QBXQg1idCW8DD
 5A+lIp5b8m/ZlVF2FoxOkxv/mTMbLdw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1736429020;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tZ5gEittzzFvWpgm7e5muowAEWjRS2d8mTzFMYnrgl0=;
 b=xlDkTMZurKpclQ+x/uaIaJ1GUGeeSbbOgSv9BSRY2iL+lQDaQAwqifc0mmqnRbLNMMEvge
 HtlQ/ugrLwKiDYBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1736429020; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tZ5gEittzzFvWpgm7e5muowAEWjRS2d8mTzFMYnrgl0=;
 b=AIMnmknsQBW1IC2PYAb39+4hliGvi8V2JC95N4msTYxpaifnhkbJQMzfBZtEpWbveo8NEp
 Ji1AGyoXd7N1RIzlgH/HlLgrJOZJPMBge9EXFGJ8rfLXkaP4qdpfn66x+QBXQg1idCW8DD
 5A+lIp5b8m/ZlVF2FoxOkxv/mTMbLdw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1736429020;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tZ5gEittzzFvWpgm7e5muowAEWjRS2d8mTzFMYnrgl0=;
 b=xlDkTMZurKpclQ+x/uaIaJ1GUGeeSbbOgSv9BSRY2iL+lQDaQAwqifc0mmqnRbLNMMEvge
 HtlQ/ugrLwKiDYBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B145513A8B;
 Thu,  9 Jan 2025 13:23:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wNqNJ9vNf2d0SwAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Thu, 09 Jan 2025 13:23:39 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  9 Jan 2025 14:23:34 +0100
Message-ID: <20250109132334.212281-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250109132334.212281-1-pvorel@suse.cz>
References: <20250109132334.212281-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,suse.cz:mid,imap1.dmz-prg2.suse.org:helo];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -6.80
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 2/2] macros: Add basic docs
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

Describe all "public" macros.
Move variables to the top.
Add header to the sphinx doc.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
* I also wanted to document extern variables, but I haven't found a proper
  syntax.

* TPASS/TFAIL cross reference is a bit verbose. I'd like to have some
  helper for it, but creating extension is overkill.

extern long TST_RET;
extern void *TST_RET_PTR;
extern int TST_ERR;
extern int TST_PASS;


 doc/developers/api_c_tests.rst |   1 +
 include/tst_test_macros.h      | 257 ++++++++++++++++++++++++++++++++-
 2 files changed, 251 insertions(+), 7 deletions(-)

diff --git a/doc/developers/api_c_tests.rst b/doc/developers/api_c_tests.rst
index 46f5d3360b..515d843c00 100644
--- a/doc/developers/api_c_tests.rst
+++ b/doc/developers/api_c_tests.rst
@@ -11,6 +11,7 @@ Core LTP API
 ------------
 .. kernel-doc:: ../../include/tst_res_flags.h
 .. kernel-doc:: ../../include/tst_test.h
+.. kernel-doc:: ../../include/tst_test_macros.h
 
 Capabilities
 ------------
diff --git a/include/tst_test_macros.h b/include/tst_test_macros.h
index b2b446b70c..2e8d88b1b7 100644
--- a/include/tst_test_macros.h
+++ b/include/tst_test_macros.h
@@ -1,7 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) 2015-2024 Cyril Hrubis <chrubis@suse.cz>
- * Copyright (c) Linux Test Project, 2021-2022
+ * Copyright (c) Linux Test Project, 2021-2024
+ */
+
+/**
+ * DOC: tst_test_macros.h -- helpers for testing syscalls
  */
 
 #ifndef TST_TEST_MACROS_H__
@@ -9,6 +13,18 @@
 
 #include <stdbool.h>
 
+extern long TST_RET;
+extern void *TST_RET_PTR;
+extern int TST_ERR;
+extern int TST_PASS;
+
+/**
+ * TEST() - Test syscall which return long (most of syscalls).
+ *
+ * @SCALL: Tested syscall.
+ *
+ * Sets TST_RET and TST_ERR.
+ */
 #define TEST(SCALL) \
 	do { \
 		errno = 0; \
@@ -16,12 +32,13 @@
 		TST_ERR = errno; \
 	} while (0)
 
-extern long TST_RET;
-extern int TST_ERR;
-extern int TST_PASS;
-
-extern void *TST_RET_PTR;
-
+/**
+ * TESTPTR() - Test syscall which returns void pointer.
+ *
+ * @SCALL: Tested syscall.
+ *
+ * Sets TST_RET_PTR and TST_ERR.
+ */
 #define TESTPTR(SCALL) \
 	do { \
 		errno = 0; \
@@ -74,6 +91,12 @@ extern void *TST_RET_PTR;
 		TST_RET;                                                       \
 	})
 
+/**
+ * TST_EXP_POSITIVE() - Test syscall, expect return value >= 0.
+ *
+ * @SCALL: Tested syscall.
+ * @...: A printf-like parameters.
+ */
 #define TST_EXP_POSITIVE(SCALL, ...)                                           \
 	({                                                                     \
 		TST_EXP_POSITIVE__(SCALL, #SCALL, ##__VA_ARGS__);              \
@@ -86,8 +109,22 @@ extern void *TST_RET_PTR;
 		TST_RET;                                                       \
 	})
 
+/**
+ * TST_EXP_FD_SILENT() - Test syscall to return a file descriptor, silent variant.
+ *
+ * @SCALL: Tested syscall.
+ * @...: A printf-like parameters.
+ *
+ * Unlike TST_EXP_FD() does not print :c:enum:`TPASS <tst_res_flags>` on success, only prints :c:enum:`TFAIL <tst_res_flags>` on failure.
+ */
 #define TST_EXP_FD_SILENT(SCALL, ...)	TST_EXP_POSITIVE_(SCALL, #SCALL, ##__VA_ARGS__)
 
+/**
+ * TST_EXP_FD() - Test syscall to return a file descriptor.
+ *
+ * @SCALL: Tested syscall.
+ * @...: A printf-like parameters.
+ */
 #define TST_EXP_FD(SCALL, ...)                                                 \
 	({                                                                     \
 		TST_EXP_POSITIVE__(SCALL, #SCALL, ##__VA_ARGS__);              \
@@ -99,6 +136,18 @@ extern void *TST_RET_PTR;
 		TST_RET;                                                       \
 	})
 
+/**
+ * TST_EXP_FD_OR_FAIL() - Test syscall to return file descriptor or fail with
+ * expected errno.
+ *
+ * @SCALL: Tested syscall.
+ * @ERRNO: Expected errno or 0.
+ * @...: A printf-like parameters.
+ *
+ * Expect a file descriptor if errno is 0 otherwise fail with expected errno.
+ *
+ * Internally it uses TST_EXP_FAIL() and TST_EXP_FD().
+ */
 #define TST_EXP_FD_OR_FAIL(SCALL, ERRNO, ...)                                  \
 	({                                                                     \
 		if (ERRNO)                                                     \
@@ -109,8 +158,22 @@ extern void *TST_RET_PTR;
 		TST_RET;                                                       \
 	})
 
+/**
+ * TST_EXP_PID_SILENT() - Test syscall to return PID, silent variant.
+ *
+ * @SCALL: Tested syscall.
+ * @...: A printf-like parameters.
+ *
+ * Unlike TST_EXP_PID() does not print :c:enum:`TPASS <tst_res_flags>` on success, only prints :c:enum:`TFAIL <tst_res_flags>` on failure.
+ */
 #define TST_EXP_PID_SILENT(SCALL, ...)	TST_EXP_POSITIVE_(SCALL, #SCALL, ##__VA_ARGS__)
 
+/**
+ * TST_EXP_PID() - Test syscall to return PID.
+ *
+ * @SCALL: Tested syscall.
+ * @...: A printf-like parameters.
+ */
 #define TST_EXP_PID(SCALL, ...)                                                \
 	({                                                                     \
 		TST_EXP_POSITIVE__(SCALL, #SCALL, ##__VA_ARGS__);              \
@@ -138,8 +201,24 @@ extern void *TST_RET_PTR;
 		                                                               \
 	} while (0)
 
+/**
+ * TST_EXP_VAL_SILENT() - Test syscall to return specified value, silent variant.
+ *
+ * @SCALL: Tested syscall.
+ * @VAL: Expected return value.
+ * @...: A printf-like parameters.
+ *
+ * Unlike TST_EXP_VAL() does not print :c:enum:`TPASS <tst_res_flags>` on success, only prints :c:enum:`TFAIL <tst_res_flags>` on failure.
+ */
 #define TST_EXP_VAL_SILENT(SCALL, VAL, ...) TST_EXP_VAL_SILENT_(SCALL, VAL, #SCALL, ##__VA_ARGS__)
 
+/**
+ * TST_EXP_VAL() - Test syscall to return specified value.
+ *
+ * @SCALL: Tested syscall.
+ * @VAL: Expected return value.
+ * @...: A printf-like parameters.
+ */
 #define TST_EXP_VAL(SCALL, VAL, ...)                                           \
 	do {                                                                   \
 		TST_EXP_VAL_SILENT_(SCALL, VAL, #SCALL, ##__VA_ARGS__);        \
@@ -171,8 +250,22 @@ extern void *TST_RET_PTR;
                                                                                \
 	} while (0)
 
+/**
+ * TST_EXP_PASS_SILENT() - Test syscall to return 0, silent variant.
+ *
+ * @SCALL: Tested syscall.
+ * @...: A printf-like parameters.
+ *
+ * Unlike TST_EXP_PASS() does not print :c:enum:`TPASS <tst_res_flags>` on success, only prints :c:enum:`TFAIL <tst_res_flags>` on failure.
+ */
 #define TST_EXP_PASS_SILENT(SCALL, ...) TST_EXP_PASS_SILENT_(SCALL, #SCALL, ##__VA_ARGS__)
 
+/**
+ * TST_EXP_PASS() - Test syscall to return 0.
+ *
+ * @SCALL: Tested syscall.
+ * @...: A printf-like parameters.
+ */
 #define TST_EXP_PASS(SCALL, ...)                                               \
 	do {                                                                   \
 		TST_EXP_PASS_SILENT_(SCALL, #SCALL, ##__VA_ARGS__);            \
@@ -263,6 +356,15 @@ const char *tst_errno_names(char *buf, const int *exp_errs, int exp_errs_cnt);
 			TST_MSG_(TPASS | TTERRNO, " ", SSCALL, ##__VA_ARGS__); \
 	} while (0)
 
+/**
+ * TST_EXP_FAIL() - Test syscall to fail with expected errno.
+ *
+ * @SCALL: Tested syscall.
+ * @EXP_ERR: Expected errno.
+ * @...: A printf-like parameters.
+ *
+ * For syscalls which valid return value is 0.
+ */
 #define TST_EXP_FAIL(SCALL, EXP_ERR, ...)                                      \
 	do {                                                                   \
 		int tst_exp_err__ = EXP_ERR;                                   \
@@ -270,6 +372,14 @@ const char *tst_errno_names(char *buf, const int *exp_errs, int exp_errs_cnt);
                                   ##__VA_ARGS__);                              \
 	} while (0)
 
+/**
+ * TST_EXP_FAIL_ARR() - Test syscall to fail with expected errnos.
+ *
+ * @SCALL: Tested syscall.
+ * @EXP_ERRS: Array of expected errnos.
+ * @EXP_ERRS_CNT: Lenght of EXP_ERRS.
+ * @...: A printf-like parameters.
+ */
 #define TST_EXP_FAIL_ARR(SCALL, EXP_ERRS, EXP_ERRS_CNT, ...)                   \
 		TST_EXP_FAIL_ARR_(SCALL, #SCALL, EXP_ERRS,                     \
 				  EXP_ERRS_CNT, ##__VA_ARGS__);
@@ -286,6 +396,15 @@ const char *tst_errno_names(char *buf, const int *exp_errs, int exp_errs_cnt);
 		TST_EXP_FAIL2_ARR_(SCALL, #SCALL, EXP_ERRS,                    \
 		                  EXP_ERRS_CNT, ##__VA_ARGS__);
 
+/**
+ * TST_EXP_FAIL_PTR_NULL() - Test syscall to fail with expected errno and return a NULL pointer.
+ *
+ * @SCALL: Tested syscall.
+ * @EXP_ERR: Expected errno.
+ * @...: A printf-like parameters.
+ *
+ * Unlike most of macros it sets TST_RET_PTR instead of TST_RET.
+ */
 #define TST_EXP_FAIL_PTR_NULL(SCALL, EXP_ERR, ...)                          \
 	do {                                                                   \
 		int tst_exp_err__ = EXP_ERR;                                   \
@@ -293,12 +412,31 @@ const char *tst_errno_names(char *buf, const int *exp_errs, int exp_errs_cnt);
 			&tst_exp_err__, 1, ##__VA_ARGS__);                     \
 	} while (0)
 
+/**
+ * TST_EXP_FAIL_PTR_NULL_ARR() - Test syscall to fail with expected errnos and return a NULL pointer.
+ *
+ * @SCALL: Tested syscall.
+ * @EXP_ERRS: Array of expected errnos.
+ * @EXP_ERRS_CNT: Lenght of EXP_ERRS.
+ * @...: A printf-like parameters.
+ *
+ * Unlike most of macros it sets TST_RET_PTR instead of TST_RET.
+ */
 #define TST_EXP_FAIL_PTR_NULL_ARR(SCALL, EXP_ERRS, EXP_ERRS_CNT, ...)      \
 	do {                                                                   \
 		TST_EXP_FAIL_PTR_(SCALL, #SCALL, NULL,                         \
 			EXP_ERRS, EXP_ERRS_CNT, ##__VA_ARGS__);        \
 	} while (0)
 
+/**
+ * TST_EXP_FAIL_PTR_VOID() - Test syscall to fail with expected errno and return a void pointer.
+ *
+ * @SCALL: Tested syscall.
+ * @EXP_ERR: Expected errno.
+ * @...: A printf-like parameters.
+ *
+ * Unlike most of macros it sets TST_RET_PTR instead of TST_RET.
+ */
 #define TST_EXP_FAIL_PTR_VOID(SCALL, EXP_ERR, ...)                         \
 	do {                                                                   \
 		int tst_exp_err__ = EXP_ERR;                                   \
@@ -306,12 +444,31 @@ const char *tst_errno_names(char *buf, const int *exp_errs, int exp_errs_cnt);
 			&tst_exp_err__, 1, ##__VA_ARGS__);                     \
 	} while (0)
 
+/**
+ * TST_EXP_FAIL_PTR_VOID_ARR() - Test syscall to fail with expected errnos and return a void pointer.
+ *
+ * @SCALL: Tested syscall.
+ * @EXP_ERRS: Array of expected errnos.
+ * @EXP_ERRS_CNT: Lenght of EXP_ERRS.
+ * @...: A printf-like parameters.
+ *
+ * Unlike most of macros it sets TST_RET_PTR instead of TST_RET.
+ */
 #define TST_EXP_FAIL_PTR_VOID_ARR(SCALL, EXP_ERRS, EXP_ERRS_CNT, ...)      \
 	do {                                                                   \
 		TST_EXP_FAIL_PTR_(SCALL, #SCALL, (void *)-1,                   \
 			EXP_ERRS, EXP_ERRS_CNT, ##__VA_ARGS__);        \
 	} while (0)
 
+/**
+ * TST_EXP_FAIL2() - Test syscall to fail with expected errno.
+ *
+ * @SCALL: Tested syscall.
+ * @EXP_ERR: Expected errno.
+ * @...: A printf-like parameters.
+ *
+ * For syscalls which valid return value is >= 0.
+ */
 #define TST_EXP_FAIL2(SCALL, EXP_ERR, ...)                                     \
 	do {                                                                   \
 		int tst_exp_err__ = EXP_ERR;                                   \
@@ -319,6 +476,15 @@ const char *tst_errno_names(char *buf, const int *exp_errs, int exp_errs_cnt);
                                   ##__VA_ARGS__);                              \
 	} while (0)
 
+/**
+ * TST_EXP_FAIL_SILENT() - Test syscall to fail with expected errno, silent variant.
+ *
+ * @SCALL: Tested syscall.
+ * @EXP_ERR: Expected errno.
+ * @...: A printf-like parameters.
+ *
+ * Unlike TST_EXP_FAIL() does not print :c:enum:`TPASS <tst_res_flags>` on success, only prints :c:enum:`TFAIL <tst_res_flags>` on failure.
+ */
 #define TST_EXP_FAIL_SILENT(SCALL, EXP_ERR, ...)                               \
 	do {                                                                   \
 		int tst_exp_err__ = EXP_ERR;                                   \
@@ -326,6 +492,15 @@ const char *tst_errno_names(char *buf, const int *exp_errs, int exp_errs_cnt);
 			&tst_exp_err__, 1, ##__VA_ARGS__);                     \
 	} while (0)
 
+/**
+ * TST_EXP_FAIL2_SILENT() - Test syscall to fail with expected errno, silent variant.
+ *
+ * @SCALL: Tested syscall.
+ * @EXP_ERR: Expected errno.
+ * @...: A printf-like parameters.
+ *
+ * Unlike TST_EXP_FAIL2() does not print :c:enum:`TPASS <tst_res_flags>` on success, only prints :c:enum:`TFAIL <tst_res_flags>` on failure.
+ */
 #define TST_EXP_FAIL2_SILENT(SCALL, EXP_ERR, ...)                              \
 	do {                                                                   \
 		int tst_exp_err__ = EXP_ERR;                                   \
@@ -333,6 +508,12 @@ const char *tst_errno_names(char *buf, const int *exp_errs, int exp_errs_cnt);
 			&tst_exp_err__, 1, ##__VA_ARGS__);                     \
 	} while (0)
 
+/**
+ * TST_EXP_EXPR() - Check for expected expression.
+ *
+ * @EXPR: Expression to be tested.
+ * @...: A printf-like parameters.
+ */
 #define TST_EXP_EXPR(EXPR, ...)                                              \
        tst_res_(__FILE__, __LINE__, (EXPR) ? TPASS : TFAIL, "Expect: "       \
                 TST_FMT_(TST_2_(dummy, ##__VA_ARGS__, #EXPR), __VA_ARGS__));
@@ -352,6 +533,12 @@ const char *tst_errno_names(char *buf, const int *exp_errs, int exp_errs_cnt);
 	}                                                                      \
 } while (0)
 
+/**
+ * TST_EXP_EQ_LI() - Compare two long long values.
+ *
+ * @VAL_A: long long value A.
+ * @VAL_B: long long value B.
+ */
 #define TST_EXP_EQ_LI(VAL_A, VAL_B) do {                                       \
 	TST_EXP_EQ_SILENT_(VAL_A, #VAL_A, VAL_B, #VAL_B, long long, "%lli");   \
 								               \
@@ -362,9 +549,23 @@ const char *tst_errno_names(char *buf, const int *exp_errs, int exp_errs_cnt);
 	}                                                                      \
 } while (0)
 
+/**
+ * TST_EXP_EQ_LI_SILENT() - Compare two long long values, silent variant.
+ *
+ * @VAL_A: long long value A.
+ * @VAL_B: long long value B.
+ *
+ * Unlike TST_EXP_EQ_LI() does not print :c:enum:`TPASS <tst_res_flags>` on success, only prints :c:enum:`TFAIL <tst_res_flags>` on failure.
+ */
 #define TST_EXP_EQ_LI_SILENT(VAL_A, VAL_B) \
 	TST_EXP_EQ_SILENT_(VAL_A, #VAL_A, VAL_B, #VAL_B, long long, "%lli")
 
+/**
+ * TST_EXP_EQ_LU() - Compare two unsigned long long values.
+ *
+ * @VAL_A: unsigned long long value A.
+ * @VAL_B: unsigned long long value B.
+ */
 #define TST_EXP_EQ_LU(VAL_A, VAL_B) do {                                       \
 	TST_EXP_EQ_SILENT_(VAL_A, #VAL_A, VAL_B, #VAL_B, unsigned long long, "%llu"); \
 								               \
@@ -375,9 +576,23 @@ const char *tst_errno_names(char *buf, const int *exp_errs, int exp_errs_cnt);
 	}                                                                      \
 } while (0)
 
+/**
+ * TST_EXP_EQ_LU_SILENT() - Compare two unsigned long long values, silent variant.
+ *
+ * @VAL_A: unsigned long long value A.
+ * @VAL_B: unsigned long long value B.
+ *
+ * Unlike TST_EXP_EQ_LU() does not print :c:enum:`TPASS <tst_res_flags>` on success, only prints :c:enum:`TFAIL <tst_res_flags>` on failure.
+ */
 #define TST_EXP_EQ_LU_SILENT(VAL_A, VAL_B) \
 	TST_EXP_EQ_SILENT_(VAL_A, #VAL_A, VAL_B, #VAL_B, unsigned long long, "%llu")
 
+/**
+ * TST_EXP_EQ_SZ() - Compare two unsigned size_t values.
+ *
+ * @VAL_A: unsigned long long value A.
+ * @VAL_B: unsigned long long value B.
+ */
 #define TST_EXP_EQ_SZ(VAL_A, VAL_B) do {                                       \
 	TST_EXP_EQ_SILENT_(VAL_A, #VAL_A, VAL_B, #VAL_B, size_t, "%zu");       \
 								               \
@@ -388,9 +603,23 @@ const char *tst_errno_names(char *buf, const int *exp_errs, int exp_errs_cnt);
 	}                                                                      \
 } while (0)
 
+/**
+ * TST_EXP_EQ_SZ_SILENT() - Compare two unsigned size_t values, silent variant.
+ *
+ * @VAL_A: unsigned long long value A.
+ * @VAL_B: unsigned long long value B.
+ *
+ * Unlike TST_EXP_EQ_SZ() does not print :c:enum:`TPASS <tst_res_flags>` on success, only prints :c:enum:`TFAIL <tst_res_flags>` on failure.
+ */
 #define TST_EXP_EQ_SZ_SILENT(VAL_A, VAL_B) \
 	TST_EXP_EQ_SILENT_(VAL_A, #VAL_A, VAL_B, #VAL_B, size_t, "%zu")
 
+/**
+ * TST_EXP_EQ_SSZ() - Compare two unsigned ssize_t values.
+ *
+ * @VAL_A: unsigned long long value A.
+ * @VAL_B: unsigned long long value B.
+ */
 #define TST_EXP_EQ_SSZ(VAL_A, VAL_B) do {                                      \
 	TST_EXP_EQ_SILENT_(VAL_A, #VAL_A, VAL_B, #VAL_B, size_t, "%zi");       \
 								               \
@@ -401,9 +630,23 @@ const char *tst_errno_names(char *buf, const int *exp_errs, int exp_errs_cnt);
 	}                                                                      \
 } while (0)
 
+/**
+ * TST_EXP_EQ_SSZ_SILENT() - Compare two unsigned ssize_t values, silent variant.
+ *
+ * @VAL_A: unsigned long long value A.
+ * @VAL_B: unsigned long long value B.
+ *
+ * Unlike TST_EXP_EQ_SSZ() does not print :c:enum:`TPASS <tst_res_flags>` on success, only prints :c:enum:`TFAIL <tst_res_flags>` on failure.
+ */
 #define TST_EXP_EQ_SSZ_SILENT(VAL_A, VAL_B) \
 	TST_EXP_EQ_SILENT_(VAL_A, #VAL_A, VAL_B, #VAL_B, ssize_t, "%zi")
 
+/**
+ * TST_EXP_EQ_STR() - Compare two strings.
+ *
+ * @STR_A: string to compare.
+ * @STR_B: string to compare.
+ */
 #define TST_EXP_EQ_STR(STR_A, STR_B) do {                                      \
 	TST_PASS = strcmp(STR_A, STR_B) == 0;                                  \
                                                                                \
-- 
2.47.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
