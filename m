Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 251DC3FCB15
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 17:56:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 49C143C9A5E
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 17:56:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5E6223C2A05
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 17:55:58 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 03E546008C7
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 17:55:57 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D777A20195;
 Tue, 31 Aug 2021 15:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630425356; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F6CcoEEVpgxqDIV2y8d4Yvak8+6czZNgsGsAF9bGPFE=;
 b=extyI9guY8tpjQUuqWoQdoL6AoX2JakJskbEvAU4/Y1Zp4FuHTnXk5wTEXNjrbBdbUSMJu
 LLlREtEsGwe3LHLUpF7sJ3kPiVpzR31bqbnemG7Ti2KoCiFEPycpep+A7FMCdl4HF8zN10
 pypmiP4RTeE9u6Qi7s7xHb4ulafNMy4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630425356;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F6CcoEEVpgxqDIV2y8d4Yvak8+6czZNgsGsAF9bGPFE=;
 b=1rI2ZmZuuPDyk7mxvSguN9Rzn+YbwN6uFR/JqLtkfBBmnDOxfM0ZKGjKISqPrfvbUMD6tZ
 LtUs6S10ZOusgUDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B38A8139F0;
 Tue, 31 Aug 2021 15:55:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 93prKwxRLmHpNwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 31 Aug 2021 15:55:56 +0000
Date: Tue, 31 Aug 2021 17:55:49 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Dai Shili <daisl.fnst@fujitsu.com>
Message-ID: <YS5RBesRGNvIfaWp@yuki>
References: <YQlIFagVIrWXjmgY@yuki>
 <1629025363-21885-1-git-send-email-daisl.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1629025363-21885-1-git-send-email-daisl.fnst@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/readv02: Convert to new API and merge
 readv03 into readv02
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
Pushed with minor changes, thanks.

- reformatted the documentation comment so that it renders nicely in
  asccidoc

- got rid of the fd array, it's a bit more readable with fd_file and
  fd_dir instead

- simplified setup a bit

Full diff:

diff --git a/testcases/kernel/syscalls/readv/readv02.c b/testcases/kernel/syscalls/readv/readv02.c
index 9a26e50a8..c09e69bc8 100644
--- a/testcases/kernel/syscalls/readv/readv02.c
+++ b/testcases/kernel/syscalls/readv/readv02.c
@@ -7,22 +7,15 @@
  */
 
 /*\
- * DESCRIPTION
- *  test 1:
- *  The sum of the iov_len values overflows an ssize_t value, expect an EINVAL.
+ * [Description]
  *
- *  test 2:
- *  Buf is outside the accessible address space, expect an EFAULT.
+ * Tests readv() failures:
  *
- *  test 3:
- *  The vector count iovcnt is less than zero, expect an EINVAL.
- *
- *  test 4:
- *  The parameter passed to read is a directory, check if the errno is
- *  set to EISDIR.
- *
- *  test 5:
- *  Read with an invalid file descriptor, and expect an EBADF.
+ * - EINVAL the sum of the iov_len values overflows an ssize_t value
+ * - EFAULT buffer is outside the accessible address space
+ * - EINVAL the vector count iovcnt is less than zero
+ * - EISDIR the file descriptor is a directory
+ * - EBADF  the file descriptor is not valid
  */
 
 #include <sys/uio.h>
@@ -34,7 +27,7 @@
 #define CHUNK           64
 
 static int badfd = -1;
-static int fd[2] = {-1, -1};
+static int fd_dir, fd_file;
 static char buf1[K_1];
 const char *TEST_DIR = "test_dir";
 const char *TEST_FILE = "test_file";
@@ -67,10 +60,10 @@ static struct tcase {
 	int count;
 	int exp_error;
 } tcases[] = {
-	{&fd[0], invalid_iovec, 1, EINVAL},
-	{&fd[0], efault_iovec, 3, EFAULT},
-	{&fd[0], large_iovec, -1, EINVAL},
-	{&fd[1], valid_iovec, 1, EISDIR},
+	{&fd_file, invalid_iovec, 1, EINVAL},
+	{&fd_file, efault_iovec, 3, EFAULT},
+	{&fd_file, large_iovec, -1, EINVAL},
+	{&fd_dir, valid_iovec, 1, EISDIR},
 	{&badfd, valid_iovec, 3, EBADF},
 };
 
@@ -84,26 +77,23 @@ static void verify_readv(unsigned int n)
 
 static void setup(void)
 {
-	fd[0] = SAFE_OPEN(TEST_FILE, O_WRONLY | O_CREAT, 0666);
-	SAFE_WRITE(1, fd[0], buf1, CHUNK);
-	SAFE_CLOSE(fd[0]);
+	SAFE_FILE_PRINTF(TEST_FILE, "test");
 
-	fd[0] = SAFE_OPEN(TEST_FILE, O_RDONLY, 0666);
+	fd_file = SAFE_OPEN(TEST_FILE, O_RDONLY);
 
 	efault_iovec[0].iov_base = tst_get_bad_addr(NULL);
 
 	SAFE_MKDIR(TEST_DIR, MODES);
-	fd[1] = SAFE_OPEN(TEST_DIR, O_RDONLY);
+	fd_dir = SAFE_OPEN(TEST_DIR, O_RDONLY);
 }
 
 static void cleanup(void)
 {
-	int i;
+	if (fd_file > 0)
+		SAFE_CLOSE(fd_file);
 
-	for (i = 0; i < 2; i++) {
-		if (fd[i] > 0)
-			SAFE_CLOSE(fd[i]);
-	}
+	if (fd_dir > 0)
+		SAFE_CLOSE(fd_dir);
 }
 
 static struct tst_test test = {

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
