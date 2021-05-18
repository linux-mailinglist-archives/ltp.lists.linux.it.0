Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A4B387191
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 08:03:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EAF1A3C6013
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 08:03:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 26F7B3C1E1D
 for <ltp@lists.linux.it>; Tue, 18 May 2021 08:02:59 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 88BF71000D22
 for <ltp@lists.linux.it>; Tue, 18 May 2021 08:02:58 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 99AB4ADDB;
 Tue, 18 May 2021 06:02:57 +0000 (UTC)
Date: Tue, 18 May 2021 08:02:56 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <YKNYkNOqsmhv9kSJ@pevik>
References: <20210517085637.16866-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210517085637.16866-1-aleksei.kodanev@bell-sw.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] network/lib6/getaddrinfo01: rewrite with the new
 API + use static hostnames
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

Hi Alexey,

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Moving everything to /etc/hosts based setup is a great idea
as we get rid of network setup related failures.

Do we lost any getaddrinfo() test coverage for bypassing DNS?

Just a few unimportant nits below (feel free to ignore them).
Again, I'd be for merging this before release.

> The test is now independent of various machine settings
> regarding the test host name as it adds predefined names
> and aliases to /etc/hosts file and restores it to its
> original state after completing the test.

> This should fix the following failures:
> * when gethostname() returns an alias name that doesn't
>   match canonical name;
> * No AAAA record for the returned name from gethostname().

> Addresses and names added to /etc/hosts are more or less
> unique, so that there are no conflicts with the existing
> configuration.
We might want to put this into docparse documentation, e.g:

/*\
 * [Description]
 *
 * Basic getaddrinfo() tests.
 *
 * Test use LTP specific addresses and names added to /etc/hosts to avoid
 * problems with DNS and hostname setup or conflicts with existing
 * configuration.
 */

> Also most of the duplicate code is now gone.

> Signed-off-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
> ---
>  testcases/network/lib6/getaddrinfo_01.c | 1140 +++++------------------
>  1 file changed, 235 insertions(+), 905 deletions(-)

> diff --git a/testcases/network/lib6/getaddrinfo_01.c b/testcases/network/lib6/getaddrinfo_01.c
> index db252a998..23a279ed1 100644

...
> +static void gaiv(void)
> +{
> +	check_addrinfo(1, "basic lookup", hostname, 0, NULL, 0, 0, 0, NULL);
> +	check_addrinfo_name("canonical name");

...
> +	check_addrinfo(1, "host+service", hostname, 7, "echo", 0, 0, 0, NULL);
> +
> +	check_addrinfo(1, "host+service, AI_PASSIVE", hostname, 9462, "9462",
> +		       AI_PASSIVE, SOCK_STREAM, 0, test_passive);
> +
> +	check_addrinfo(0, "host+service, AI_NUMERICHOST", hostname, 7, "echo",
> +		       AI_NUMERICHOST, SOCK_STREAM, 0, NULL);
> +	if (TST_RET != EAI_NONAME)
> +		tst_brk(TFAIL, "AI_NUMERICHOST: ret %ld exp %d (EAI_NONAME)",
> +			TST_RET, EAI_NONAME);
> +	tst_res(TPASS, "AI_NUMERICHOST: exp %ld (EAI_NONAME)", TST_RET);
> +
> +	check_addrinfo(1, "0+service, AI_PASSIVE", NULL, 9462, "9462",
> +		       AI_PASSIVE, SOCK_STREAM, 0, test_passive_no_host);
> +
> +	check_addrinfo(0, "0+service", NULL, 9462, "9462",
> +		       0, SOCK_STREAM, 0, test_loopback);
> +	if (TST_RET == EAI_BADFLAGS) {
> +		tst_res(TPASS, "0+service ('', '9462') returns %ld '%s'",
> +			TST_RET, gai_strerror(TST_RET));
> +	} else if (TST_RET) {
> +		tst_brk(TFAIL, "0+service ('', '9462') returns %ld '%s'",
> +			TST_RET, gai_strerror(TST_RET));
>  	}
nit: Maybe having check_addrinfo_badflags() which would do the verification
would safe few lines of code duplicity.

...
> -	/* test 16, IPv6 host+service w/ AI_NUMERICHOST */
> -	memset(&hints, 0, sizeof(hints));
> -	strcpy(service, "echo");
> -	servnum = 7;
> -	hints.ai_family = AF_INET6;
> -	hints.ai_flags = AI_NUMERICHOST;
> -	TEST(getaddrinfo(hostname, service, &hints, &aires));
> -	if (TEST_RETURN != EAI_NONAME) {
> -		tst_resm(TFAIL, "getaddrinfo IPv6 AI_NUMERICHOST w/ hostname: "
> -			 "returns %ld expected %d (EAI_NONAME)",
> -			 TEST_RETURN, EAI_NONAME);
> -		if (!TEST_RETURN)
> -			freeaddrinfo(aires);
> -		return;
> +	check_addrinfo(0, "SOCK_STREAM/IPPROTO_UDP", NULL, 0, NULL, 0,
> +		       SOCK_STREAM, IPPROTO_UDP, NULL);
> +	if (!TST_RET)
> +		tst_brk(TFAIL, "SOCK_STREAM/IPPROTO_UDP: unexpected pass");
> +	tst_res(TPASS, "SOCK_STREAM/IPPROTO_UDP: failed as expected");
> +
> +	check_addrinfo(0, "socktype 0, 513", NULL, 513, "513", 0, 0, 0, NULL);
And here also check_addrinfo_badflags() (if implemented)
and nit: "socktype 0,513" (remove space)

> +	if (TST_RET == EAI_BADFLAGS) {
> +		tst_res(TPASS, "socktype 0,513 returns %ld '%s'",
> +			TST_RET, gai_strerror(TST_RET));
> +	} else if (TST_RET) {
> +		tst_brk(TFAIL, "socktype 0,513 returns %ld '%s'",
> +			TST_RET, gai_strerror(TST_RET));
>  	}

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
