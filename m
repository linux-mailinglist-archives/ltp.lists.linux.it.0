Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3507F9E585
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Aug 2019 12:15:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E41293C1CE6
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Aug 2019 12:15:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 029F03C1C75
 for <ltp@lists.linux.it>; Tue, 27 Aug 2019 12:15:43 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 13EE9600E27
 for <ltp@lists.linux.it>; Tue, 27 Aug 2019 12:15:44 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,436,1559491200"; d="scan'208";a="74348612"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 27 Aug 2019 18:15:38 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
 by cn.fujitsu.com (Postfix) with ESMTP id 89F264CE087D;
 Tue, 27 Aug 2019 18:15:31 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Tue, 27 Aug 2019 18:15:39 +0800
Message-ID: <5D6502C9.9040805@cn.fujitsu.com>
Date: Tue, 27 Aug 2019 18:15:37 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <20190814091545.147098-1-siliangx.yu@intel.com>
 <20190827094154.GA32175@dell5510>
In-Reply-To: <20190827094154.GA32175@dell5510>
X-Originating-IP: [10.167.220.69]
X-yoursite-MailScanner-ID: 89F264CE087D.AA318
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 LTP] Skip the test if "htop" is used.
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
Cc: YiXin Zhang <yixin.zhang@intel.com>, Jerry Chen <jerry.t.chen@intel.com>,
 ltp <ltp@lists.linux.it>, SiliangYu <siliangx.yu@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 2019/08/27 17:41, Petr Vorel wrote:
>> From: "Yu,Siliang"<siliangx.yu@intel.com>
>> In clear linux os, "htop" is used instead "top", which doesn't support '-b'. Skip the test on clear linux.
> There is a bug report in Clear Linux OS [1]:
> original top program is named top2, maybe it'd make sense to test for it as well.
Hi,

Is the silly rename going to be changed by Clear Linux in future?

If yes, we may keep cpuhotplug06.sh to detect the issue.
If no, we may update cpuhotplug06.sh to use top2 if top is provided by 
htop.

Best Regards,
Xiao Yang
>> Signed-off-by: Yu,Siliang<siliangx.yu@intel.com>
> Acked-by: Petr Vorel<pvorel@suse.cz>
>
>>   .../kernel/hotplug/cpu_hotplug/functional/cpuhotplug06.sh     | 4 ++++
> ...
>
>> +if top -v | grep -q htop; then
>> +	tst_brkm TCONF "htop is used instead of top, Skip the test..."
> 	tst_brkm TCONF "htop is used instead of top, skip the test"
> ...
>
> Kind regards,
> Petr
>
> [1] https://github.com/clearlinux/distribution/issues/277#issuecomment-442340322
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
