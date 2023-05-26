Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 60232712830
	for <lists+linux-ltp@lfdr.de>; Fri, 26 May 2023 16:25:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 378223CD181
	for <lists+linux-ltp@lfdr.de>; Fri, 26 May 2023 16:25:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 979C23C995F
 for <ltp@lists.linux.it>; Fri, 26 May 2023 16:25:51 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id F41BB600D21
 for <ltp@lists.linux.it>; Fri, 26 May 2023 16:25:50 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D236B1FD76;
 Fri, 26 May 2023 14:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1685111149;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PUa/YoSa5krRx265/570CJieGksWRw4xXXtIHv+UlwI=;
 b=IgoVNHx1+iJ44uJHv4OvZbaIdwmtYOOfTZUihGWtJmcXCo4IE7Zbv877XP0zDnQV8XzNcP
 HurzUpLN5+QugM6bH64OO+qQzjYagaIDTRILvlWuIKptmz+vu8XSuYuPVOgIOMSL7IkXuy
 dkGg6BR+edII+dsjc1nwp76svHO2CBo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1685111149;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PUa/YoSa5krRx265/570CJieGksWRw4xXXtIHv+UlwI=;
 b=2BFER552F3l2kOHKxUf8XvuXTQAfesvJC20XD7homQCTSyvMXMBaktKnjnx5a/nwFbmKXn
 Q8K15SJvJwq34vAg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 704CD134AB;
 Fri, 26 May 2023 14:25:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id TQuEFG3BcGRJeAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Fri, 26 May 2023 14:25:49 +0000
Date: Fri, 26 May 2023 16:25:47 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20230526142547.GA812267@pevik>
References: <20230525080934.54793-1-liwang@redhat.com>
 <20230525080934.54793-2-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230525080934.54793-2-liwang@redhat.com>
X-Virus-Scanned: clamav-milter 1.0.1 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] cleanup: changing FILE_PRINTF to
 SAFE_FILE_PRINTF
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

Hi Li,

> SAFE_MACROS() used in cleanup do not exit the test anymore since:
> commit 6440c5d0d15 (newlib: Allow SAFE_MACROS to be called from cleanup)

> Signed-off-by: Li Wang <liwang@redhat.com>
> ---
>  testcases/kernel/device-drivers/cpufreq/cpufreq_boost.c | 4 ++--
>  testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget03.c  | 2 +-
>  testcases/kernel/syscalls/fcntl/fcntl33.c               | 2 +-
>  testcases/kernel/syscalls/readahead/readahead02.c       | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)

> diff --git a/testcases/kernel/device-drivers/cpufreq/cpufreq_boost.c b/testcases/kernel/device-drivers/cpufreq/cpufreq_boost.c
> index 67917b3fe..0a56519a1 100644
> --- a/testcases/kernel/device-drivers/cpufreq/cpufreq_boost.c
> +++ b/testcases/kernel/device-drivers/cpufreq/cpufreq_boost.c
> @@ -78,10 +78,10 @@ static void check_set_turbo(char *file, char *off)

>  static void cleanup(void)
>  {
> -	FILE_PRINTF(cdrv[id].file, "%d", boost_value);
> +	SAFE_FILE_PRINTF(cleanup, cdrv[id].file, "%d", boost_value);

testcases/kernel/device-drivers/cpufreq/cpufreq_boost.c uses old API,
IMHO not affected by 6440c5d0d15. Therefore we should postpone this till it's
converted to the new API.

The rest LGTM.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
