Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B940382D2AB
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jan 2024 01:13:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3B3503CE38B
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jan 2024 01:13:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 017633CCE0A
 for <ltp@lists.linux.it>; Mon, 15 Jan 2024 01:13:18 +0100 (CET)
Authentication-Results: in-6.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=dlemoal@kernel.org; receiver=lists.linux.it)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C5DE9140043E
 for <ltp@lists.linux.it>; Mon, 15 Jan 2024 01:13:17 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 17EE8B8013C;
 Mon, 15 Jan 2024 00:13:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 520D1C433F1;
 Mon, 15 Jan 2024 00:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705277595;
 bh=9d8JNOymYGZ3/p+9qqiDWzbARwPOR0ThFsLa+omTDVE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HlwrgbtrQaMjHk6Rl1IBwvE+2sWuIYEn5he/RDz7dSWZhfu/UENTUW929466EuROU
 ior5hw4k52TxL8Vd87EW5a2iJgmNEZyPJjUeJDXTntdTbsmyE7/SdwiV9EIAoWldtM
 joQIkSN5rhwPYMbpNAK3l2gctjvZ8darjJfrPCu6ArKul1KdEfX0EljfJHR0GcDq8I
 uJ5sgUQkwp4kyuYVEfe5WbAbcBCxmlvvQ8OjSovamjWsXmvTtmOD1lEoXGgTETRAHf
 JWgsmDt9yubJJ1Y8LE/OL8dmm5WIdxR8Lpz2+GgASw13adcD8MlMMS4Jgj7HCSAQDl
 MmaVWl/5A75dQ==
Message-ID: <b5c9a4d9-894c-4812-8dbf-e623cb1baad2@kernel.org>
Date: Mon, 15 Jan 2024 09:13:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Naresh Kamboju <naresh.kamboju@linaro.org>
References: <CA+G9fYu1hB2OMf0EFrt_86OE=0Ug3y6nQd3=OZeEeM1jp3P92g@mail.gmail.com>
 <11a31e09-2e11-43a4-8995-ae70c5bef8bf@kernel.org>
 <CA+G9fYthC3qsH8ey=j3RvCr4-0zp1S3Ysr5QvY6SptorHpju1g@mail.gmail.com>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <CA+G9fYthC3qsH8ey=j3RvCr4-0zp1S3Ysr5QvY6SptorHpju1g@mail.gmail.com>
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
Subject: Re: [LTP] scsi: block: ioprio: Clean up interface definition -
 ioprio_set03.c:40: TFAIL: ioprio_set IOPRIO_CLASS_BE prio 8 should not work
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
Cc: Jens Axboe <axboe@kernel.dk>, Niklas Cassel <niklas.cassel@wdc.com>,
 Linux Regressions <regressions@lists.linux.dev>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 linux-block <linux-block@vger.kernel.org>,
 Dan Carpenter <dan.carpenter@linaro.org>, Christoph Hellwig <hch@lst.de>,
 LTP List <ltp@lists.linux.it>, Hannes Reinecke <hare@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 1/13/24 16:05, Naresh Kamboju wrote:
> On Fri, 12 Jan 2024 at 10:49, Damien Le Moal <dlemoal@kernel.org> wrote:
>>
>> On 1/12/24 14:15, Naresh Kamboju wrote:
>>> The LTP test 'iopri_set03' fails on all the devices.
>>> It fails on linux kernel >= v6.5. ( on Debian rootfs ).
>>> Test fail confirmed on LTP release 20230929 and 20230516.
>>>
>>> Test failed log:
>>> ------------
>>> tst_test.c:1690: TINFO: LTP version: 20230929
>>> tst_test.c:1574: TINFO: Timeout per run is 0h 05m 00s
>>> ioprio_set03.c:40: TFAIL: ioprio_set IOPRIO_CLASS_BE prio 8 should not work
>>> ioprio_set03.c:48: TINFO: tested illegal priority with class NONE
>>> ioprio_set03.c:51: TPASS: returned correct error for wrong prio: EINVAL (22)
>>>
>>> Investigation:
>>> ----------
>>> Bisecting this test between kernel v6.4 and v6.5 shows patch
>>> eca2040972b4 ("scsi: block: ioprio: Clean up interface definition")
>>> as the first faulty commit.
>>>
>>> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>>
>> This is fixed in LTP. Please update your LTP setup to avoid this issue.
> 
> Please point me to the fixed commit id.

git log --author="Damien Le Moal"

And of course you need to make sure that you are compiling LTP against the
kernel headers of the target test kernel.


-- 
Damien Le Moal
Western Digital Research


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
