Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D79B3C45FF
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 10:19:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E48513C6740
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 10:19:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8CD713C2FDD
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 10:19:44 +0200 (CEST)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D7FDA6008E1
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 10:19:43 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id b40so22782513ljf.12
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 01:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XxmN1KkBse2I1CLNeFq23i2yW2xGMR8/uXJhDXx63RA=;
 b=FAlYEup7QTI/7dT0SRzHMXWJEbP110aIiog8wbM9qk937azp0VjUfVvbhyzb46Czg+
 uOd0EdM8EtodGy1x8uP2H+pXJ+JYw9zrBPY5X7P90qdUiXD5Y7EpNitxmZs6M5EcQ+cR
 RtGN5Yxlfa9G34aSzokALfp5YdMUkH77zHxS/AhbZz9d0wM7yux/KIgyVISUdFvVjydY
 PLeOKfUU+0eDbiZsy1/15O4FyidI37TFYXheTQB4Cklqyyvx7tYkeZzpOSUM9nPXiaDM
 O2kxl2+S1mOOelLHoKpeLam1O/H+cXa9fhG3T2tR2RnRMkUPPB5BnoJrjZdKoZxPG2yp
 oeFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XxmN1KkBse2I1CLNeFq23i2yW2xGMR8/uXJhDXx63RA=;
 b=YENycZP2PSz5PXTsW7kvlPThI8WvD6xlhytYZPV6LR7qqNbPFO1RKnw8IdvzFnX1Vv
 Xlg3il8JB1gYzRDzysgaV5pwYd8reu6wTqkYq5j5IVe6Fv9B4XWZuoP6xdUJc1yclC9i
 Ea6iNA0oyD062IbtPKcTE2lx4gH6+NqhmgiEPiw4Pmnz3rqS5vjyATpKlR/gfbmdAVcc
 Cg15Gz+eStkCQcbjl/meEjOXW3EGtZ+7jxtwQlmyDnGZ3XFRs7p/aPzSPaeQswcgP0UA
 8DRh9G0Ml4r5RCiUB6PE20JRXsSaIHgYjzu44iJC6WTd1Eqm4SsWqbCnvTUPYUe9bh6T
 XGkg==
X-Gm-Message-State: AOAM531Uic3v0cjjzyBXzrve+ieOW60rcFopcvJ7aMJ/gV0Xuh64muuE
 wh0rM9/LGzuDZODEeoa1nEaB+dZsR6pd
X-Google-Smtp-Source: ABdhPJwVwJVlF/s6Rn0/hj8V8n5N+6DWmLA/mJFd/8wS3B82R3kK1UJEgssaZt2TagB9CyxozUM4kA==
X-Received: by 2002:a2e:bc21:: with SMTP id b33mr6530452ljf.188.1626077983082; 
 Mon, 12 Jul 2021 01:19:43 -0700 (PDT)
Received: from [192.168.1.53] ([91.247.148.7])
 by smtp.gmail.com with ESMTPSA id u26sm5227lfi.305.2021.07.12.01.19.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 01:19:42 -0700 (PDT)
To: Yang Xu <xuyang2018.jy@fujitsu.com>
References: <7d822a0c-451c-4653-23f1-9bbc81bd0842@bell-sw.com>
 <1626056297-5744-1-git-send-email-xuyang2018.jy@fujitsu.com>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <ae2bc43c-1745-a0f1-67a7-b9d5a6691404@bell-sw.com>
Date: Mon, 12 Jul 2021 11:19:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1626056297-5744-1-git-send-email-xuyang2018.jy@fujitsu.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.5 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] network/tc01.sh: Add a regression test for tc
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Xu!
On 12.07.2021 05:18, Yang Xu wrote:
> Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
> ---
>  runtest/net.tcp_cmds                   |  1 +
>  testcases/network/tcp_cmds/tc/Makefile | 13 +++++++
>  testcases/network/tcp_cmds/tc/tc01.sh  | 47 ++++++++++++++++++++++++++
>  3 files changed, 61 insertions(+)
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

Since it's a new Makefile, not sure if it should be copy-pasted
from the other tests...

> +
> +top_srcdir		?= ../../../..
> +
> +include $(top_srcdir)/include/mk/env_pre.mk
> +
> +INSTALL_TARGETS		:= tc01.sh
> +
> +MAKE_TARGETS		:=

There is no point adding an empty make targets here.

> +
> +include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/network/tcp_cmds/tc/tc01.sh b/testcases/network/tcp_cmds/tc/tc01.sh
> new file mode 100755
> index 000000000..a9da45b41
> --- /dev/null
> +++ b/testcases/network/tcp_cmds/tc/tc01.sh
> @@ -0,0 +1,47 @@
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
> +TST_SETUP="setup"
> +TST_TESTFUNC="do_test"
> +TST_NEEDS_ROOT=1
> +TST_NEEDS_DRIVERS="sch_teql"
> +TST_NEEDS_CMDS="tc modprobe dmesg grep"
> +
> +. tst_test.sh
> +
> +setup()
> +{
> +	ROD modprobe $TST_NEEDS_DRIVERS
> +}
> +
> +do_test()
> +{
> +	tst_res TINFO "Use tc qdisc command to trigger a null-pointer dereference"
> +
> +	EXPECT_FAIL tc qdisc add dev teql0 root teql0
> +
> +	if dmesg | grep -q 'RIP:.*sch_teql'; then
> +		tst_res TFAIL "This bug is reproduced."
> +	else
> +		tst_res TPASS "This bug is not reproduced."
> +	fi
> +}
> +
> +tst_run
> 

For the rest:

Reviewed-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
