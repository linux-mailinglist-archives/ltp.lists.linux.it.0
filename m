Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE153FDDA8
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Sep 2021 16:10:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C2F513C2B78
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Sep 2021 16:10:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A82063C2A05
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 16:10:23 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7F38520090F
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 16:10:22 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AC1EF21E4A;
 Wed,  1 Sep 2021 14:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630505421;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j8R9eBHMdYdWqaFfueNvuRtkGPTb1RZMomKs48/pq7c=;
 b=FDySOHaP2cqkuk6uZqgCm0TIubMsnz6aTlD6abTVy5gkSvCFgarMW1+m0ySPjbGsktgyav
 q8+MUAtO7FOgrZpsRRwIipnnzOlLZ3LrnbSxYaiaLRtZoP4Aj0V7bAxzbgQhfdi604ovjc
 O/HOiMD3rrQP8E6K1TQiQ5NbAr/LrOw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630505421;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j8R9eBHMdYdWqaFfueNvuRtkGPTb1RZMomKs48/pq7c=;
 b=BER4JgU2fAUtwilbba14hCqZlAAnb9qc7dbDjKBrPCLYII2ScOrImSfCKerz6VGgyJsG/E
 QUMK8oWKPvcLqrBw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 8415113AD8;
 Wed,  1 Sep 2021 14:10:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id qfkQHs2JL2HbaAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Wed, 01 Sep 2021 14:10:21 +0000
Date: Wed, 1 Sep 2021 16:10:20 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Dai Shili <daisl.fnst@fujitsu.com>
Message-ID: <YS+JzGce6YVJ3N8T@pevik>
References: <1629200697-14878-1-git-send-email-daisl.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1629200697-14878-1-git-send-email-daisl.fnst@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/pread01: Convert to new API
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Dai,

Reviewed-by: Petr Vorel <pvorel@suse.cz>

with similar notes mentioned at pwrite01 [1].
Thus posting just diff of proposed changes here.

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/project/ltp/patch/1629294657-28375-1-git-send-email-daisl.fnst@fujitsu.com/

diff --git testcases/kernel/syscalls/pread/pread01.c testcases/kernel/syscalls/pread/pread01.c
index fc773f45c..d11ca58f8 100644
--- testcases/kernel/syscalls/pread/pread01.c
+++ testcases/kernel/syscalls/pread/pread01.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
+ * Copyright (c) Linux Test Project, 2021
  * Copyright (c) International Business Machines  Corp., 2001
  * 07/2001 Ported by Wayne Boyer
  */
@@ -7,10 +8,9 @@
 /*\
  * [Description]
  *
- *  Verify the functionality of pread() by writing known data using pwrite()
- *  to the file at various specified offsets and later read from the file from
- *  various specified offsets, comparing the data read aganist the data
- *  written.
+ * Verify the functionality of pread() by writing known data using pwrite()
+ * to the file at various specified offsets and later read from the file from
+ * various specified offsets, comparing the data read against the data written.
  */
 
 #include <stdlib.h>
@@ -26,8 +26,8 @@
 #define NBUFS           4
 
 static int fildes;
-char *write_buf[NBUFS];
-char *read_buf[NBUFS];
+static char *write_buf[NBUFS];
+static char *read_buf[NBUFS];
 
 static void l_seek(int fdesc, off_t offset, int whence, off_t checkoff)
 {
@@ -59,21 +59,16 @@ static void compare_bufers(void)
 static void verify_pread(void)
 {
 	SAFE_PREAD(1, fildes, read_buf[2], K1, K2);
-
 	l_seek(fildes, 0, SEEK_CUR, K4);
-
 	l_seek(fildes, 0, SEEK_SET, 0);
 
 	SAFE_PREAD(1, fildes, read_buf[3], K1, K3);
-
 	l_seek(fildes, 0, SEEK_CUR, 0);
 
 	SAFE_READ(1, fildes, read_buf[0], K1);
-
 	l_seek(fildes, 0, SEEK_CUR, K1);
 
 	SAFE_PREAD(1, fildes, read_buf[1], K1, K1);
-
 	l_seek(fildes, 0, SEEK_CUR, K1);
 
 	compare_bufers();

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
