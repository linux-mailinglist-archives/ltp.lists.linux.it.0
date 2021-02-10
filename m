Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA4C316097
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Feb 2021 09:08:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BA95F3C628C
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Feb 2021 09:08:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 1A33B3C6264
 for <ltp@lists.linux.it>; Wed, 10 Feb 2021 09:08:00 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9FA456009FE
 for <ltp@lists.linux.it>; Wed, 10 Feb 2021 09:08:00 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B8BC0AC97;
 Wed, 10 Feb 2021 08:07:59 +0000 (UTC)
Date: Wed, 10 Feb 2021 09:07:58 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
Message-ID: <YCOUXtwBk0ZPjDL3@pevik>
References: <1612772078-29651-1-git-send-email-zhufy.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1612772078-29651-1-git-send-email-zhufy.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] netns_helper: Make iproute version check work
 correctly
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

Hi Zhu,

thank you for working on this. I also started to work on this before LTP
release, trying to fix it in the API, because there are more tests affected by
this (there is also mc_cmds.sh).

My WIP is to create tst_iproute_version.c, which would be used by shell and C tests.
I actually wanted to go little bit further to have general C helper for getting
version (but that'd have to wait after this is fixed). But as you were faster
I'll let you to finish it.

...
> diff --git a/testcases/kernel/containers/netns/netns_helper.sh b/testcases/kernel/containers/netns/netns_helper.sh
> index a5b77a0..bec43ac 100755
> --- a/testcases/kernel/containers/netns/netns_helper.sh
> +++ b/testcases/kernel/containers/netns/netns_helper.sh
> @@ -50,6 +50,15 @@ tst_check_iproute()
>  	local cur_ipver="$(ip -V)"
>  	local spe_ipver="$1"

> +	echo $cur_ipver | grep "ip utility, iproute2-ss" > /dev/null
> +	ret1=$?
> +	echo $cur_ipver | grep "ip utility, iproute2-" > /dev/null
> +	ret2=$?
> +
> +	if [ $ret1 -ne 0 -a $ret2 -eq 0 ]; then
> +		return
> +	fi
> +

FYI my shell version.

Kind regards,
Petr

--- testcases/kernel/containers/netns/netns_helper.sh
+++ testcases/kernel/containers/netns/netns_helper.sh
@@ -47,16 +47,21 @@ IFCONF_IN6_ARG=
 
 tst_check_iproute()
 {
-	local cur_ipver="$(ip -V)"
-	local spe_ipver="$1"
+	local current_ver="$(ip -V)"
+	local expected_ver="111010"
 
-	cur_ipver=${cur_ipver##*s}
+	current_ver=${current_ver##*s}
 
-	if [ -z "$cur_ipver" -o -z "$spe_ipver" ]; then
+	if [ -z "$current_ver" -o -z "$expected_ver" ]; then
 		tst_brk TBROK "failed to obtain valid iproute version"
 	fi
 
-	if [ $cur_ipver -lt $spe_ipver ]; then
+	# new version scheme since v5.7.0-77-gb687d1067169
+	if echo "$current_ver" | grep -q 'iproute2-v\?[0-9]\+\.'; then
+		return
+	fi
+
+	if [ $current_ver -lt $expected_ver ]; then
 		tst_brk TCONF "too old iproute version"
 	fi
 }

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
