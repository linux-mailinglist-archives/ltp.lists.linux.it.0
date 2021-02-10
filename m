Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4FD316825
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Feb 2021 14:38:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E34B73C6917
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Feb 2021 14:38:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id B99CD3C3138
 for <ltp@lists.linux.it>; Wed, 10 Feb 2021 14:38:32 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 599E1600EA0
 for <ltp@lists.linux.it>; Wed, 10 Feb 2021 14:38:32 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AE372AE3F;
 Wed, 10 Feb 2021 13:38:31 +0000 (UTC)
Date: Wed, 10 Feb 2021 14:38:30 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>, ltp@lists.linux.it,
 Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YCPh1qzZU51C0HY8@pevik>
References: <1612772078-29651-1-git-send-email-zhufy.jy@cn.fujitsu.com>
 <YCOUXtwBk0ZPjDL3@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YCOUXtwBk0ZPjDL3@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Zhu,

...
> FYI my shell version.

> Kind regards,
> Petr

> --- testcases/kernel/containers/netns/netns_helper.sh
> +++ testcases/kernel/containers/netns/netns_helper.sh
> @@ -47,16 +47,21 @@ IFCONF_IN6_ARG=

>  tst_check_iproute()
>  {
> -	local cur_ipver="$(ip -V)"
> -	local spe_ipver="$1"
> +	local current_ver="$(ip -V)"
> +	local expected_ver="111010"

> -	cur_ipver=${cur_ipver##*s}
> +	current_ver=${current_ver##*s}

> -	if [ -z "$cur_ipver" -o -z "$spe_ipver" ]; then
> +	if [ -z "$current_ver" -o -z "$expected_ver" ]; then
I'm sorry, this was supposed to be only this:
    if [ -z "$current_ver" ]; then
($expected_ver is set few lines above).

Kind regards,
Petr

>  		tst_brk TBROK "failed to obtain valid iproute version"
>  	fi

> -	if [ $cur_ipver -lt $spe_ipver ]; then
> +	# new version scheme since v5.7.0-77-gb687d1067169
> +	if echo "$current_ver" | grep -q 'iproute2-v\?[0-9]\+\.'; then
> +		return
> +	fi
> +
> +	if [ $current_ver -lt $expected_ver ]; then
>  		tst_brk TCONF "too old iproute version"
>  	fi
>  }

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
