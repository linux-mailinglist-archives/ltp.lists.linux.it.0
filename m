Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2D533DCE2
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Mar 2021 19:50:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B9FC13C642E
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Mar 2021 19:50:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 12E3C3C32E7
 for <ltp@lists.linux.it>; Tue, 16 Mar 2021 19:50:45 +0100 (CET)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id A8FCB10006B8
 for <ltp@lists.linux.it>; Tue, 16 Mar 2021 19:50:44 +0100 (CET)
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id 4ED2C209C349;
 Tue, 16 Mar 2021 11:50:42 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4ED2C209C349
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1615920642;
 bh=qZXvyF9z8cK+AXTYqRjmf2/evfbpSRHkkFrN82m3Fek=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=e86hwaU7ikakOjNPp9/hz0fx2LchoHIZ+MXkd6Auadd0dtYhbgKpb9HUQVyIkqzAo
 T3yH/JWBjKhKOUjB9KR3MrjmD8RtACzlBIAm/BsmqhsUXqwIdmeq7MRvKdhFPtS/nf
 m3PRAmHjfqECWRRvsYcRIMYrLyKCb/cChqQ0HyeU=
To: Petr Vorel <pvorel@suse.cz>
References: <20210314233646.2925-1-nramas@linux.microsoft.com>
 <YFC7j4+wA8xorNgu@pevik>
 <deeb4320-a064-fd0f-bc1e-8e52be079ff9@linux.microsoft.com>
 <YFDpFL3CSwMfZ6wo@pevik>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <5cbe66e7-aebf-e75a-cd9a-d0a69e8a1edd@linux.microsoft.com>
Date: Tue, 16 Mar 2021 11:50:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YFDpFL3CSwMfZ6wo@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,SPF_HELO_PASS,
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] IMA: Allow only ima-buf template for key
 measurement
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
Cc: tusharsu@linux.microsoft.com, linux-integrity@vger.kernel.org,
 ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 3/16/21 10:21 AM, Petr Vorel wrote:
Hi Petr,

> 
>>> Just a double check does it always work without template=ima-buf for all kernel versions?
>>> Or only for kernels with dea87d0889dd ("ima: select ima-buf template for buffer measurement")
>>> i.e. v5.11-rc1 or backport?
>> The above change is required. Prior to this change, template has to be
>> specified in the policy, otherwise the default template would be used.
> The default template is ima-ng, right?
Yes: ima-ng is the default template.

>>From what you write I understand that "measure func=KEY_CHECK
> keyrings=.ima|.evm" will work only on newer kernel, thus we should always use
> template=ima-buf as the policy example so that it's working also on that few
> kernels between <v5.6,v5.10> (which have IMA key functionality, but not
> dea87d0889dd), right?
Yes: In the kernels between v5.6 and v5.10, ima-buf template needs to be 
specified in the policy for KEY_CHECK.

> 
> But we should mention that in the README.md.
> 
Agreed - will update the README.md

thanks,
  -lakshmi

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
