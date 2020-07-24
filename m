Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8B322CACD
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 18:19:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 846213C4D05
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 18:19:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id EC5213C0886
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 18:19:33 +0200 (CEST)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 263A410016E6
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 18:19:32 +0200 (CEST)
Received: from [192.168.1.22] (c-71-58-88-195.hsd1.pa.comcast.net
 [71.58.88.195])
 by linux.microsoft.com (Postfix) with ESMTPSA id D9A2820B4908;
 Fri, 24 Jul 2020 09:19:30 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D9A2820B4908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1595607571;
 bh=TtbKzEWXFrC8pjh8I3QKrliiQRzFkZKrfn4AgUk+fQw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Lznvocsl64E8unwJUhV4vNA16i8fOEYGY4WHiEL3BUK7ZetxXzhgZiaOWjyWDsJCe
 X+PQ4EbCdRpwcx4DFdmRHL2otjxCTRGBpfqevU8IpJVsci1US/prvFTHmN4El9x9HR
 6VbyL2wEASoE8TiZS7ze7FaObOtjOFjam5gtP8Ew=
To: Petr Vorel <pvorel@suse.cz>, Mimi Zohar <zohar@linux.ibm.com>
References: <20200724070038.29491-1-pvorel@suse.cz>
 <20200724070038.29491-2-pvorel@suse.cz>
 <1595592111.5211.246.camel@linux.ibm.com> <20200724131845.GB24626@dell5510>
From: Lachlan Sneff <t-josne@linux.microsoft.com>
Message-ID: <7cec65cc-efc7-045e-e905-07ad18ad24be@linux.microsoft.com>
Date: Fri, 24 Jul 2020 12:19:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200724131845.GB24626@dell5510>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-15.2 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 2/2] IMA: Add test for kexec cmdline measurement
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
Cc: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 linux-integrity@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>,
 ltp@lists.linux.it, balajib@linux.microsoft.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,

On 7/24/20 9:18 AM, Petr Vorel wrote:
> Hi all,
>
>> On Fri, 2020-07-24 at 09:00 +0200, Petr Vorel wrote:
>>> From: Lachlan Sneff <t-josne@linux.microsoft.com>
>>> IMA policy can be set to measure the command line passed in the kexec
>>> system call. Add a testcase that verifies that the IMA subsystem
>>> correctly measure the cmdline specified during a kexec.
>>> Note that this test does not actually reboot.
>>>
>>>
>>> Reviewed-by: Petr Vorel <pvorel@suse.cz>
>>> Signed-off-by: Lachlan Sneff <t-josne@linux.microsoft.com>
>>> Signed-off-by: Petr Vorel <pvorel@suse.cz>
>>> ---
>>> Hi,
>>> sent version with few my fixes.
>>> @Mimi: could you please have a quick look? (I know you reviewed previous
>>> version.)
> @Mimi, @Lachlan: if you both ack my changes, I can fix the code before merging.
> If there are more changes needed and thus Lachlan plan new version, please use
> my patches from https://patchwork.ozlabs.org/project/ltp/list/?series=191990&state=*
> (download https://patchwork.ozlabs.org/series/191990/mbox/ and import it with "git am")
> or clone my github fork and use kexec.v3.fixes branch:
> https://github.com/pevik/ltp/tree/ima/kexec.v3.fixes).
Hi Petr, these changes look good to me. I'm not exactly sure the 
convention here,
since I originally wrote the patch, but feel free to mark me as 
Signed-off-by.
>
> Kind regards,
> Petr
Thank you for working on this!
Lachlan

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
