Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D7A758D0
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jul 2019 22:27:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3A0383C1CDE
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jul 2019 22:27:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id F0B173C0300;
 Thu, 25 Jul 2019 22:27:28 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B8ADB601242;
 Thu, 25 Jul 2019 22:27:27 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E655EAF98;
 Thu, 25 Jul 2019 20:27:25 +0000 (UTC)
Date: Thu, 25 Jul 2019 22:27:24 +0200
From: Petr Vorel <pvorel@suse.cz>
To: "Siliang,Yu" <siliangx.yu@intel.com>
Message-ID: <20190725202723.GA23767@x230>
References: <20190724234502.105332-1-siliangx.yu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190724234502.105332-1-siliangx.yu@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH LTP] -Cpuhotplug06:Skip the test if "htop" is used.
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
Cc: ltp-owner <ltp-owner@lists.linux.it>, Jerry Chen <jerry.t.chen@intel.com>,
 ltp-request <ltp-request@lists.linux.it>, ltp <ltp@lists.linux.it>,
 YiXin Zhang <yixin.zhang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> From: "Yu,Siliang" <siliangx.yu@intel.com>

> In some distro, "htop" is used instead "top", which doesn't support '-b'. Skip the test if "htop" is used.
Could you be more specific (which distro, ...)?
Do you mean binary is top and it's a symlink (or something) to htop?
Trying to detect '>' suggests you target to symlink and the command on linew 76 is top
top -b -d 00.10 > /dev/null 2>&1 &

But in that case it'd be better to parse 'top -v'.

> ---
>  .../kernel/hotplug/cpu_hotplug/functional/cpuhotplug06.sh    | 5 +++++
>  1 file changed, 5 insertions(+)

> diff --git a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug06.sh b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug06.sh
> index 18a11197e..ecf4eedea 100755
> --- a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug06.sh
> +++ b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug06.sh
> @@ -49,6 +49,11 @@ done

>  LOOP_COUNT=1

> +LNTOP=$(ls -l $(which top) | cut -s -d ">" -f2)
> +if [[ -n $LNTOP ]] && [[ $LNTOP != "top" ]] ; then
[[ ]] is a bashism, please use [ ].

https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#132-shell-coding-style

> +	tst_brkm TCONF "Command doesn't support , Skip the test..."
> +fi
> +
>  if [ $(get_present_cpus_num) -lt 2 ]; then
>  	tst_brkm TCONF "system doesn't have required CPU hotplug support"
>  fi

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
