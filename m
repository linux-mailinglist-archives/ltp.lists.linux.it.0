Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LDQJtArlGmdAQIAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Feb 2026 09:50:24 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C3514A173
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Feb 2026 09:50:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1771318223; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=X8xtBxYIrGExhcqRXq5GelYA6lEzGkmajoiDpF7NOlI=;
 b=CY6JPbXaEsanNiQmlaMRgWTYA7I3LClD6M+YaC33aXmT0hrVS9eOEQCvTkm7f+IiBU/Nq
 aH9dXAEPv7FU0TLk7WwLHLh+oV6zl2tanmHU6wICADJWYqzeSMbM1pl4LxjFyk+naEcFzht
 SAaFt35zCMp5FPV8qeBUVx43+aWqH2A=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CC84F3D05EB
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Feb 2026 09:50:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6230D3C7BB1
 for <ltp@lists.linux.it>; Tue, 17 Feb 2026 09:50:11 +0100 (CET)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id AFBBF1400176
 for <ltp@lists.linux.it>; Tue, 17 Feb 2026 09:50:10 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4837907f535so26519855e9.3
 for <ltp@lists.linux.it>; Tue, 17 Feb 2026 00:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1771318210; x=1771923010; darn=lists.linux.it;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zW2n6zAeXYqQql+Tj20241D/kzBd9mARxBVPlwALnPE=;
 b=AHBoUErR7hQ9PnvBRyGuCiSrYvbXHo2YFd4R1szkeE/hC7h/ZoBAY0qFk04C9eY0TG
 ++7Au7eYGgFUhbWk8La/PSudteQRL09gCSPVmDGG1VmBQ48amHeQsKsHCBJvg+wUpovE
 OGC37uSZsTwAAGzPIkkLGsHg+cGGnHcgR2wk3V6FWWbGRevzui+Z34IgfMi5DLFCjXVX
 rnCmdrzC99y5W+MHsYp4ciTumALI+Oi3M1IPTz3xbTh6vpVwvhKAeM+c5j0jbs6y72VI
 /8UTqOZLEzSOkx2xIwhr7ec7mGuDvw2RocAFn7o+j5n6+0ovWyyihHOR++QO66sJ0Qcd
 gLdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771318210; x=1771923010;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zW2n6zAeXYqQql+Tj20241D/kzBd9mARxBVPlwALnPE=;
 b=E1r7+xKiFxFeXhM8mUwAhJxQQV9h15yp74IDsfCnX94YJaXkS4tOYW/8cjxAMyNEAE
 OGWruiq7kB+ptiwsa4mhAmAMLapdOimsGoDngioFUnfjbgWSXy0C2U8oOuZ9mRqhmZZd
 p3ljngVzfcpE5qpAy1YKGIUOvURa/kzqgJQUh0FVqXaOYa503Yx8SbF95t3dG1sSkInf
 j/aUUx8jt206FMxjd1+u8CeS8C2WmFcu2ux668FFpK/4t9fXVCd9b0D71XbomTA7GrLW
 n45w2rzPTzYqGRyadDddNeRBeUYrNEZuQt8LmDntjQ0HTGU3CQ1VbRS9+tyKAnQMtT0U
 KkMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPoUet4u1iiXxI7FLRmVJ3u+U4ov6tRiqvumqi1kIPXHWqa4npv0gPAEXnS/yCPljsjo0=@lists.linux.it
X-Gm-Message-State: AOJu0Yyir5AYoO9j3axsdFhB21qts7PG526L5wSyL6ujgl2CD9D5wVAD
 CJiBTI1BgyrjN/okBM3ZFhbdCfFpFGaYBNWjxgdYctbDtr2oEWWhlDLnrtnXU9Z3VCy5Qbxk9Q9
 Uo/MZOHs=
X-Gm-Gg: AZuq6aKmu5mt/t92aeukEis55FUlu9xbmnGOIjvPx322xi/33sI+WY5M76znTuunEbF
 cnf9Th/NH15TIn333drsRn2Llzbix+3gDO7QJWwaK5qQlXGwwU8txddCUlOgfY6HfU+YH0Exv+K
 Y3e9ssBAw407/HmEuHr+xqMIP5JtuZ9THG/ZyMwFkGupaorAG43iog5zIDTAWBjs7cssgOyF+Qh
 LR26heffho3CSu2nV0zp3WgziLS2jl6BVBf/6BmtW6ovBa817iEKfeDMxRyk4Ppqp429Ewig0mC
 PlUO7W5sgptejSYSPeM07rw+1pE3LzRxv9V8xBD/M31b0gNzJ3lthzX+EpNX6CtHYiUAtVEQFgh
 w/8QIp0TfdNBmTRKrI8DY19JT8BMFZ0g9bL8WnwUfpW7u47LtniWwlMK0kmUmeIv/NrgUEj39hG
 8NPTekYpwHOwbgg0Wmx33lJ8t0sb9Ykplb/tHKCHI8Ie/eKjkDjV1VbaJjRAQMV98IJHOWmXrEJ
 IHxFMoH7VlLNWnC3BjtEtBy2lVQSA==
X-Received: by 2002:a05:600c:45c8:b0:480:1b65:b741 with SMTP id
 5b1f17b1804b1-48379b9913cmr174380525e9.15.1771318209866; 
 Tue, 17 Feb 2026 00:50:09 -0800 (PST)
Received: from localhost
 (p200300ef2f4fc9009ff26ae1d4042002.dip0.t-ipconnect.de.
 [2003:ef:2f4f:c900:9ff2:6ae1:d404:2002])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48371a3647asm101376495e9.22.2026.02.17.00.50.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 00:50:09 -0800 (PST)
Mime-Version: 1.0
Date: Tue, 17 Feb 2026 09:50:08 +0100
Message-Id: <DGH3WFEFIBFP.33NJI688DM4ZP@suse.com>
To: <jiaying.song.cn@windriver.com>, <ltp@lists.linux.it>
X-Mailer: aerc 0.18.2
References: <20250522093003.1958528-1-jiaying.song.cn@windriver.com>
In-Reply-To: <20250522093003.1958528-1-jiaying.song.cn@windriver.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] syscalls/ipc: Skip msgctl05 when
 __USE_TIME64_REDIRECTS is defined
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
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[picard.linux.it:helo,picard.linux.it:rdns,suse.com:mid,suse.com:email,suse.com:replyto,lists.linux.it:dkim,windriver.com:email]
X-Rspamd-Queue-Id: 45C3514A173
X-Rspamd-Action: no action

Hi!

On Thu May 22, 2025 at 11:30 AM CEST, Jiaying Song via ltp wrote:
> From: Jiaying Song <jiaying.song.cn@windriver.com>
>
> The msgctl05 test checks if the kernel clears the *_high fields in struct msqid64_ds.
>
> However, when __USE_TIME64_REDIRECTS is defined, this structure may not
> contain those fields due to header redirection. This patch adds a check
> to skip the test in such cases, avoiding false failures and improving test robustness.

Let's make it more clear:

On systems with 64-bit time_t and glibc's time64 redirects, struct msqid64_ds
may not expose the separate *_high fields, causing the test to fail at compile
time or report false negatives. This can be verified by checking if
__USE_TIME64_REDIRECTS has been defined.

>
> Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> ---
>  testcases/kernel/syscalls/ipc/msgctl/msgctl05.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/ipc/msgctl/msgctl05.c b/testcases/kernel/syscalls/ipc/msgctl/msgctl05.c
> index cd2643b..27beeb8 100644
> --- a/testcases/kernel/syscalls/ipc/msgctl/msgctl05.c
> +++ b/testcases/kernel/syscalls/ipc/msgctl/msgctl05.c
> @@ -11,7 +11,11 @@
>  #include "tst_test.h"
>  #include "tst_safe_sysv_ipc.h"
>  
> -#ifdef HAVE_MSQID64_DS_TIME_HIGH
> +#if !defined(HAVE_MSQID64_DS_TIME_HIGH)
> +TST_TEST_TCONF("test requires struct msqid64_ds to have the time_high fields");

Missing space ad the beginning, as well as in the next TST_TEST_TCONF.

> +#elif defined(__USE_TIME64_REDIRECTS)
> +TST_TEST_TCONF("test requires __USE_TIME64_REDIRECTS to be undefined");

Here we should back it more clear:

"test cannot run with __USE_TIME64_REDIRECTS defined (time_high fields not accessible)"

> +#else
>  
>  static void run(void)
>  {
> @@ -43,6 +47,5 @@ static struct tst_test test = {
>  	.test_all = run,
>  	.needs_tmpdir = 1,
>  };
> -#else
> -TST_TEST_TCONF("test requires struct msqid64_ds to have the time_high fields");
> +
>  #endif

The rest looks ok.

Reviewed-by: Andrea Cervesato <andrea.cervesato@suse.com>

-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
