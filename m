Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2481064B3B3
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Dec 2022 12:04:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 684913CBDC2
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Dec 2022 12:04:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8CEDF3CBD88
 for <ltp@lists.linux.it>; Tue, 13 Dec 2022 12:04:01 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C25C014000AA
 for <ltp@lists.linux.it>; Tue, 13 Dec 2022 12:04:00 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id AF5021FE3B;
 Tue, 13 Dec 2022 11:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1670929439;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M6QixGJqdTXTlIjePqe1D1LaA8dDnl6r8Dk7alURq74=;
 b=cbrKgCvtr08WArZ93VKVhj2oITDgMH32+xee/o4sXCOuVzm/3ro7c3CkQK3QV84mw9p97z
 4g0wzvOCQ6plV4lDQ0+Rlj5HGtK/4XtuvmdCQIMmUfSqgAIF0/NVFd4bYpoQq+gtpb2YjY
 qasA1pNzmAZ1wtLLWjsu65dUaAVe74g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1670929439;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M6QixGJqdTXTlIjePqe1D1LaA8dDnl6r8Dk7alURq74=;
 b=CCvEGaIsbKyD3Rv1L7lL9hZ1UXNSPTfEJUF5UyI92cAG7zygHSS8LWng/IknpEbIcLqaPZ
 qObAsevmAmC4+kCA==
Received: from g78 (unknown [10.163.17.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 7282A2C141;
 Tue, 13 Dec 2022 11:03:59 +0000 (UTC)
References: <1670901258-1995-1-git-send-email-xuyang2018.jy@fujitsu.com>
User-agent: mu4e 1.8.11; emacs 28.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Date: Tue, 13 Dec 2022 10:59:17 +0000
Organization: Linux Private Site
In-reply-to: <1670901258-1995-1-git-send-email-xuyang2018.jy@fujitsu.com>
Message-ID: <87y1rbr2e9.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/statx01: Add exit condition when
 parsing /proc/self/mountinfo
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Yang Xu <xuyang2018.jy@fujitsu.com> writes:

> When using user filesystem such as overlayfs, the current parsing way can't
> work well.
>
> 63 66 8:3 / /sysroot rw,relatime - ext4 /dev/sda3 rw,seclabel
> 43 66 8:3 /ostree/deploy/rhivos/var /var rw,relatime shared:3 - ext4 /dev/sda3 rw,seclabel
>
> So add the exit condition for statx.mnt_id check so it can skip the
> underflying filesystem and parse the correct user fileystem's mnt_id.
>
> Fixes: #1001
> Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
> ---
> v1-v2: change the fail message
>  testcases/kernel/syscalls/statx/statx01.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/statx/statx01.c b/testcases/kernel/syscalls/statx/statx01.c
> index 60b50958b..e9677475a 100644
> --- a/testcases/kernel/syscalls/statx/statx01.c
> +++ b/testcases/kernel/syscalls/statx/statx01.c
> @@ -68,7 +68,8 @@ static void test_mnt_id(struct statx *buf)
>  		if (sscanf(line, "%"SCNu64" %*d %d:%d", &mnt_id, &line_mjr, &line_mnr) != 3)
>  			continue;
>  
> -		if (line_mjr == buf->stx_dev_major && line_mnr == buf->stx_dev_minor)
> +		if (line_mjr == buf->stx_dev_major && line_mnr == buf->stx_dev_minor &&
> +				mnt_id == buf->stx_mnt_id)
>  			break;
>  	}
>  
> @@ -80,8 +81,8 @@ static void test_mnt_id(struct statx *buf)
>  			mnt_id);
>  	else
>  		tst_res(TFAIL,
> -			"statx.stx_mnt_id(%"PRIu64") is different from mount_id(%"PRIu64") in /proc/self/mountinfo",
> -			(uint64_t)buf->stx_mnt_id, mnt_id);
> +			"statx.stx_mnt_id(%"PRIu64") doesn't exist in /proc/self/mountinfo",
> +			(uint64_t)buf->stx_mnt_id);

The mnt_id may exist in mountinfo, but not the triple (mnt_id,
dev_major, dev_minor). So really we should print all three here (unless
we already display that somewhere else).

>  
>  	pid = getpid();
>  	snprintf(line, PATH_MAX, "/proc/%d/fdinfo/%d", pid, file_fd);
> -- 
> 2.27.0


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
