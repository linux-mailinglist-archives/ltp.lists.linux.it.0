Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CE93A9D4C
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 16:15:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 21A683C65EF
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 16:15:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7FC4C3C3106
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 16:15:30 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id F35DB6013CB
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 16:15:29 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5D2A621A2C;
 Wed, 16 Jun 2021 14:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623852929;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xwaMFIEAXwoSjTJQXpL5S7ZhHVkE0v579XX9ZLC1cvI=;
 b=cDubbssh8tv7tKzxKNbvPHxnyyqD0GgchcusPuwF03kHBNQuZUuYSh8wCayL3/Eh7mbdAe
 OXDo2gNywkfyAZw45p9Py55MJHtssBK4yfoW+FNshSPs2hL4xJNdbkWI9VWcXfAYZOtPT7
 9y12jOtGLK3EwgYKpOCVpAmGEGrs1Wk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623852929;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xwaMFIEAXwoSjTJQXpL5S7ZhHVkE0v579XX9ZLC1cvI=;
 b=U5kh10SCkCD2Tgn+zAHEDCq/bRxHBNxfvRYYBLuJJvsp6/YrMlfpQFEvIduaRJDT7MLjQ2
 pZg1FMY8GSKfcuAw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 2FB2D118DD;
 Wed, 16 Jun 2021 14:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623852929;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xwaMFIEAXwoSjTJQXpL5S7ZhHVkE0v579XX9ZLC1cvI=;
 b=cDubbssh8tv7tKzxKNbvPHxnyyqD0GgchcusPuwF03kHBNQuZUuYSh8wCayL3/Eh7mbdAe
 OXDo2gNywkfyAZw45p9Py55MJHtssBK4yfoW+FNshSPs2hL4xJNdbkWI9VWcXfAYZOtPT7
 9y12jOtGLK3EwgYKpOCVpAmGEGrs1Wk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623852929;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xwaMFIEAXwoSjTJQXpL5S7ZhHVkE0v579XX9ZLC1cvI=;
 b=U5kh10SCkCD2Tgn+zAHEDCq/bRxHBNxfvRYYBLuJJvsp6/YrMlfpQFEvIduaRJDT7MLjQ2
 pZg1FMY8GSKfcuAw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id oaWaCYEHymCcVAAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Wed, 16 Jun 2021 14:15:29 +0000
Date: Wed, 16 Jun 2021 16:15:27 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YMoHf/mwjDXkCdJH@pevik>
References: <20210603033611.15619-1-xieziyao@huawei.com>
 <20210603033611.15619-2-xieziyao@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210603033611.15619-2-xieziyao@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] syscalls/sendfile: Convert sendfile02 to the
 new API
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

> 1. Convert sendfile02 to the new API with file descriptors instead
> of socket descriptors.
> 2. Remove the support for UCLINUX.
> 3. Remove redundant testcases {4, 22, 26} and {6, 20, 26}.

Thanks, merged with diff below (fix docparse formatting, add OFFSET_DESC()
macro, fix checkpatch.pl warning on comparison order).

Kind regards,
Petr

diff --git testcases/kernel/syscalls/sendfile/sendfile02.c testcases/kernel/syscalls/sendfile/sendfile02.c
index 820063681..ffd654885 100644
--- testcases/kernel/syscalls/sendfile/sendfile02.c
+++ testcases/kernel/syscalls/sendfile/sendfile02.c
@@ -9,7 +9,8 @@
 /*\
  * [Description]
  *
- * Test the basic functionality of the sendfile() system call,
+ * Test the basic functionality of the sendfile() system call:
+ *
  * 1. Call sendfile() with offset = 0.
  * 2. Call sendfile() with offset in the middle of the file.
  */
@@ -23,6 +24,8 @@
 #define IN_FILE "in_file"
 #define OUT_FILE "out_file"
 
+#define OFFSET_DESC(x) .desc = "with offset = "#x, .offset = x
+
 struct test_case_t {
 	char *desc;
 	off_t offset;
@@ -30,8 +33,8 @@ struct test_case_t {
 	int64_t exp_retval;
 	int64_t exp_updated_offset;
 } tc[] = {
-	{ "with offset = 0", 0, 26, 26, 26 },
-	{ "with offset = 2", 2, 24, 24, 26 },
+	{ OFFSET_DESC(0), 26, 26, 26 },
+	{ OFFSET_DESC(2), 24, 24, 26 },
 };
 
 static void setup(void)
@@ -60,7 +63,7 @@ static void run(unsigned int i)
 	TEST(sendfile(out_fd, in_fd, &offset, tc[i].count));
 	after_pos = SAFE_LSEEK(in_fd, 0, SEEK_CUR);
 
-	if (TST_RET != tc[i].exp_retval)
+	if (tc[i].exp_retval != TST_RET)
 		tst_res(TFAIL, "sendfile() failed to return expected value, "
 			       "expected: %" PRId64 ", got: %ld",
 			tc[i].exp_retval, TST_RET);

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
