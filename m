Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDCC6E49A
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jul 2019 12:59:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2246B3C1D12
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jul 2019 12:59:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 171AD3C0300;
 Fri, 19 Jul 2019 12:59:50 +0200 (CEST)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E369F1000BDF;
 Fri, 19 Jul 2019 12:59:38 +0200 (CEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jul 2019 03:59:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,282,1559545200"; d="scan'208";a="191896422"
Received: from yixin-dev.sh.intel.com (HELO yixin-dev) ([10.239.161.25])
 by fmsmga004.fm.intel.com with ESMTP; 19 Jul 2019 03:59:39 -0700
Date: Fri, 19 Jul 2019 18:50:12 +0800
From: "Zhang, Yixin" <yixin.zhang@intel.com>
To: "Siliang,Yu" <siliangx.yu@intel.com>
Message-ID: <20190719105012.GA18145@yixin-dev>
References: <20190719040655.54345-1-siliangx.yu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190719040655.54345-1-siliangx.yu@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH LTP] - cpuhotplug06.sh:Add judgment for command
 "top".
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
Cc: ltp-owner <ltp-owner@lists.linux.it>,
 ltp-request <ltp-request@lists.linux.it>, ltp <ltp@lists.linux.it>,
 Jerry Chen <jerry.t.chen@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Siliang,
There is some issue in your patch:

1. The "top" tool is not 100% located at /usr/bin/, you should use "which" cmd
    to check it
2. [[ -L "/usr/bin/top" ]] does not mean the case should go to TCONF. The real
    logic is the check the realpath of the top tool and check it's name, if the
    real name is not "top" (like "htop" in Clear Liunx case), TCONF the case.
    We don't care if it's a symlink or not, we just care if it's using the
    oringal top or an other top which may not support "top -b".
3. The error log is not correct. Clear Linux use symlink or Clear Liunx use
    "htop" doesn't go to the conclusion that if a distro use symlink or it use
    "htop" or some other "Xtop" so it's Clear Linux. We should not mention a
    specific distro name here. Same for commit message.
4. Take care of white spaces v.s. <tab>

Yixin

On 2019-07-19 at 12:06:55 +0800, Siliang,Yu wrote:
> From: "Yu,Siliang" <siliangx.yu@intel.com>
> 
> Only on clear linux OS,"top" is a link file.
> If it's clear linux,skip the test.
> 
> Signed-off-by: Yu,Siliang <siliangx.yu@intel.com>
> ---
>  .../kernel/hotplug/cpu_hotplug/functional/cpuhotplug06.sh     | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug06.sh b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug06.sh
> index 18a11197e..d5877d085 100755
> --- a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug06.sh
> +++ b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug06.sh
> @@ -49,6 +49,10 @@ done
>  
>  LOOP_COUNT=1
>  
> +if [[ -L "/usr/bin/top" ]];then
> +        tst_brkm TCONF "Invalid argument on Clear Linux Skip the test..."
> +fi
> +
>  if [ $(get_present_cpus_num) -lt 2 ]; then
>  	tst_brkm TCONF "system doesn't have required CPU hotplug support"
>  fi
> -- 
> 2.22.0
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
