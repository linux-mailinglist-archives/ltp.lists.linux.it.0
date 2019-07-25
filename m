Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 525E675904
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jul 2019 22:42:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EEC883C1CE4
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jul 2019 22:42:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id CA55D3C0054
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 22:42:07 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3BBF4200BA0
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 22:42:06 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7B210B022;
 Thu, 25 Jul 2019 20:42:06 +0000 (UTC)
Date: Thu, 25 Jul 2019 22:42:04 +0200
From: Petr Vorel <pvorel@suse.cz>
To: "Siliang,Yu" <siliangx.yu@intel.com>
Message-ID: <20190725204204.GA31486@x230>
References: <20190725013011.39342-1-siliangx.yu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725013011.39342-1-siliangx.yu@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 LTP]:Skip the test if "htop" is used.
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
Cc: Jerry Chen <jerry.t.chen@intel.com>, ltp <ltp@lists.linux.it>,
 YiXin Zhang <yixin.zhang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> From: "Yu,Siliang" <siliangx.yu@intel.com>

> In some distro, "htop" is used instead "top", which doesn't support '-b'. Skip the test if "htop" is used.
> ---
>  .../kernel/hotplug/cpu_hotplug/functional/cpuhotplug06.sh    | 5 +++++
>  1 file changed, 5 insertions(+)

> diff --git a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug06.sh b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug06.sh
> index 18a11197e..ddb6abf95 100755
> --- a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug06.sh
> +++ b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug06.sh
> @@ -49,6 +49,11 @@ done

>  LOOP_COUNT=1

> +realtop=$(which top | xargs realpath | xargs basename)
> +if [[ $realtop == "htop" ]] ; then
== is also a bashism, please use = (+ [[ ]] => [ ]).

> +	tst_brkm TCONF "$realtop is used instead of top, Skip the test..."
> +fi
OK, v2. This looks better than v2, but I'd really use command version output
(top -v) to detect top vs. htop.

> +
>  if [ $(get_present_cpus_num) -lt 2 ]; then
>  	tst_brkm TCONF "system doesn't have required CPU hotplug support"
>  fi

Kind regards,
Petr

PS: please don't use ltp-request and ltp-owner, these aren't meant for patch
submission.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
