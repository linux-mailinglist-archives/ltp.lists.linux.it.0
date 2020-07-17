Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE178223271
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jul 2020 06:39:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AC8A13C2908
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jul 2020 06:39:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id EE05C3C2629
 for <ltp@lists.linux.it>; Fri, 17 Jul 2020 06:39:22 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id DC22120074D
 for <ltp@lists.linux.it>; Fri, 17 Jul 2020 06:39:21 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A719D6E;
 Thu, 16 Jul 2020 21:39:20 -0700 (PDT)
Received: from [10.163.34.163] (unknown [10.163.34.163])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 908963F66E;
 Thu, 16 Jul 2020 21:39:18 -0700 (PDT)
To: Cyril Hrubis <chrubis@suse.cz>
References: <20200714032408.9201-1-vikas.kumar2@arm.com>
 <20200716143352.GA11713@yuki.lan>
From: Vikas Kumar <vikas.kumar2@arm.com>
Message-ID: <4144f20f-6097-9e62-0328-c74c09bb68fe@arm.com>
Date: Fri, 17 Jul 2020 10:09:16 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200716143352.GA11713@yuki.lan>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V8] syscall: Add io_uring related tests
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
Cc: ltp@lists.linux.it, viresh.kumar@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> Hi!
> I've finished the test code and pushed, thanks.
>
> I've changed it so that it actually reads data and checks the result,
> and also properly unmaps the buffers (fixes failures with -i 10 passed
> to the test), the diff is attached below.
>
> Also I will have to check if we need the read/write barriers, I guess
> that the way we use the interface it's safe, since the syscalls provide
> natural boundary between kernel and userspace. But they would be needed
> for a different tests anyways.
>
> Also I had to remove the IORING_SETUP_IOPOLL flag since that made all
> SQEs fail with EOPNOTSUPP for me.

Thank you very much for help and change in test code.


Regards,

Vikas


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
