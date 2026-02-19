Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCIkLvLZlmlJpgIAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Feb 2026 10:37:54 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 409EE15D68A
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Feb 2026 10:37:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1771493873; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=TD63KYi5rbeH++fwu4YnJFc1e8z6X8ua+Kelq57+dEA=;
 b=gllfQ7Bsg0oHFbQWEV4vQO8bPQPKITPuoL9BWK4jwsj1NmGdoIf3RY7Cw/rHRgdtBxb6h
 6vKFWAJNZMJ3Yowd+kn7NJen+eTZImhETS613kjVc+yr87qU3NDXO3jspHk/aWEAVXOyrBV
 xqGqXKdiogPSMQRWPx/xvn9+62Pdz3Y=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C13D83D072F
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Feb 2026 10:37:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 845D13CBBF1
 for <ltp@lists.linux.it>; Thu, 19 Feb 2026 10:37:40 +0100 (CET)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id CA002100049E
 for <ltp@lists.linux.it>; Thu, 19 Feb 2026 10:37:35 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-4376acce52eso439735f8f.1
 for <ltp@lists.linux.it>; Thu, 19 Feb 2026 01:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1771493855; x=1772098655; darn=lists.linux.it;
 h=in-reply-to:references:subject:to:from:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zlOZXYJ+6nXbvhQwJ8l577KVXWTPUg2s+74KomBenXw=;
 b=fipBFpjJtJvqY816i0zyIO6lP5uEzTtz3AymCCrJoC8CcFotrlQAYZQbjtZtT/AVet
 gDdekuELu5zmjLEkyZOex4dNjp4Ksbe8POSBSInr87SL0AIhg/o8WzbcwhmFSwe8Zy+2
 mWSkq7lmaI2Zs8u0/w66LxyUV6PqGDDdoPq0LNOuHYI74kk6DtzRU1Lk9GqXjWv/JC7k
 Nbx1nLjlBvz5EAonaOni3TqbJeuEd7riuVR/WOScC9QJPyJsSRUI+MOKfEenf/r+3GUW
 QvXnWb/nU/KLbe7MjxyRXh4nUjJtl+o3XDGpQQKIf3Bucu/CaDwY55zivbZq/M2dKLB2
 lAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771493855; x=1772098655;
 h=in-reply-to:references:subject:to:from:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zlOZXYJ+6nXbvhQwJ8l577KVXWTPUg2s+74KomBenXw=;
 b=OF/Bs1H+M4nqzZZJZ354B2/ANAC61SVOMfuTiAShcLaSMCB+CbdckTfaDqm659fBtp
 eMrrxaX6Od/GRH9P2B9fQIXUOVej6yYavhn5HryN9WGQcqX/wJVVYFQqO9So/bz4wKpZ
 aJ2UkEH/sfitttO7eeOB4sv+sdARdh955qR9j1kphrxZm+EbzU5fVNJdNgk0FMGqUH/r
 GnexWbMqeGFrqw/Wuqz6wOdtrIIU7YESRVWtLqDhSMUSUtT1M49wRhEJOvtpR+X1HNyD
 JfG4wCqqbBXa6AC+tyT5qA7PCWi44fhcvE6goNWATjhXWpJXNpJ3UnymDA3+sVl1j9b+
 LZuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8kHqXPMcG6xgDXkmVI/p4turXZDu9JylT6eKkfJzU4s2PCdLQtDMPEx/3+f5ifIL6G7Q=@lists.linux.it
X-Gm-Message-State: AOJu0YxaDMhYySyl73eYWlvP7fcA4Z587cIp+YFsP4EgiZ8EqxkN0vU3
 XWAu2Tq8Kgc+XBNLijXWcpSsY6bZDerjeCwr41WPvGhL2u04rGI8wgqnvQxvNMSFjmMkbxWRoOF
 8cmGL
X-Gm-Gg: AZuq6aKWd7MU++KAykduJfUwuggzy31zsZFWLHEL//D8jjFO5MdABoZkc8G3b1N6XdC
 gio7RZ1Sl1GvK2wuRknxAT49sCCz7finsxyyjbjWGjuRT/XzGk7HBux7aTXXId3xYfcUlC2zB5z
 lqQHsesUHo9Ua0jaj+TnpAE+4JrMQ/N1zFIWvAKe5KGiOfAdiJUU6T1LjDBR3uOIZ6Zzi5Oie4m
 /zLiveVS4PZn/Eqz6IaCBAc8IHPTHWacNOdjyf0/jOYBIpvg6t2mRtjGQw5GOaEWCFdUe+VppMZ
 Oo0Bma8AdqOzLN5QqwNGvp8Wl10B4AhOnXIP0rHLzQ6ZMJJHSk99BFeF2NRzJ0ehw7NbaG5cjPu
 sV8TfeLSXBCeWs6veDFTifcFSsU/5Xoy4oo9zHCcH4Qv/kcEMcPPwGegAuLeEUL6MnYSZjiZcWS
 w4dZVK/8KQsEVFAFEs6KOkXNC8s9ptt4Sn4Yu6yBHVqK8DSrcyWaEZ25jRjPARqpBwcOgdN2MAj
 Aeu9pqgbzVMnUVolEmdn1LOQNFbNQ==
X-Received: by 2002:a05:6000:3103:b0:435:94aa:df3c with SMTP id
 ffacd0b85a97d-43958e54d36mr8040296f8f.61.1771493855019; 
 Thu, 19 Feb 2026 01:37:35 -0800 (PST)
Received: from localhost
 (p200300ef2f4fc9009ff26ae1d4042002.dip0.t-ipconnect.de.
 [2003:ef:2f4f:c900:9ff2:6ae1:d404:2002])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439567aad3csm13767569f8f.36.2026.02.19.01.37.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Feb 2026 01:37:34 -0800 (PST)
Mime-Version: 1.0
Date: Thu, 19 Feb 2026 10:37:34 +0100
Message-Id: <DGIU5TUBY8DA.1O11NEVRMZTZK@suse.com>
To: "Jinseok Kim" <always.starving0@gmail.com>, <ltp@lists.linux.it>
X-Mailer: aerc 0.18.2
References: <20260218144747.2771-1-always.starving0@gmail.com>
In-Reply-To: <20260218144747.2771-1-always.starving0@gmail.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2 1/2] open: fix cleanup condition and use
 snprintf
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.linux.it];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,suse.com:replyto,picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: 409EE15D68A
X-Rspamd-Action: no action

Hi!

On Wed Feb 18, 2026 at 3:47 PM CET, Jinseok Kim wrote:
> Replace remaining sprintf() with snprintf() in setup()
>
> Thanks for the review.

Again, there's something wrong with your automated system. Is it LLM? :-)
The message is misleading, also because not only snprintf() touched, but
also cleanup() logic.

This has to be fixed, otherwise patch can't be accepted.

>
> Signed-off-by: Jinseok Kim <always.starving0@gmail.com>
> ---
>  testcases/kernel/syscalls/open/open04.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/open/open04.c b/testcases/kernel/syscalls/open/open04.c
> index 3dc3486d3..5d39c1569 100644
> --- a/testcases/kernel/syscalls/open/open04.c
> +++ b/testcases/kernel/syscalls/open/open04.c
> @@ -30,7 +30,7 @@ static void setup(void)
>  	fds[0] = first;
>
>  	for (i = first + 1; i < fds_limit; i++) {
> -		sprintf(fname, FNAME ".%d", i);
> +		snprintf(fname, sizeof(fname), FNAME ".%d", i);
>  		fd = open(fname, O_RDWR | O_CREAT, 0777);
>  		if (fd == -1) {
>  			if (errno != EMFILE)
> @@ -44,13 +44,13 @@ static void setup(void)
>
>  static void run(void)
>  {
> -	sprintf(fname, FNAME ".%d", fds_limit);
> +	snprintf(fname, sizeof(fname), FNAME ".%d", fds_limit);
>  	TST_EXP_FAIL2(open(fname, O_RDWR | O_CREAT, 0777), EMFILE);
>  }
>
>  static void cleanup(void)
>  {
> -	if (!first || !fds)
> +	if (first < 0 || !fds)

And this cleanup has an issue. See below..

>  		return;
>
>  	for (i = first; i < fds_limit; i++)
> --
> 2.43.0

This test has to work also for `-i 0` option. The way we can make it
works is the following:

- "first" should be initialized to -1, otherwise "first < 0" won't be
  catched
- the fds should be initialized with -1 after SAFE_MALLOC(), otherwise
  you will fail the cleanup if malloc will break the test


Kind Regards,
-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
