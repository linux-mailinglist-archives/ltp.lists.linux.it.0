Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D83EA9AB9
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Sep 2019 08:34:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C2F3D3C20FC
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Sep 2019 08:34:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 2EC1A3C209D
 for <ltp@lists.linux.it>; Thu,  5 Sep 2019 08:34:47 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 7EA9E1A01CD6
 for <ltp@lists.linux.it>; Thu,  5 Sep 2019 08:34:46 +0200 (CEST)
Received: from mail-wr1-f71.google.com ([209.85.221.71])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <po-hsu.lin@canonical.com>)
 id 1i5lLx-000382-2l
 for ltp@lists.linux.it; Thu, 05 Sep 2019 06:34:45 +0000
Received: by mail-wr1-f71.google.com with SMTP id b15so513773wrp.21
 for <ltp@lists.linux.it>; Wed, 04 Sep 2019 23:34:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=30Wv7dGUzULDvyYjXnq6WuDKWgOFwdodmjw0kxM6Hts=;
 b=N9LKSpZEAxHdT1DvAdPJsamehBXiII/6FH47dSq/FwLPVrl/V+X2Y2Mc7EDkCi9uQW
 /VjjEQuOJUHNOm3H2u0cWUAEAJGBpPN41asNDD4bK21sp6BOHTlMdoHV1+kZg32WnhWF
 4ARJCY2bunDRgGic4iIIiTipDK5ZKQ737BtUeOBabcUmU/K4ciXORygG685g8e1aAGwg
 rV5eflV2eEEQKedIPdP8w+C19pvvhbOG5ABRfOs9nJVYC7DBzeEWG2R/l9j8xMmqidvK
 35XaLYwF57QGN3iRaploysYhWITmiZNIr/XXnequUrSRawoBv9XdRu/8Ugvxs+ZEET/E
 8FOg==
X-Gm-Message-State: APjAAAVdlMd0YQeMxvqJcyUOHSz8nvoLzzBOtfDH4tIhrmz514qmOLdq
 uAqR4OmgD6dK3V8/NRm7XbsGYt6VBq9YVarLgVqerCXUZuqw+Dl1ds7hWc/bzCrfZKA2boTGFca
 grgzbpjbHSuku6oVHU2ZZtZz1FTgzy5w+c3z4ZajwRZQ=
X-Received: by 2002:a1c:c013:: with SMTP id q19mr1336044wmf.87.1567665284628; 
 Wed, 04 Sep 2019 23:34:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxLS3lmrFAa2SfNfzHmaUsI1+d5Otx6FCqKr5znJshqDAP1QbQV1Pnpb7UgrXvi1uT6FSUhTYvcAXfA31/E6PE=
X-Received: by 2002:a1c:c013:: with SMTP id q19mr1336028wmf.87.1567665284367; 
 Wed, 04 Sep 2019 23:34:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190712120505.28953-1-po-hsu.lin@canonical.com>
In-Reply-To: <20190712120505.28953-1-po-hsu.lin@canonical.com>
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
Date: Thu, 5 Sep 2019 14:34:33 +0800
Message-ID: <CAMy_GT-FZEV5khfYz8xg19sEX=JG0+S_otTivs7NpOFWQmfFBw@mail.gmail.com>
To: ltp@lists.linux.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] controllers/cpuset: improve the node number
 calculation for N_NODES
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

Hello,

This issue is causing multiple failures when the test needs the cpuset_funcs.sh
  * cpuset_base_ops
  * cpuset_exclusive
  * cpuset_hierarchy
  * cpuset_hotplug cpuset_inherit
  * cpuset_load_balance
  * cpuset_memory cpuset_memory_pressure
  * cpuset_memory_spread
  * cpuset_sched_domains
  * cpuset_syscall

It will be great if we can have this patch reviewed.

For the record, mail to the original author "miaox" has failed, server repies:
    unknown user: "miaox"

On Fri, Jul 12, 2019 at 8:05 PM Po-Hsu Lin <po-hsu.lin@canonical.com> wrote:
>
> BugLink: https://bugs.launchpad.net/bugs/1836188
>
> It was spotted on a Power9 system with Ubuntu Cosmic installed, the
> N_NODES obtained from the file contains only "0,8":
>     $ cat /sys/devices/system/node/has_normal_memory
>     0,8
>
> This will cause the N_NODES calculation in cpuset_funcs.sh to fail with:
>     cpuset_funcs.sh: arithmetic expression: expecting EOF: "0,8 + 1"
>
> As it was not designed for counting the number of comma seperated nodes.
>
> Improve this by splitting the file output with newlines, iterate through
> them to count the number of nodes. If we ever encounter a sequence
> format like "3-6", use shell substitution to get these two numbers and
> with their difference plus 1 to get the number of nodes in this range.
>
> Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
> ---
>  .../kernel/controllers/cpuset/cpuset_funcs.sh   | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/testcases/kernel/controllers/cpuset/cpuset_funcs.sh b/testcases/kernel/controllers/cpuset/cpuset_funcs.sh
> index 935a41ed0..6861b8dbd 100755
> --- a/testcases/kernel/controllers/cpuset/cpuset_funcs.sh
> +++ b/testcases/kernel/controllers/cpuset/cpuset_funcs.sh
> @@ -28,12 +28,21 @@
>
>  NR_CPUS=`tst_ncpus`
>  if [ -f "/sys/devices/system/node/has_high_memory" ]; then
> -       N_NODES="`cat /sys/devices/system/node/has_high_memory`"
> +       N_NODES="`cat /sys/devices/system/node/has_high_memory | tr ',' '\n'`"
>  else
> -       N_NODES="`cat /sys/devices/system/node/has_normal_memory`"
> +       N_NODES="`cat /sys/devices/system/node/has_normal_memory | tr ',' '\n'`"
>  fi
> -N_NODES=${N_NODES#*-*}
> -N_NODES=$(($N_NODES + 1))
> +i=0
> +while read item; do
> +       count=1
> +       if [ "${item#*-*}" != "$item" ]; then
> +               count=$((${item#*-*} - ${item%*-*} + 1))
> +       fi
> +       i=$((i + $count))
> +done <<EOL
> +$N_NODES
> +EOL
> +N_NODES=$i
>
>  CPUSET="/dev/cpuset"
>  CPUSET_TMP="/tmp/cpuset_tmp"
> --
> 2.17.1
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
