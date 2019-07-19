Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 776046E251
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jul 2019 10:14:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 09E803C1D0F
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jul 2019 10:14:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 0FE723C181E
 for <ltp@lists.linux.it>; Fri, 19 Jul 2019 10:14:06 +0200 (CEST)
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9F2B86021D5
 for <ltp@lists.linux.it>; Fri, 19 Jul 2019 10:14:03 +0200 (CEST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
 [147.11.189.40])
 by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6J8DNPm027627
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
 Fri, 19 Jul 2019 01:13:33 -0700
Received: from [128.224.162.188] (128.224.162.188) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
 Fri, 19 Jul 2019 01:13:12 -0700
To: Cyril Hrubis <chrubis@suse.cz>, Li Wang <liwang@redhat.com>
References: <56f854e2-9cc6-4725-3182-ff83e106ee23@windriver.com>
 <20190717094614.GA9539@rei>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <7d2c4936-2e89-6285-c856-a156d3a76284@windriver.com>
Date: Fri, 19 Jul 2019 16:13:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190717094614.GA9539@rei>
Content-Language: en-US
X-Originating-IP: [128.224.162.188]
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] Question about kernel/syscall/signal/signal06.c
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
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This case fails when boot qemux86-64 with 1/2 cores.

I find [kernel 5.2-rc1: 0d714dba162] causes the failure by git bisect.

If git checkout a commit before 0d714dba162, the case will pass on the 
same qemu configuration.


--Hongzhi


On 7/17/19 5:46 PM, Cyril Hrubis wrote:
> Hi!
>> I find signal06 fails on qemux86-64 when qemu has a small number cores,
>> e.g. "qemu -smp 1/2/4/6".
>>
>> ERROR INFO:
>>
>> signal06?????? 0?? TINFO?? :?? loop = 23
>> signal06?????? 1?? TFAIL?? :?? signal06.c:87: Bug Reproduced!
>>
>> But if boot qemu with "-smp 16", the case has great chance to pass.
>>
>>
>> I have two questions about this case:
>>
>> 1. I don't know why multi-core will affect the case.
> Have you looked into the code? The test is trying to reproduce a race
> condition between two threads of course the number of cores does affect
> the reproducibility.
>
>> 2. On failure situation, what does break the "while loop" shown in below
>> code.
> Bug in a kernel that fails to restore fpu state.
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
