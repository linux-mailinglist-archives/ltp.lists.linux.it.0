Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CF914CE1B
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jan 2020 17:20:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7C9DB3C2433
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jan 2020 17:20:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 707923C23E6
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 17:20:00 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B8B6D601F17
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 17:19:59 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B1644AD5D;
 Wed, 29 Jan 2020 16:19:58 +0000 (UTC)
Date: Wed, 29 Jan 2020 17:19:57 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Pengfei Xu <pengfei.xu@intel.com>
Message-ID: <20200129161957.GF22477@rei.lan>
References: <20191220092529.3239-1-pengfei.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191220092529.3239-1-pengfei.xu@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 1/4] lib/tst_kconfig.c: add any kconfig with or
 without expected value function
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
Cc: Su Heng <heng.su@intel.com>, Neri Ricardo <ricardo.neri@intel.com>,
 ltp <ltp@lists.linux.it>, Kasten Robert <robert.a.kasten@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
>  	for (i = 0; i < cnt; i++) {
>  		const char *val = strchr(kconfigs[i], '=');
> @@ -176,12 +177,9 @@ void tst_kconfig_read(const char *const *kconfigs,
>  			tst_brk(TBROK, "Invalid config string '%s'", kconfigs[i]);
>  
>  		matches[i].match = 0;
> -		matches[i].len = strlen(kconfigs[i]);
>  
> -		if (val) {
> +		if (val)
>  			matches[i].val = val + 1;
> -			matches[i].len -= strlen(val);
> -		}
>  
>  		results[i].match = 0;
>  		results[i].value = NULL;
> @@ -193,17 +191,29 @@ void tst_kconfig_read(const char *const *kconfigs,
>  
>  	while (fgets(buf, sizeof(buf), fp)) {
>  		for (i = 0; i < cnt; i++) {
> -			if (match(&matches[i], kconfigs[i], &results[i], buf)) {
> -				for (j = 0; j < cnt; j++) {
> -					if (matches[j].match)
> -						break;
> +			memset(kconfig_multi, 0, sizeof(kconfig_multi));
> +			/* strtok_r will split kconfigs[i] to multi string, so copy it */
> +			memcpy(kconfig_multi, kconfigs[i], strlen(kconfigs[i]));
> +			kconfig_token = strtok_r(kconfig_multi, "|=", &p_left);
> +
> +			while (kconfig_token != NULL) {
> +				if (strncmp("CONFIG_", kconfig_token, 7))
> +					tst_brk(TBROK, "Invalid config string '%s'", kconfig_token);
> +				matches[i].len = strlen(kconfig_token);
> +				if (match(&matches[i], kconfig_token, &results[i], buf)) {
> +					for (j = 0; j < cnt; j++) {
> +						if (matches[j].match)
> +							break;
> +					}
> +					if (j == cnt)
> +						goto exit;

I do not think that this actually works correctly. One of the problems I
see is that we do match only the CONFIG_FOO part in the
tst_kconfig_read() and the result value is evaluated later on. This
means that if we had something as "CONFIG_FOO=5|CONFIG_FOO=4" the code
will pick up only the first occurence of the = and we would end up doing
strcmp("4", "5|CONFIG_FOO=4") which would fail as well.

If we wanted to have proper solution for logic statements inside of the
kconfig parser we would have to isolate the CONFIG_FOO names first, pass
them to the tst_kconfig_read() function, that would get us values for
all config variables we need, then we could split the configs strings
greadily on | and evaluate them one after another.

So the first function would have to be able to get arrays of strings and
return another array of strings isolating the CONFIG_FOO variables. That
would be passed to tst_kconfig_read() that would yield results[] array,
for all interesting variables. From that point we can split the kconfig
strings by | and evaluate one after another until we get match or end of
the string.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
