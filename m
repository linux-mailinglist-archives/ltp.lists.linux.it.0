Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 058F52B5129
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 20:31:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B14BD3C6AF4
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 20:31:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 4374D3C2F6C
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 20:31:34 +0100 (CET)
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 66D141400268
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 20:31:33 +0100 (CET)
Received: by mail-ed1-x544.google.com with SMTP id m16so5058573edr.3
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 11:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=T/VET/VNqdMxYZqAsQHLvW9yNuryuYeGEZtRBQawGOA=;
 b=pOHeDWK278dtqqn62phmsxDapJCmlY4HxFoJpLJchlQK2a/9inMlaKGniNz0sAcduY
 lKxyMjiBGHGObyOCRAG++Afuu1egiaBlP+tWLgFn1dCek62Owr/erMGyUPLCgGr1cESv
 c0LvXKdePq+wZhY+C5CXKVi4z03s0DkNe//yegf1OFTWQoeMGTtkwONAHIdCj5JC7e4L
 XzZScFKcDDaatJ72MvMTTKOEFDkUy4cc6OhW/zLw2QH9LZoU31tEzy3VhGpVt892R14L
 Enk+S7cUSa/W/9tluf4A2JwsCfImpwB4tX0BmJsZahoLubMWfzy/yXHbydJnEINW8FFW
 JPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=T/VET/VNqdMxYZqAsQHLvW9yNuryuYeGEZtRBQawGOA=;
 b=O10SYTCUah7cydtqkLUxPJodjW+rptlXxGct/OA/oiq8dv0qOwadQ8CLJPSjEwh0Wd
 0xGJBsfR2iOArp/9Mt09DOC4Hl/w+lqKFUUezop2Y5PvB4/qPM5SLu5ZM9Eq7b4/clf5
 5nF/ph3yPbwN5Ilh19AB7DeDHJv8T8miBg6K8Jt67aMEoLlO1+gFumQJDaS319xi7rYZ
 fprG0YumItZ0PtXZgj0iT967WlZNywNjm4alye9bC/szciz0j6+DF4G1/c13ssZvaNyS
 ZPGXJHKRG/tijVG44h7CKKGLNTGMPKASvSd7qo9fbIM2MFcoJh844Hsm4cSIErAGWqFZ
 6K8g==
X-Gm-Message-State: AOAM533bNRDHEcebA48e3H8u+ZU7l02pNerIyCO330lkSi+33M/0P1Ho
 dN270V41uRfrjPniwVUYUbE=
X-Google-Smtp-Source: ABdhPJz6VCEyy80BCh14y9P//lX380e/4e6JMzHmjeGLurWyM6r003x6i9R6tHTrvvL/ogI3pvw7CQ==
X-Received: by 2002:aa7:c358:: with SMTP id j24mr17439118edr.265.1605555092951; 
 Mon, 16 Nov 2020 11:31:32 -0800 (PST)
Received: from pevik ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id b1sm10964575ejg.60.2020.11.16.11.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 11:31:32 -0800 (PST)
Date: Mon, 16 Nov 2020 20:31:30 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <20201116193130.GA181383@pevik>
References: <20201116124611.16919-1-lkml@jv-coder.de>
 <20201116124611.16919-2-lkml@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201116124611.16919-2-lkml@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] network/stress/mutlicast/packet-flood: Update
 to tst_net.sh
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Joerg,

> From: Joerg Vehlow <joerg.vehlow@aox-tech.de>

> Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
> ---
>  .../multicast/packet-flood/mcast4-pktfld01    | 114 ++++-------------
>  .../multicast/packet-flood/mcast4-pktfld02    | 116 ++++--------------
>  .../multicast/packet-flood/mcast6-pktfld01    | 112 ++++-------------
>  .../multicast/packet-flood/mcast6-pktfld02    | 114 ++++-------------
Thanks a lot!
Could you please merge files into single one:
mcast{4,6}-pktfld01 => mcast-pktfld01
mcast{4,6}-pktfld02 => mcast-pktfld02

as done previously in other multicast and route tests?

Could you also add ".sh" extension to the files? (it's then obvious it's shell,
not a compiled binary).

NOTE: $TST_IPVER is often used.

Also, please remove all bogus comments like GPL verbose text (replaced by SPDX)
and also bogus comments like:
# Test description

The comment at the top should be small, e.g.:
# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (c) International Business Machines  Corp., 2006
# your copyright
# Author: Mitsuru Chinen <mitch@jp.ibm.com>

# joining a IPv4/IPv6 multicast group on a single socket, then receiving a large
# number of UDP packets at the socket

You also mix tabs and spaces. We usually prefer tabs, but please reformat whole
file.

>  4 files changed, 85 insertions(+), 371 deletions(-)

> diff --git a/testcases/network/stress/multicast/packet-flood/mcast4-pktfld01 b/testcases/network/stress/multicast/packet-flood/mcast4-pktfld01
> index c1ee513d4..20284569d 100644
> --- a/testcases/network/stress/multicast/packet-flood/mcast4-pktfld01
> +++ b/testcases/network/stress/multicast/packet-flood/mcast4-pktfld01
> @@ -42,41 +42,20 @@
>  #trace_logic=${trace_logic:-"set -x"}
>  $trace_logic
Please remove this.

> -# The test case ID, the test case count and the total number of test case
> -TCID=mcast4-pktfld01
> -TST_TOTAL=1
> -TST_COUNT=1
> -export TCID
> -export TST_COUNT
> -export TST_TOTAL
> -
> -# Make sure the value of LTPROOT
> -LTPROOT=${LTPROOT:-`(cd ../../../../.. ; pwd)`}
> -export LTPROOT
> -
> -# Check the environmanet variable
> -. check_envval || exit $TST_TOTAL
> -
> -# Dulation of the test [sec]
> -NS_DURATION=${NS_DURATION:-3600}      # 1 hour
> +TST_TESTFUNC=test_body
> +TST_NEEDS_ROOT=1
> +TST_SETUP=do_setup
> +TST_CLEANUP=do_cleanup

>  # The number of the test link where tests run
>  LINK_NUM=${LINK_NUM:-0}
LINK_NUM is not needed

> -# Network portion of the IPv4 address
> -NETWORK_PART=${IPV4_NETWORK:-"10.0.0"}
> -
> -# Netmask of the IPv4 network
> -NETWORK_MASK=24
> -
> -# Host portion of the IPv4 address
> -LHOST_HOST_PART=${LHOST_IPV4_HOST:-"2"}     # local host
> -RHOST_HOST_PART=${RHOST_IPV4_HOST:-"1"}     # remote host
> -
>  # Multicast Address
>  MCAST_ADDR=224.10.0.1
MCAST_ADDR is replaced by MCAST_IPV{4,6}_ADDR in tst_net_stress.sh (which is
used by mcast-lib.sh, see below).

> +. tst_net.sh

NOTE:
other multicast tests use
testcases/network/stress/multicast/grp-operation/mcast-lib.sh, which also uses
testcases/network/stress/ns-tools/tst_net_stress.sh. I wrote them some time ago
(today I'd do things differently), they deserve cleanup (so does also my rewrite
of multicast stress tests). Even they're not perfect, it'd be probably better to
use it to avoid redundancy.

>  # Function: do_cleanup
> @@ -89,11 +68,7 @@ do_cleanup()
>  {
>      # Make sure to kill the multicast receiver and sender
>      killall -SIGHUP ns-mcast_receiver >/dev/null 2>&1
> -    $LTP_RSH $RHOST killall -SIGHUP ns-udpsender >/dev/null 2>&1
> -
> -    # Clean up each interface
> -    initialize_if lhost ${LINK_NUM}
> -    initialize_if rhost ${LINK_NUM}
> +	tst_rhost_run -c "killall -SIGHUP ns-udpsender >/dev/null 2>&1"
>  }
Also cleanup is handled safer (if I remember correctly using killall -SIGHUP in
original do_cleanup() does not work).


> @@ -107,57 +82,15 @@ do_cleanup()
>  #-----------------------------------------------------------------------
>  do_setup()
>  {
> -    # Initialize the system configuration
> -    do_cleanup
> -
> -    # Call do_cleanup function before exit
> -    trap do_cleanup 0
> +	local lhost_ifname=$(tst_iface lhost ${LINK_NUM})
Also {l,r}host_ifname is not needed. You use $(tst_iface rhost) for -I
parameter, see mcast_setup() in mcast-lib.sh.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
