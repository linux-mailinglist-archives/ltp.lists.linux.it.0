Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 891443F008E
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Aug 2021 11:33:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9F2113C5649
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Aug 2021 11:33:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E5BC43C5599
 for <ltp@lists.linux.it>; Wed, 18 Aug 2021 11:33:01 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 73CC7600856
 for <ltp@lists.linux.it>; Wed, 18 Aug 2021 11:33:01 +0200 (CEST)
Received: from [192.168.178.40] (unknown [188.192.255.100])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 2D8909F75E;
 Wed, 18 Aug 2021 09:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1629279180; bh=AhxgsP6uI7dFr+bSBHZbNah9ab8q+hQGEUW5p9HtJFA=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=DebFzYG9QeWE3uNIS2kg7Se6jT2Ja4uw7/f1sOwmgBiqdS2MBbqRZYzOrd2CCj8q/
 kWRSKR5gsynw1f29zyUSwNRX4LMesu6g5npKqOWqSoeO2/ZHnMPNqz6VUwWKKl/TBl
 v4lpqjWKMpo1ajhmq8UtpfooaYnvJolZoRPXWwew=
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20210818091224.27578-1-pvorel@suse.cz>
 <20210818091224.27578-4-pvorel@suse.cz>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <8589e81b-4c45-e62e-297a-ef6a3cd548dc@jv-coder.de>
Date: Wed, 18 Aug 2021 11:32:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210818091224.27578-4-pvorel@suse.cz>
Content-Language: en-US
X-Spam-Status: No, score=-1.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 3/3] commands: Drop which01.sh
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,

On 8/18/2021 11:12 AM, Petr Vorel wrote:
> "which" has been discontinued after 2.21 release in 2015 due this (git
> repository is empty [1]).
I am a bit against dropping this. which is widely used and I think as 
long as it is available, it should behave as expected.

Joerg

>
> [1] https://git.savannah.gnu.org/cgit/which.git
>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>   runtest/commands                    |   1 -
>   testcases/commands/which/Makefile   |  11 ---
>   testcases/commands/which/which01.sh | 107 ----------------------------
>   3 files changed, 119 deletions(-)
>   delete mode 100644 testcases/commands/which/Makefile
>   delete mode 100755 testcases/commands/which/which01.sh
>
> diff --git a/runtest/commands b/runtest/commands
> index 8cfad0449..fc5c86684 100644
> --- a/runtest/commands
> +++ b/runtest/commands
> @@ -32,7 +32,6 @@ mkfs01_msdos_sh mkfs01.sh -f msdos
>   mkfs01_vfat_sh mkfs01.sh -f vfat
>   mkfs01_ntfs_sh mkfs01.sh -f ntfs
>   mkswap01_sh mkswap01.sh
> -which01_sh which01.sh
>   lsmod01_sh lsmod01.sh
>   insmod01_sh insmod01.sh
>   wc01_sh wc01.sh
> diff --git a/testcases/commands/which/Makefile b/testcases/commands/which/Makefile
> deleted file mode 100644
> index 1be02f7d7..000000000
> --- a/testcases/commands/which/Makefile
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0-or-later
> -# Copyright (c) 2015 Fujitsu Ltd.
> -# Author:Guangwen Feng <fenggw-fnst@cn.fujitsu.com>
> -
> -top_srcdir		?= ../../..
> -
> -include $(top_srcdir)/include/mk/env_pre.mk
> -
> -INSTALL_TARGETS		:= which01.sh
> -
> -include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/commands/which/which01.sh b/testcases/commands/which/which01.sh
> deleted file mode 100755
> index dd6659ea0..000000000
> --- a/testcases/commands/which/which01.sh
> +++ /dev/null
> @@ -1,107 +0,0 @@
> -#!/bin/sh
> -# SPDX-License-Identifier: GPL-2.0-or-later
> -# Copyright (c) 2015 Fujitsu Ltd.
> -# Author: Guangwen Feng <fenggw-fnst@cn.fujitsu.com>
> -#
> -# Test which command with some basic options.
> -
> -TST_CNT=10
> -TST_SETUP=setup
> -TST_TESTFUNC=do_test
> -TST_NEEDS_TMPDIR=1
> -TST_NEEDS_CMDS="which"
> -. tst_test.sh
> -
> -setup()
> -{
> -	touch pname
> -	chmod +x pname
> -	PATH=$PATH:.
> -
> -	mkdir bin
> -	touch bin/pname
> -	chmod +x bin/pname
> -	PATH=$PATH:./bin
> -
> -	alias pname='pname -i'
> -}
> -
> -which_verify()
> -{
> -	local IFS i j
> -	IFS="$IFS_FIRST_LEVEL"
> -	for i in $1; do
> -		found="no"
> -		IFS="$IFS_SECOND_LEVEL"
> -		for j in $i; do
> -			if grep -F -q "$j" temp; then
> -				found="yes"
> -			fi
> -		done
> -		if [ "$found" != "yes" ]; then
> -			echo "'$i' not found in:"
> -			cat temp
> -			echo
> -			return 1
> -		fi
> -	done
> -}
> -
> -which_test()
> -{
> -	local which_op=$1
> -	local prog_name=$2
> -
> -	local which_cmd="which $which_op $prog_name"
> -
> -	if [ "$which_op" = "--read-alias" ] || [ "$which_op" = "-i" ] || \
> -		[ "$which_op" = "--skip-alias" ]; then
> -		which_cmd="alias | $which_cmd"
> -	fi
> -
> -	eval ${which_cmd} >temp 2>&1
> -	if [ $? -ne 0 ]; then
> -		grep -q -E "unknown option|invalid option|Usage" temp
> -		if [ $? -eq 0 ]; then
> -			tst_res TCONF "'${which_cmd}' not supported."
> -			return
> -		fi
> -
> -		tst_res TFAIL "'${which_cmd}' failed."
> -		cat temp
> -		return
> -	fi
> -
> -	if [ $# -gt 2 ]; then
> -		shift 2
> -		which_verify "$@"
> -		if [ $? -ne 0 ]; then
> -			tst_res TFAIL "'${which_cmd}' failed, not expected."
> -			return
> -		fi
> -	fi
> -
> -	tst_res TPASS "'${which_cmd}' passed."
> -}
> -
> -IFS_FIRST_LEVEL='^'
> -IFS_SECOND_LEVEL='|'
> -do_test()
> -{
> -	case $1 in
> -	1) which_test "" "pname" "$PWD/pname|./pname";;
> -	2) which_test "-all" "pname" "$PWD/bin/pname|./bin/pname^$PWD/pname|./pname";;
> -	3) which_test "-a" "pname" "$PWD/bin/pname|./bin/pname^$PWD/pname|./pname";;
> -	4) which_test "--read-alias" "pname" "pname='pname -i'^$PWD/pname";;
> -	5) which_test "-i" "pname" "pname='pname -i'^$PWD/pname";;
> -	6) alias which='which --read-alias';
> -	   which_test "--skip-alias" "pname" "$PWD/pname";
> -	   unalias which;;
> -	7) which_test "--version";;
> -	8) which_test "-v";;
> -	9) which_test "-V";;
> -	10) which_test "--help";;
> -	esac
> -}
> -
> -tst_run


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
