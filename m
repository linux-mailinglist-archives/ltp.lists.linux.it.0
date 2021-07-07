Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2259B3BE946
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 16:04:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 70CFD3C89D6
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 16:04:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 076E33C5841
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 16:03:57 +0200 (CEST)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 39AB3200347
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 16:03:57 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id c28so4212401lfp.11
 for <ltp@lists.linux.it>; Wed, 07 Jul 2021 07:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=9TVzOxKnvv9QSrbOUYbGTnJsnZqNDF2ihlRF+k06G6Q=;
 b=hBaNwDTyhceGUtmqUIgrCg56Xy1ZDeJGzX9cKwxs6Dp1rf74qw5yPX6gRjDawFIUqD
 YP2F/2W270DRSBCdNXrI10pUAdIQvazKiFhbUXNyRgcdTapstrMb+LWkhdvhjqZgaosl
 Y99yFuLj9MqdQX/3TR1Lu5Q+vNaunHjUk36KgMDbzfTsOgKf6LmhbhGCGBnI/BxENPM2
 JtjuHqO1Pe2ZNwlAc8s/pcboeQP0g5PU0HQFiSASPTdHqzs8rB6TBGLOzRJwQY0W56gw
 pBdTXTcVPDkfdOEt4r8z1vNATCk9MQjjPc5aV1R40C32HM0vjwW0qz1KdOov8i9/PV73
 jyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9TVzOxKnvv9QSrbOUYbGTnJsnZqNDF2ihlRF+k06G6Q=;
 b=RwwcCZN3WDu5qPkuGk67Rv5mPLn/etHjJLjQglAqCtQjhEjz55YkZVKzMa4qRPiHbo
 Ku6/R3sy0vtBU3xf+WBmLMHDGms5m/zohgHuWrUM4AiLc3iJPlMOZJFQV9eaWVoWP5uU
 hLXWi8f4ZPdnSvM1nVYPZgV3HrZGe2OhoiMHw4ziZD0jV0VFTyqtSANHrnqw3UVihtUf
 OnfFLTZ5DGksHWySUjH/93jzEaG4pj+16AXZUMU/5FYN0A/8ZMK3QO0FTsQvxQJLaVB2
 o492LwJFOldZ9dP7k1YIRBiLU7iKacT9MM+Tnk0U7Z1Pg9CBIdSoSLNtVZ7s+5oLZJQc
 qsSg==
X-Gm-Message-State: AOAM531TCZ7xJDHepzN+93m531b005Z1OuisvLPSeDiPncxwbbi2DbA1
 GnC9vinZrwVXyEKnbagPgx0A6FOaC4+4
X-Google-Smtp-Source: ABdhPJw1pQOIxhHoD6frBjO04EWA56OZFdkMe0dLdO8GYvBrA1Fp6bgsweAWBjJsAIJg7oPaMXWTjw==
X-Received: by 2002:a19:c352:: with SMTP id t79mr20184671lff.537.1625666636320; 
 Wed, 07 Jul 2021 07:03:56 -0700 (PDT)
Received: from [192.168.1.53] ([91.247.148.5])
 by smtp.gmail.com with ESMTPSA id u2sm645762ljg.62.2021.07.07.07.03.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 07:03:56 -0700 (PDT)
To: Yang Xu <xuyang2018.jy@fujitsu.com>, ltp@lists.linux.it
References: <1625649746-11987-1-git-send-email-xuyang2018.jy@fujitsu.com>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <50bca7a2-41f5-3eba-d1da-e8e12c883d22@bell-sw.com>
Date: Wed, 7 Jul 2021 17:03:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1625649746-11987-1-git-send-email-xuyang2018.jy@fujitsu.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] network/tc01.sh: Add a regression test for tc
 qdisc command
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
On 07.07.2021 12:22, Yang Xu wrote:
> Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
> ---
>  runtest/net.tcp_cmds                   |  1 +
>  testcases/network/tcp_cmds/tc/Makefile | 13 +++++++
>  testcases/network/tcp_cmds/tc/tc01.sh  | 51 ++++++++++++++++++++++++++
>  3 files changed, 65 insertions(+)
>  create mode 100644 testcases/network/tcp_cmds/tc/Makefile
>  create mode 100755 testcases/network/tcp_cmds/tc/tc01.sh
> 
> diff --git a/runtest/net.tcp_cmds b/runtest/net.tcp_cmds
> index db47dfd5b..7e142de11 100644
> --- a/runtest/net.tcp_cmds
> +++ b/runtest/net.tcp_cmds
> @@ -12,6 +12,7 @@ netstat netstat01.sh
>  ping01 ping01.sh
>  ping02 ping02.sh
>  sendfile sendfile01.sh
> +tc01 tc01.sh
>  tcpdump tcpdump01.sh
>  telnet telnet01.sh
>  iptables iptables01.sh
> diff --git a/testcases/network/tcp_cmds/tc/Makefile b/testcases/network/tcp_cmds/tc/Makefile
> new file mode 100644
> index 000000000..60150a1ce
> --- /dev/null
> +++ b/testcases/network/tcp_cmds/tc/Makefile
> @@ -0,0 +1,13 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# Copyright (C) 2009, Cisco Systems Inc.
> +# Ngie Cooper, July 2009
> +
> +top_srcdir		?= ../../../..
> +
> +include $(top_srcdir)/include/mk/env_pre.mk
> +
> +INSTALL_TARGETS		:= tc01.sh
> +
> +MAKE_TARGETS		:=
> +
> +include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/network/tcp_cmds/tc/tc01.sh b/testcases/network/tcp_cmds/tc/tc01.sh
> new file mode 100755
> index 000000000..0a241843b
> --- /dev/null
> +++ b/testcases/network/tcp_cmds/tc/tc01.sh
> @@ -0,0 +1,51 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# Copyright (c) 2021 FUJITSU LIMITED. All rights reserved.
> +# Author: Yang Xu<xuyang2018.jy@fujitsu.com>
> +#
> +# When using "tc qdisc add dev teql0 root teql0 command", qdisc_create()
> +# calls teql_qdisc_init() it imediately fails after check "if (m->dev == dev)"
> +# because both devices are teql0, and it does not set qdisc_priv(sch)->m
> +# leaving it zero on error path, then qdisc_create() imediately calls
> +# teql_destroy() which does not expect zero master pointer and we get OOPS
> +# on unpatched kernel.
> +#
> +# If we enable panic_on_oops, this case may crash.
> +#
> +# This kernel bug was introduced by
> +# commit 87b60cfacf9f ("net_sched: fix error recovery at qdisc creation")
> +# and has been fixed by
> +# commit 1ffbc7ea9160 ("net: sched: sch_teql: fix null-pointer dereference")
> +#
> +
> +TST_TESTFUNC="do_test"
> +TST_NEEDS_ROOT=1
> +TST_NEEDS_DRIVERS="sch_teql"
> +TST_NEEDS_CMDS="tc modprobe"
> +sys_file="/proc/sys/kernel/panic_on_oops"
> +. tst_test.sh
> +
> +do_test()
> +{
> +	[ ! -f "$sys_file" ] && tst_brk TCONF "$sys_file not enabled"

Why this check is needed and also setting panic_on_oops to
trigger the bug? If not, I would suggest to remove them from
the test.

> +	orig_value=$(cat "$sys_file")
> +	if [ $orig_value = "0" ]; then
> +		echo 1 > $sys_file
> +	fi
> +
> +	tst_res TINFO "Use tc qdisc command to trigger a null-pointer dereference"
> +	modprobe $TST_NEEDS_DRIVERS

setup()
{
	ROD modprobe $TST_NEEDS_DRIVERS
}

> +
> +	tc qdisc add dev teql0 root teql0 2>/dev/null

TST_EXP_FAIL tc qdisc add dev teql0 root teql0

> +	if [ $? -eq 0 ]; then
> +		tst_res TFAIL "tc qdisc command succeeded unexpectedly"
> +	else
> +		tst_res TPASS "the bug was not reproduced"
> +	fi
> +
> +	if [ $orig_value = "0" ]; then
> +		 echo 0 > $sys_file
> +	fi
> +}
> +
> +tst_run
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
