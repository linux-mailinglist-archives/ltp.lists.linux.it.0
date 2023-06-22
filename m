Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6437A7399BB
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jun 2023 10:30:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 787B53C9B67
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jun 2023 10:30:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id ABE063C9A35
 for <ltp@lists.linux.it>; Thu, 22 Jun 2023 10:30:29 +0200 (CEST)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 59F681000A40
 for <ltp@lists.linux.it>; Thu, 22 Jun 2023 10:30:27 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9FF5B6172B;
 Thu, 22 Jun 2023 08:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D458C433C8;
 Thu, 22 Jun 2023 08:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687422625;
 bh=+3bhOWdKmIVFqafQUQ3k3iMy77jkrN8TVbh6Ta1cvm0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=swD3m5EWDl4TeE08aha6k14r+CzeNS98ISMVIImQCiWY4fZgJpxcvSurpqSY1+LEl
 7NiAiwb3HBKpwcbVZuAeXJKPUJltsbAoPpXPvAkv6y4XjRtzTN7zpMviRmiOx1d5df
 IdL99l9mr3HxDjGmtm2djfXVrZponB9kvpV1MTrI8v76T+KaNCmQwuBVlRxk+IpP7L
 Ng1HmC73zbodBiEty7+7XIKOJGoi3deth90qcGji1dksXIatsU1ZmfsEGl7UygRLj1
 arFwRHNcNiAHjWPOESKLP0O9iKWQjdpiGkYliNdySaYuij6L4sJIzjIaTKRPHXJhnm
 p1uRx+8gnTKkg==
Message-ID: <09815276-c515-7f3b-e81c-6c60e9ebfe4c@kernel.org>
Date: Thu, 22 Jun 2023 17:30:22 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Petr Vorel <pvorel@suse.cz>, Niklas Cassel <Niklas.Cassel@wdc.com>
References: <202306192248.1ece4c29-oliver.sang@intel.com>
 <61f22c1d-6b04-d193-57c9-8cad1c555e4b@kernel.org> <ZJLxbwCno-it2xBB@yuki>
 <ZJMYP/CCVviG6IMq@x1-carbon> <20230622073256.GA482307@pevik>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20230622073256.GA482307@pevik>
X-Virus-Scanned: clamav-milter 1.0.1 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [linux-next:master] [scsi] eca2040972:
 ltp.ioprio_set03.fail
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
Cc: "lkp@intel.com" <lkp@intel.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 kernel test robot <oliver.sang@intel.com>, Hannes Reinecke <hare@suse.de>,
 "oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>,
 Christoph Hellwig <hch@lst.de>, "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 6/22/23 16:32, Petr Vorel wrote:
>> On Wed, Jun 21, 2023 at 02:47:43PM +0200, Cyril Hrubis wrote:
>>> Hi!
>>>>> kernel test robot noticed "ltp.ioprio_set03.fail" on:
> 
>>>> LTP maintainers,
> 
>>>> Patches have been submitted to fix this issue. Were these patches applied ?
> 
>>> Looks like they are in, at least these two:
> 
>>>     ioprio: use ioprio.h kernel header if it exists
>>>     ioprio: Use IOPRIO_PRIO_NUM to check prio range
> 
>>> And there does not seem to be anything ioprio related haning in the LTP
>>> patchwork.
> 
> Hi Niklas,
> 
>> Hello Cyril, Petr, Damien,
> 
> 
>> I just ran LTP master + linux-next and the test case passes for me.
> 
> 
>> Although, note that even if you are using LTP master,
>> the way that the LTP header:
>> testcases/kernel/syscalls/ioprio/ioprio.h
>> is written, you will need to run
> 
>> make headers_install
>> with linux-next kernel source,
> 
>> before running
>> make autotools && ./configure
>> in LTP.
> 
>> Otherwise LTP will use the kernel uapi headers from your distro,
>> which does not perform the new checks for the IOPRIO_PRIO_VALUE()
>> macro. (It requires linux uapi headers from linux-next.)
> 
> Yes, it should do otherwise more tests would be often broken.
> 
> 
>> Does the linux kernel test robot not run
>> make headers_install
>> before running
>> make autotools && ./configure
>> in LTP?
> 
> I guess that's the question for Damien (I and Cyril have nothing to do with
> kernel test robot). I wonder myself.

Sorry, but I have nothing to do with the kernel robot either. I am only acting
when I get notified of a problem due to one of my patches.

-- 
Damien Le Moal
Western Digital Research


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
