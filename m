Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F813D1F62
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jul 2021 09:55:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 059F43C61CD
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jul 2021 09:55:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D80F83C5E5D
 for <ltp@lists.linux.it>; Thu, 22 Jul 2021 09:55:22 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 33992140111C
 for <ltp@lists.linux.it>; Thu, 22 Jul 2021 09:55:21 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8CB8122590;
 Thu, 22 Jul 2021 07:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626940521;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oNZztyLJT2PjVF9gToDEGS6lL9XkfUC8I0HVLxc+K6U=;
 b=sPYwWUDNrRt3h7XjPupBtVeYBIS08Zu6TS0xXd/3gjkQG7n0blJ1dVuuCEeyLnAKiPtpsU
 TmcEiDsw8noMCELhm7e6QsGe76mogAJSNjzyZ/tYv52q0zHnomfTD2K/yeKaKPpjyYWTRv
 QGHWruvKhICiihzPDgsJPSi8UvDFLZs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626940521;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oNZztyLJT2PjVF9gToDEGS6lL9XkfUC8I0HVLxc+K6U=;
 b=W908+nFkC4nDaWv/17x9ChjztApPRER3M0fyeCbSIqJXALgFyY7zF0F+0Xswz1d9XbLD8J
 c+dxAKYms2VmbvDw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 50DA1137DE;
 Thu, 22 Jul 2021 07:55:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id eVxcEWkk+WDWDAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Thu, 22 Jul 2021 07:55:21 +0000
Date: Thu, 22 Jul 2021 09:55:19 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <YPkkZ0Zq9DyHKBaT@pevik>
References: <20210712075223.10682-1-aleksei.kodanev@bell-sw.com>
 <20210712075223.10682-2-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210712075223.10682-2-aleksei.kodanev@bell-sw.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] msgget03: don't depend on existed shared
 resources
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

Hi Alexey, Li,

> It's unlikely, but still possible that some of them could be
> created/released during the test as well, so the patch only
> checks errno.

> Signed-off-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
> ---
> v2: * Move the loop to the test run function and try to get
>       ENOSPC errno there.

>  .../kernel/syscalls/ipc/msgget/msgget03.c     | 31 ++++++++++---------
>  1 file changed, 16 insertions(+), 15 deletions(-)

> diff --git a/testcases/kernel/syscalls/ipc/msgget/msgget03.c b/testcases/kernel/syscalls/ipc/msgget/msgget03.c
> index 76cf82cd3..1ade8f942 100644
> --- a/testcases/kernel/syscalls/ipc/msgget/msgget03.c
> +++ b/testcases/kernel/syscalls/ipc/msgget/msgget03.c
> @@ -26,29 +26,30 @@ static key_t msgkey;

>  static void verify_msgget(void)
>  {
> -	TST_EXP_FAIL2(msgget(msgkey + maxmsgs, IPC_CREAT | IPC_EXCL), ENOSPC,
> -		"msgget(%i, %i)", msgkey + maxmsgs, IPC_CREAT | IPC_EXCL);
> +	int res = 0, num;
> +
> +	errno = 0;
> +	for (num = 0; num <= maxmsgs; ++num) {
In different patch [1] (I forget you already send patches to fix this) I counted
items in /proc/sysvipc/shm. Not sure what is safer: <= looks a bit drastic
(how about bug which reports ENOSPC much earlier than it should be?), but
obviously new mapping from other program created in the middle of testing.

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/project/ltp/patch/20210722073523.5099-1-pvorel@suse.cz/
> +		res = msgget(msgkey + num, IPC_CREAT | IPC_EXCL);
> +		if (res == -1)
> +			break;
> +		queues[queue_cnt++] = res;
> +	}
> +
> +	if (res != -1 || errno != ENOSPC)
> +		tst_brk(TFAIL | TERRNO, "Failed to trigger ENOSPC error");
> +
> +	tst_res(TPASS, "Maximum number of queues reached (%d), used by test %d",
> +		maxmsgs, queue_cnt);
>  }
...

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
