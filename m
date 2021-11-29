Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B014610D3
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Nov 2021 10:08:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4A9313C54C2
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Nov 2021 10:08:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 794EB3C2B8D
 for <ltp@lists.linux.it>; Mon, 29 Nov 2021 10:08:05 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 76BA51A00E06
 for <ltp@lists.linux.it>; Mon, 29 Nov 2021 10:08:03 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 613EF212CB;
 Mon, 29 Nov 2021 09:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1638176882; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y7sQQ2iPBAZpcH+KRo3PMImYYRMM3fqYP8RGc7BCCaM=;
 b=LZAaQtoIk1JB2qLRR1JFQnoC1j37uMSQBsf3Q6+IcG1Mv0nK/1EQuP3LJanIv6d/FkLYpR
 bcYWhWfJo13445N7mbaTzaB1g3O9KG0w+kNgqoU0kt4vrzzwW1sWSE3yIrfsOsQ8ky2l3O
 TJMCb6jsG/ehpnLBL+0o6WFR7M1hh8I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1638176882;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y7sQQ2iPBAZpcH+KRo3PMImYYRMM3fqYP8RGc7BCCaM=;
 b=SoLWvMOivS0XpudBd+kM0ICpGt5bsq+W65sOBUfNIKGrU0M6gn7/4ilHUlPKu/vjXmZgp2
 y9nqMCuwWI/LC4AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4C0B9133A7;
 Mon, 29 Nov 2021 09:08:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KY3bEXKYpGFjTAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 29 Nov 2021 09:08:02 +0000
Date: Mon, 29 Nov 2021 10:09:12 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Message-ID: <YaSYuLV+XPW/pQ5/@yuki>
References: <1637832900-4753-1-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1637832900-4753-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/statx01: Add stx_mnt_id check
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
> +static int file_fd = -1;
> +
> +#ifdef HAVE_STRUCT_STATX_STX_MNT_ID
> +static void test_mnt_id(struct statx *buf)
> +{
> +	FILE *file;
> +	char line[PATH_MAX];
> +	int pid;
> +	unsigned int line_mjr, line_mnr, mnt_id;

Shouldn't we check the STATX_MNT_ID bit here before we event attempt to
continue? Otherwise if we compile the test with headers where stx_mnt_id
is defined then run it on old kernel there will be garbage in the
stx_mnt_id field.

> +	file = SAFE_FOPEN("/proc/self/mountinfo", "r");
> +
> +	while (fgets(line, sizeof(line), file)) {
> +		if (sscanf(line, "%d %*d %d:%d", &mnt_id, &line_mjr, &line_mnr) != 3)
> +			continue;
> +
> +		if (line_mjr == buf->stx_dev_major && line_mnr == buf->stx_dev_minor)
> +			break;
> +	}
> +
> +	SAFE_FCLOSE(file);
> +
> +	if (buf->stx_mnt_id == mnt_id)
> +		tst_res(TPASS,
> +			"statx.stx_mnt_id equals to mount_id(%d) in /proc/self/mountinfo",
> +			mnt_id);
> +	else
> +		tst_res(TFAIL,
> +			"statx.stx_mnt_id(%d) is different from mount_id(%d) in /proc/self/mountinfo",
> +			buf->stx_mnt_id, mnt_id);
> +
> +	pid = getpid();
> +	snprintf(line, PATH_MAX, "/proc/%d/fdinfo/%d", pid, file_fd);
> +	TST_ASSERT_FILE_INT(line, "mnt_id:", buf->stx_mnt_id);
> +}
> +#endif
> +
>  static void test_normal_file(void)
>  {
>  	struct statx buff;
> @@ -106,6 +146,11 @@ static void test_normal_file(void)
>  		tst_res(TFAIL, "stx_nlink(%u) is different from expected(1)",
>  			buff.stx_nlink);
>  
> +#ifdef HAVE_STRUCT_STATX_STX_MNT_ID
> +	test_mnt_id(&buff);
> +#else
> +	tst_res(TCONF, "stx_mnt_id was not supported until linux 5.8.");

This is confusing at best, if we end up here we were missing the
structure member during compilation regardless the kernel version.

So this message really should be:

"stx_mnt_id not defined in struct statx"


-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
