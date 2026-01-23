Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHWMBHWfc2mXxgAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jan 2026 17:19:01 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B234785BF
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jan 2026 17:19:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F378F3C59A7
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jan 2026 17:18:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 30D323C0F41
 for <ltp@lists.linux.it>; Fri, 23 Jan 2026 17:18:57 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 224291400519
 for <ltp@lists.linux.it>; Fri, 23 Jan 2026 17:18:56 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 309BD5BCD0;
 Fri, 23 Jan 2026 16:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1769185134; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CyUXwa3YNK8Tfuf1HRN4gezx9k6VDSr+AVLG4wyTACM=;
 b=Nif2fzXszO/DDWJR7HNGfD0X+i1qPNnmMKHP9ovs4Sr+L21IjuqqgDJulY0ceHOy+kUiog
 jUqMhnEwkRLtjaRF2X9/lCiFv9DhFslM7dT/Qe27g0lzQVW0f2sSJmAHf0NvOPN1BB4Er6
 JNPHBdtZUjCPFr5Amf1YxYLRpk3RfrI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1769185134;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CyUXwa3YNK8Tfuf1HRN4gezx9k6VDSr+AVLG4wyTACM=;
 b=hFnBVFcl1zxCUjPHkKt+4g91zqnwnJf8X6KyQnXuc23QCGVFxJyRAkL47RDgICH3VdDElb
 TsPLovuCSsJ1AMCw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=GmtbVbLc;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=beNhzreF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1769185133; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CyUXwa3YNK8Tfuf1HRN4gezx9k6VDSr+AVLG4wyTACM=;
 b=GmtbVbLcdYhIqHCpUa0yKQExLKJ9uJqNy0iXthBQ4Xc/AbvhZVbyyi6T0V3f7mixJB+ORr
 xBeeKUdb53tyAp9hQmjLRYv5Xwmsbo1B8hbkBNsJ58fEjLknNubF/HP/SyYjpKR8fWkZ/1
 bYb9e5ycMbuV6kzgBYjTV8w0Q8WAfak=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1769185133;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CyUXwa3YNK8Tfuf1HRN4gezx9k6VDSr+AVLG4wyTACM=;
 b=beNhzreFki/we/GjHGmfliy04QpvX2cqifDenJkId1vpkXiHlh3cT9YjjQ7h/kNXOPPb1A
 +rdN8iGsDCjBpdDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 10A4B139E8;
 Fri, 23 Jan 2026 16:18:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id IDuJAm2fc2n1GQAAD6G6ig
 (envelope-from <andrea.cervesato@suse.de>); Fri, 23 Jan 2026 16:18:53 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
Date: Fri, 23 Jan 2026 17:18:51 +0100
MIME-Version: 1.0
Message-Id: <20260123-stream_refactoring-v1-1-281b85f6ab02@suse.com>
References: <20260123-stream_refactoring-v1-0-281b85f6ab02@suse.com>
In-Reply-To: <20260123-stream_refactoring-v1-0-281b85f6ab02@suse.com>
To: Linux Test Project <ltp@lists.linux.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769185132; l=4930;
 i=andrea.cervesato@suse.com; s=20251210; h=from:subject:message-id;
 bh=VxDz8roTqF2T9HoL79fokai3pWu7XVP9SNuqcykfUN8=;
 b=fAYg2VXmWPANISGu+SGUUkQv1QZVoqcEqkdOYsiA3znV1BTF8IDrny4gRIVqAXTRQ4NWdSh6C
 ITf+rFZpr9oBdZFFdZpMydEwZZKC4ygmtSibdpXzxU3gcB+yse+rFhU
X-Developer-Key: i=andrea.cervesato@suse.com; a=ed25519;
 pk=zKY+6GCauOiuHNZ//d8PQ/UL4jFCTKbXrzXAOQSLevI=
X-Spam-Score: -4.51
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 1/6] Add safe macros for stream testing suite
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
	R_DKIM_REJECT(1.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+a];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[suse.de : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	RCPT_COUNT_ONE(0.00)[1];
	NEURAL_HAM(-0.00)[-0.624];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-ltp];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrea.cervesato@suse.de,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url];
	RCVD_COUNT_FIVE(0.00)[6];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[suse.de:-]
X-Rspamd-Queue-Id: 9B234785BF
X-Rspamd-Action: no action

From: Andrea Cervesato <andrea.cervesato@suse.com>

Introduce the following SAFE_* macros for stream file testing:

- SAFE_FREAD
- SAFE_FWRITE
- SAFE_FREOPEN
- SAFE_FSEEK
- SAFE_FTELL
- SAFE_FILENO

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 include/safe_stdio_fn.h  | 18 ++++++++++
 include/tst_safe_stdio.h | 18 ++++++++++
 lib/safe_stdio.c         | 87 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 123 insertions(+)

diff --git a/include/safe_stdio_fn.h b/include/safe_stdio_fn.h
index 3818a86571a6d9bc63fcf432c93683bb3298e5b2..79c08080fd16489ea5bd1606083ae900ba3b294f 100644
--- a/include/safe_stdio_fn.h
+++ b/include/safe_stdio_fn.h
@@ -32,4 +32,22 @@ int safe_asprintf(const char *file, const int lineno, void (cleanup_fn)(void),
 FILE *safe_popen(const char *file, const int lineno, void (cleanup_fn)(void),
 		 const char *command, const char *type);
 
+size_t safe_fread(const char *file, const int lineno, void (cleanup_fn)(void),
+		  void *ptr, size_t size, size_t n, FILE *stream);
+
+size_t safe_fwrite(const char *file, const int lineno, void (cleanup_fn)(void),
+		   const void *ptr, size_t size, size_t n, FILE *stream);
+
+FILE *safe_freopen(const char *file, const int lineno, void (cleanup_fn)(void),
+		   const char *path, const char *mode, FILE *stream);
+
+int safe_fseek(const char *file, const int lineno, void (cleanup_fn)(void),
+	       FILE *f, long offset, int whence);
+
+long safe_ftell(const char *file, const int lineno, void (cleanup_fn)(void),
+		FILE *f);
+
+int safe_fileno(const char *file, const int lineno, void (cleanup_fn)(void),
+		FILE *stream);
+
 #endif /* SAFE_STDIO_FN_H__ */
diff --git a/include/tst_safe_stdio.h b/include/tst_safe_stdio.h
index e4bff34da15c9116809fcf851cbf544a51e384ef..b757b7e36db69190df45b3af1f39058e24221379 100644
--- a/include/tst_safe_stdio.h
+++ b/include/tst_safe_stdio.h
@@ -21,4 +21,22 @@
 #define SAFE_POPEN(command, type) \
 	safe_popen(__FILE__, __LINE__, NULL, command, type)
 
+#define SAFE_FREAD(ptr, size, n, stream) \
+	safe_fread(__FILE__, __LINE__, NULL, ptr, size, n, stream)
+
+#define SAFE_FWRITE(ptr, size, n, stream) \
+	safe_fwrite(__FILE__, __LINE__, NULL, ptr, size, n, stream)
+
+#define SAFE_FREOPEN(path, mode, stream) \
+	safe_freopen(__FILE__, __LINE__, NULL, path, mode, stream)
+
+#define SAFE_FSEEK(f, offset, whence) \
+	safe_fseek(__FILE__, __LINE__, NULL, f, offset, whence)
+
+#define SAFE_FTELL(f) \
+	safe_ftell(__FILE__, __LINE__, NULL, f)
+
+#define SAFE_FILENO(f) \
+	safe_fileno(__FILE__, __LINE__, NULL, f)
+
 #endif /* TST_SAFE_STDIO_H__ */
diff --git a/lib/safe_stdio.c b/lib/safe_stdio.c
index ab23e43bb0835cdca5eaa015bc873fd23f9a8408..fc7b11781e5e6a45963d20ef4146aa82084cd6b8 100644
--- a/lib/safe_stdio.c
+++ b/lib/safe_stdio.c
@@ -99,3 +99,90 @@ FILE *safe_popen(const char *file, const int lineno, void (cleanup_fn)(void),
 
 	return stream;
 }
+
+size_t safe_fread(const char *file, const int lineno, void (cleanup_fn)(void),
+	void *ptr, size_t size, size_t n, FILE *stream)
+{
+	size_t ret;
+
+	ret = fread(ptr, size, n, stream);
+	if (ret != n) {
+		tst_brkm_(file, lineno, TBROK, cleanup_fn,
+			"fread(%p, %lu, %lu, %p) read %lu bytes",
+			ptr, size, n, stream, ret);
+	}
+
+	return ret;
+}
+
+size_t safe_fwrite(const char *file, const int lineno, void (cleanup_fn)(void),
+	const void *ptr, size_t size, size_t n, FILE *stream)
+{
+	size_t ret;
+
+	ret = fwrite(ptr, size, n, stream);
+	if (ret != n) {
+		tst_brkm_(file, lineno, TBROK, cleanup_fn,
+			"fwrite(%p, %lu, %lu, %p) written %lu bytes",
+			ptr, size, n, stream, ret);
+	}
+
+	return ret;
+}
+
+FILE *safe_freopen(const char *file, const int lineno, void (cleanup_fn)(void),
+	       const char *path, const char *mode, FILE *stream)
+{
+	FILE *f = freopen(path, mode, stream);
+
+	if (f == NULL) {
+		tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
+			"freopen(%s,%s,%p) failed", path, mode, stream);
+	}
+
+	return f;
+}
+
+int safe_fseek(const char *file, const int lineno, void (cleanup_fn)(void),
+		   FILE *f, long offset, int whence)
+{
+	int ret;
+
+	errno = 0;
+	ret = fseek(f, offset, whence);
+
+	if (ret == -1) {
+		tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
+			"fseek(%p, %ld, %d)", f, offset, whence);
+	}
+
+	return ret;
+}
+
+long safe_ftell(const char *file, const int lineno, void (cleanup_fn)(void),
+	       FILE *f)
+{
+	long ret;
+
+	errno = 0;
+	ret = ftell(f);
+
+	if (ret == -1)
+		tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn, "ftell(%p)", f);
+
+	return ret;
+}
+
+int safe_fileno(const char *file, const int lineno, void (cleanup_fn)(void),
+		FILE *f)
+{
+	int ret;
+
+	errno = 0;
+	ret = fileno(f);
+
+	if (ret == -1)
+		tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn, "fileno(%p)", f);
+
+	return ret;
+}

-- 
2.51.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
