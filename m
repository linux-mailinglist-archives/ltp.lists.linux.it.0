Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDC463AC04
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Nov 2022 16:16:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 473013CC677
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Nov 2022 16:16:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A13FF3C32D9
 for <ltp@lists.linux.it>; Mon, 28 Nov 2022 16:16:21 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 941631400337
 for <ltp@lists.linux.it>; Mon, 28 Nov 2022 16:16:19 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 99ADE1F8BE;
 Mon, 28 Nov 2022 15:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1669648578;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RwYU8f1GCbJIBuJiZgzS1gwT+KGDiDQs8Gw9YEpCfZM=;
 b=MtWqTCfOalTPrOWU4wiHe9sXDVGgB8b3UVu+hw7LnZA5ku7E6JddsmYxuS+cchjs7hgrN5
 S7iW8kkVOfThzdtQhP9eIwP4oxA3q/Hpg+sqTcNNQ+U9QRTg7ps4Sqi+uaVxuuZ1rtpuqG
 G9JcTebzOf3wFLsxSmp/y3PTllIpJfA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1669648578;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RwYU8f1GCbJIBuJiZgzS1gwT+KGDiDQs8Gw9YEpCfZM=;
 b=yk0qsArL8eLk9eSl2ggw400mwvpmdhIei7VlHkkOpAaQ0ErRO5I4KjRZ97gdnX6IDYsSJ7
 0/u/ydkylRCKDABA==
Received: from g78 (unknown [10.163.28.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 691A82C141;
 Mon, 28 Nov 2022 15:16:18 +0000 (UTC)
References: <1668999635-2018-1-git-send-email-xuyang2018.jy@fujitsu.com>
User-agent: mu4e 1.8.11; emacs 28.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Date: Mon, 28 Nov 2022 15:16:09 +0000
Organization: Linux Private Site
In-reply-to: <1668999635-2018-1-git-send-email-xuyang2018.jy@fujitsu.com>
Message-ID: <878rjvun26.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/setfsuid: Use SETFSUID instead of
 setfsuid to check 32bit syscall
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

Merged, Thanks!

Yang Xu <xuyang2018.jy@fujitsu.com> writes:

> Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
> ---
>  testcases/kernel/syscalls/setfsuid/setfsuid01.c | 4 ++--
>  testcases/kernel/syscalls/setfsuid/setfsuid03.c | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/setfsuid/setfsuid01.c b/testcases/kernel/syscalls/setfsuid/setfsuid01.c
> index 0cbf101ee..9805e38b6 100644
> --- a/testcases/kernel/syscalls/setfsuid/setfsuid01.c
> +++ b/testcases/kernel/syscalls/setfsuid/setfsuid01.c
> @@ -34,8 +34,8 @@ static void run(void)
>  	UID16_CHECK(uid, setfsuid);
>  
>  	SAFE_SETEUID(0);
> -	TST_EXP_VAL(setfsuid(nobody_uid), uid, "setfsuid(%d)", nobody_uid);
> -	TST_EXP_VAL(setfsuid(-1), nobody_uid);
> +	TST_EXP_VAL(SETFSUID(nobody_uid), uid, "setfsuid(%d)", nobody_uid);
> +	TST_EXP_VAL(SETFSUID(-1), nobody_uid);
>  }
>  
>  static struct tst_test test = {
> diff --git a/testcases/kernel/syscalls/setfsuid/setfsuid03.c b/testcases/kernel/syscalls/setfsuid/setfsuid03.c
> index 02698f7cf..ee06e9376 100644
> --- a/testcases/kernel/syscalls/setfsuid/setfsuid03.c
> +++ b/testcases/kernel/syscalls/setfsuid/setfsuid03.c
> @@ -36,8 +36,8 @@ static void run(void)
>  	SAFE_SETEUID(nobody_uid);
>  	UID16_CHECK(ruid, setfsuid);
>  
> -	TST_EXP_VAL_SILENT(setfsuid(ruid), nobody_uid);
> -	TST_EXP_VAL(setfsuid(-1), ruid, "setfsuid(fsuid) by non-root user:");
> +	TST_EXP_VAL_SILENT(SETFSUID(ruid), nobody_uid);
> +	TST_EXP_VAL(SETFSUID(-1), ruid, "setfsuid(fsuid) by non-root user:");
>  }
>  
>  static struct tst_test test = {
> -- 
> 2.27.0


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
