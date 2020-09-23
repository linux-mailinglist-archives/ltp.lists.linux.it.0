Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 268912758D9
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Sep 2020 15:36:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C8C483C5831
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Sep 2020 15:36:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 9E8EB3C2B26
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 15:36:14 +0200 (CEST)
Received: from m12-12.163.com (m12-12.163.com [220.181.12.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 74881140126F
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 15:36:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=MybLE
 7wHWTWGudLJFVlcC24o8elMvldzF+XdrxV1bJo=; b=fHv80T4SGXLmMWyIXhxOW
 NnVyXEW0J0T7ma4i/A5Fs3PdjpTmVIsTU8LR1ZPVxLH/2na1J4YVifE8nYhVNz9j
 ZVgXIfGlkhtJbsQprKfWPgRUnIAJcyZCNZrW27XEHsB1Erolb+HVwN8gyNfT05oZ
 MCaYMW2bWHqk8Nu0HamF64=
Received: from [192.168.0.10] (unknown [112.23.238.72])
 by smtp8 (Coremail) with SMTP id DMCowABHTsJIT2tf0uaOOg--.8443S2;
 Wed, 23 Sep 2020 21:36:10 +0800 (CST)
To: Petr Vorel <pvorel@suse.cz>, Xiao Yang <yangx.jy@cn.fujitsu.com>
References: <20200923084422.13101-1-yangx.jy@cn.fujitsu.com>
 <20200923095106.GB31351@dell5510>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <7cbd84c9-1594-06dd-429b-a0822dd39637@163.com>
Date: Wed, 23 Sep 2020 21:36:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200923095106.GB31351@dell5510>
Content-Language: en-US
X-CM-TRANSID: DMCowABHTsJIT2tf0uaOOg--.8443S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU6IztUUUUU
X-Originating-IP: [112.23.238.72]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/xtbB0gqoXlUMY3jqWQAAsf
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/recvmmsg01.c: Fix a compiler error
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


On 9/23/20 5:51 PM, Petr Vorel wrote:
> BTW: reported by Li Wang
>
> and also by P.-H. Lin:
> https://github.com/linux-test-project/ltp/issues/727

Hi Petr and Jan,

Sure, I will add Reported-by and the number of issue.

Also thanks for your review. :-)

Thanks,

Xiao Yang

>
> Kind regards,
> Petr
>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
