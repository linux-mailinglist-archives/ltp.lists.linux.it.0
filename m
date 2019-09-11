Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CECFAF860
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Sep 2019 11:01:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C95543C2097
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Sep 2019 11:01:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 414F63C1C7F
 for <ltp@lists.linux.it>; Wed, 11 Sep 2019 11:00:59 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 77E8B200923
 for <ltp@lists.linux.it>; Wed, 11 Sep 2019 11:00:58 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AC1EFAE53;
 Wed, 11 Sep 2019 09:00:57 +0000 (UTC)
Date: Wed, 11 Sep 2019 11:00:56 +0200
From: Petr Vorel <pvorel@suse.cz>
To: SiliangYu <siliangx.yu@intel.com>
Message-ID: <20190911090055.GA13219@dell5510>
References: <20190910162337.60664-1-siliangx.yu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190910162337.60664-1-siliangx.yu@intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 LTP] Skip the test if "htop" is used.
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
Cc: YiXin Zhang <yixin.zhang@intel.com>, ltp <ltp@lists.linux.it>,
 Jerry Chen <jerry.t.chen@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Yu,

> From: "Yu,Siliang" <siliangx.yu@intel.com>

> In clear linux os, "htop" is used instead "top", which doesn't support '-b'. Skip the test on clear linux.

> Signed-off-by: Yu,Siliang <siliangx.yu@intel.com>
> ---
>  .../kernel/hotplug/cpu_hotplug/functional/cpuhotplug06.sh     | 4 ++++
>  1 file changed, 4 insertions(+)

> diff --git a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug06.sh b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug06.sh
> index 18a11197e..74a3dd2b1 100755
> --- a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug06.sh
> +++ b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug06.sh
> @@ -49,6 +49,10 @@ done

>  LOOP_COUNT=1

> +if top -v | grep -q htop; then
> +	tst_brkm TCONF "htop is used instead of top, Skip the test(workaround: alias top='/path/to/real/top')"
> +fi
Merged, with slightly adjusted commit message.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
