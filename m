Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKL+BuT5lWlMXgIAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Feb 2026 18:41:56 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFA8158629
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Feb 2026 18:41:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5929D3D0711
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Feb 2026 18:41:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E6A3F3D06F9
 for <ltp@lists.linux.it>; Wed, 18 Feb 2026 18:41:45 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 3C5ED6009F9
 for <ltp@lists.linux.it>; Wed, 18 Feb 2026 18:41:44 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3E5B35BCF5
 for <ltp@lists.linux.it>; Wed, 18 Feb 2026 17:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1771436504; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=31+rt4gMIghcJzbkrCOBJ7HONIrsG+TXo7kZiEzVxo0=;
 b=P4/UwDt+W7VWYdsIUlUl/D+mjZBmldcDZz3WG0CyB6QnUKdzX1DLO/yta6SbblbJSAyW5B
 738NF9DiAvXfzlir9jOPT0Md3ddtCJ0E9uQhEQvCWd0ZknPEt8EJZXyIoVLXZH1VR7MoZf
 YFsReeOw+h+BNLE8Bvcapb5X8P3U6Jg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1771436504;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=31+rt4gMIghcJzbkrCOBJ7HONIrsG+TXo7kZiEzVxo0=;
 b=BgLW0LtIenCrvvO/cUWCjYRI+YowekMMDCMb1rObDYX0UFbRH8prLLF6mWS5RkR8xbTpup
 CB1gmfW4AyInsuDg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b="P4/UwDt+";
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=BgLW0LtI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1771436504; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=31+rt4gMIghcJzbkrCOBJ7HONIrsG+TXo7kZiEzVxo0=;
 b=P4/UwDt+W7VWYdsIUlUl/D+mjZBmldcDZz3WG0CyB6QnUKdzX1DLO/yta6SbblbJSAyW5B
 738NF9DiAvXfzlir9jOPT0Md3ddtCJ0E9uQhEQvCWd0ZknPEt8EJZXyIoVLXZH1VR7MoZf
 YFsReeOw+h+BNLE8Bvcapb5X8P3U6Jg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1771436504;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=31+rt4gMIghcJzbkrCOBJ7HONIrsG+TXo7kZiEzVxo0=;
 b=BgLW0LtIenCrvvO/cUWCjYRI+YowekMMDCMb1rObDYX0UFbRH8prLLF6mWS5RkR8xbTpup
 CB1gmfW4AyInsuDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2E51E3EA66
 for <ltp@lists.linux.it>; Wed, 18 Feb 2026 17:41:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id DbcVC9j5lWmvbAAAD6G6ig
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Wed, 18 Feb 2026 17:41:44 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 18 Feb 2026 18:41:38 +0100
Message-ID: <20260218174139.94454-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Spam-Score: -3.01
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2] readahead02: Always allow at least 100ms for cache
 to fill
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
X-Spamd-Result: default: False [1.49 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	DMARC_NA(0.00)[suse.cz];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[mdoucha@suse.cz,ltp-bounces@lists.linux.it];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	NEURAL_HAM(-0.00)[-0.992];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid,suse.cz:email,linux.it:url]
X-Rspamd-Queue-Id: ABFA8158629
X-Rspamd-Action: no action

The current wait algorithm for filling the cache after readahead()
will never retry if the cache doesn't start filling within 15ms.
Rewrite the wait loop to always allow at least 100ms for the cache
to fill and exit early only if cache increased by at least half
of the expected amount. This fixes random test failures if the interval
between cache increases is longer than 5ms.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Changes since v1:
- Renamed MIN_SLEEP_LIMIT to MIN_RETRY_LIMIT
- Fixed printf format for cached_prev
- Fixed type issue in cache_diff calculation by casting to ssize_t

 .../kernel/syscalls/readahead/readahead02.c   | 45 +++++++++----------
 1 file changed, 20 insertions(+), 25 deletions(-)

diff --git a/testcases/kernel/syscalls/readahead/readahead02.c b/testcases/kernel/syscalls/readahead/readahead02.c
index 8dbcec2e7..aac412695 100644
--- a/testcases/kernel/syscalls/readahead/readahead02.c
+++ b/testcases/kernel/syscalls/readahead/readahead02.c
@@ -38,8 +38,8 @@ static char testfile[PATH_MAX] = "testfile";
 #define DROP_CACHES_FNAME "/proc/sys/vm/drop_caches"
 #define PROC_IO_FNAME "/proc/self/io"
 #define DEFAULT_FILESIZE (64 * 1024 * 1024)
-#define INITIAL_SHORT_SLEEP_US 10000
 #define SHORT_SLEEP_US 5000
+#define MIN_RETRY_LIMIT 20
 
 static size_t testfile_size = DEFAULT_FILESIZE;
 static char *opt_fsizestr;
@@ -193,12 +193,20 @@ static int read_testfile(struct tcase *tc, int do_readahead,
 	long read_bytes_start;
 	unsigned char *p, tmp;
 	off_t offset = 0;
-	unsigned long cached_prev = 0, cached_cur = 0;
+	size_t cached_prev;
+	ssize_t cache_diff;
 
 	fd = SAFE_OPEN(fname, O_RDONLY);
 
 	if (do_readahead) {
 		do {
+			cached_prev = get_file_cached_bytes(fname, fsize);
+			tst_res(TDEBUG, "Per-file cached: %zu kB",
+				cached_prev / 1024);
+
+			if (cached_prev >= fsize)
+				break;
+
 			TEST(tc->readahead(fd, offset, fsize - offset));
 			if (TST_RET != 0) {
 				SAFE_CLOSE(fd);
@@ -207,40 +215,27 @@ static int read_testfile(struct tcase *tc, int do_readahead,
 
 			i++;
 			offset += readahead_length;
-			/* Wait a bit so that the readahead() has chance to start. */
-			usleep(INITIAL_SHORT_SLEEP_US);
 			/*
 			 * We assume that the worst case I/O speed is around
-			 * 5MB/s which is roughly 5 bytes per 1 us, which gives
+			 * 5MB/s which is roughly 5 bytes per 1 us and we
+			 * allow additional 25ms for seeks, which gives
 			 * us upper bound for retries that is
-			 * readahead_size/(5 * SHORT_SLEEP_US).
+			 * 5 + readahead_size/(5 * SHORT_SLEEP_US).
 			 *
-			 * We also monitor the cache size increases before and
-			 * after the sleep. With the same assumption about the
-			 * speed we are supposed to read at least 5 *
-			 * SHORT_SLEEP_US bytes during that time. That amound
-			 * is genreally quite close a page size so that we just
-			 * assume that we sould continue as long as the cache
-			 * increases.
-			 *
-			 * Of course all of this is inprecise on multitasking
-			 * OS however even on a system where there are several
-			 * processes figthing for I/O this loop will wait as
-			 * long a cache is increasing which will gives us high
-			 * chance of waiting for the readahead to happen.
+			 * We also monitor the cache size and exit the wait
+			 * loop early if it increases by at least 50%
+			 * of the read ahead size.
 			 */
-			cached_cur = get_file_cached_bytes(fname, fsize);
 			int retries = readahead_length / (5 * SHORT_SLEEP_US);
 
-			tst_res(TDEBUG, "Per-file cached: %lu kB", cached_cur / 1024);
+			retries = MAX(retries + 5, MIN_RETRY_LIMIT);
 
 			do {
 				usleep(SHORT_SLEEP_US);
+				cache_diff = get_file_cached_bytes(fname,
+					fsize) - (ssize_t)cached_prev;
 
-				cached_prev = cached_cur;
-				cached_cur = get_file_cached_bytes(fname, fsize);
-
-				if (cached_cur <= cached_prev)
+				if (cache_diff >= readahead_length / 2)
 					break;
 			} while (retries-- > 0);
 
-- 
2.52.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
