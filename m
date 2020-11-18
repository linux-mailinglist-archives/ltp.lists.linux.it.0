Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F2F2B8696
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Nov 2020 22:27:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 58C3B3C5F78
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Nov 2020 22:27:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id A853D3C31D3
 for <ltp@lists.linux.it>; Wed, 18 Nov 2020 22:27:39 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 6886660096A
 for <ltp@lists.linux.it>; Wed, 18 Nov 2020 22:27:39 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ACE22AB3D;
 Wed, 18 Nov 2020 21:27:38 +0000 (UTC)
Date: Wed, 18 Nov 2020 22:27:37 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <20201118212737.GC182229@pevik>
References: <20201117124320.783802-1-lkml@jv-coder.de>
 <20201117124320.783802-2-lkml@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117124320.783802-2-lkml@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/3] network/stress/multicast/query-flood:
 Convert to new API
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Joerg,

Thanks for v2!

Main info are reported by Alexey, few more notes below.

...
> +# Verify that the kernel is not crashed when joining a multicast group
> +# on a single socket, then receiving a large number of General Queries
nit: some sort of the description could be in 
tst_test TINFO message in do_setup() / do_test()

...
> +TST_NEEDS_ROOT=1
> +. mcast-lib.sh
> +
> +do_setup()
> +{
> +	mcast_setup $MCASTNUM_NORMAL
> +}
> +
> +do_test()
> +{
> +	local mcast_addr_prefix="$MCAST_IPV4_ADDR_PREFIX"
> +	[ "$TST_IPV6" ] && mcast_addr_prefix="$MCAST_IPV6_ADDR_PREFIX"
nit: maybe just $prefix is enough.
> +
> +	# Run a multicast join tool
> +	local tmpfile=$$
Please, when you need temporary files, use
TST_NEEDS_TMPDIR=1

> +	EXPECT_PASS $MCAST_LCMD -n 1 -p $mcast_addr_prefix \> $tmpfile
> +	tst_res TINFO "joined $(grep groups $tmpfile)"
> +
> +	# Send General Query from the remote host
> +	local params=""
nit: no need to add =""

...

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
