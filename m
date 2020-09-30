Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D22B227EAE3
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 16:26:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 97B7C3C2A24
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 16:26:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 02C003C297B
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 16:26:23 +0200 (CEST)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 70B666009B7
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 16:26:22 +0200 (CEST)
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id 879D720B7178;
 Wed, 30 Sep 2020 07:26:20 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 879D720B7178
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1601475980;
 bh=/TmI+R+MOE67+Ea8E2HPwFjBBTPt64CHISo+2O7ANIE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=iGoLWk5KJ76k+m1oEMSlCadtbYcyywe5jCu/x2Uji+76pVJugELXYyQDy9FDebRSq
 xRazxBIBqJa998WLBnl6IwUylU3FrFGZOc06pc2ZxzKxzrT9R2V6xPZ89TQjLF6QR6
 ns4au3ejy1olW3vPyoVz4iVvwEv3WuCQUAGBxD4s=
To: Petr Vorel <pvorel@suse.cz>
References: <20200928194730.20862-1-nramas@linux.microsoft.com>
 <20200929052340.GA4976@dell5510>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <281c5fa0-8d3a-0812-9d20-a5c7ee4f7666@linux.microsoft.com>
Date: Wed, 30 Sep 2020 07:26:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200929052340.GA4976@dell5510>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,SPF_HELO_PASS,
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 0/1] ima: Add test for selinux measurement
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
Cc: paul@paul-moore.com, stephen.smalley.work@gmail.com,
 tusharsu@linux.microsoft.com, linux-integrity@vger.kernel.org,
 ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 9/28/20 10:23 PM, Petr Vorel wrote:
> Hi Lakshmi,
> 
> Thanks for your patch. FYI I'll try to have look ASAP, but as there is LTP
> freeze and work needed to review fixes before release I'll probably review this
> after the release (1, max. 2 weeks).
> 
> Could you please have a look at fix planned to be part of the release?
> https://patchwork.ozlabs.org/project/ltp/list/?series=204230
> 

Will do Petr.

> 
>> New functionality is being added to IMA to measure data provided by
>> kernel components. With this feature, IMA policy can be set to enable
>> measuring data provided by Linux Security Modules (LSM). Currently one
>> such LSM namely selinux is being updated to use this functionality.
>> This new functionality needs test automation in LTP.
> 
>> This patch set adds tests which verify that the IMA subsystem correctly
>> measures the data provided by selinux.
> 
>> This patch is based on
>> commit 286401a1c1f3 ("thp04: Add linux tag")
>> in "master" branch in https://github.com/linux-test-project/ltp
> 
>> This patch is dependent on the following patch series in LTP
>> https://patchwork.kernel.org/patch/11802771/
> I put link to LTP patchwork to avoid the confusion.
> https://patchwork.ozlabs.org/project/ltp/list/?series=204486

Thanks. On the next update I'll add the LTP patchwork URL.

> 
>> This series needs a kernel built on the following repo/branch/patches:
>> repo: https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git
>> branch: next
>> commit 8861d0af642c ("selinux: Add helper functions to get and set checkreqprot")
> Thanks for adding this info. It'd be great if it were part of kernel commit
> message and also added as a comment in the test itself (we don't want to get it
> lost).
> 
> BTW LTP has 2 kind ways of handling of kernel versions:
> 
> * fixes which are meant to be backported to the stable trees:
> In C API it looks like (here also with CVE entry):
> https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/syscalls/bpf/bpf_prog03.c#L187
> .tags = (const struct tst_tag[]) {
> 		{"linux-git", "95a762e2c8c9"},
> 		{"CVE", "2017-16995"},
> 		{}
> This is not part of shell API, but I'll add it after the release. Thus we don't
> want to loose this info.
> 
> * new kernel features, which are likely not to be backported
> You either have some way to detect this feature is presented (ideally) or you
> specify kernel version since it should be run
> This is used in shell API as:
> https://github.com/linux-test-project/ltp/blob/master/testcases/network/tcp_cc/bbr02.sh#L8
> TST_MIN_KVER="4.13"

Thanks for the info.

  -lakshmi

> 
>> And the following patch series should be applied in the following order:
>>    1, https://patchwork.kernel.org/patch/11709527/
>>    2, https://patchwork.kernel.org/patch/11795559/
>>    3, https://patchwork.kernel.org/patch/11801525/
>>    4, https://patchwork.kernel.org/patch/11801585/
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
