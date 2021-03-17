Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F372333F064
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 13:32:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C28373C2DB8
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 13:32:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 609203C2CF7
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 13:32:13 +0100 (CET)
Received: from m12-11.163.com (m12-11.163.com [220.181.12.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0D1E920090F
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 13:32:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=WcI9u
 5DZP2gvo787LOJl+FJ01pRNOIx3le1AL5IKLko=; b=EujaHxXD6WQCEals9AEdo
 7JaJOcL1Spr98YbYE4Ty+rDHsr5rVikDnrsysRj1TYlSo/MDwbGmlLeicoALLaGu
 yGfWM08FfymXO0SmNbv/RhW0pGez2/3weoH3MH8zEU60HXca+p5OPR5MnwRnV/j1
 P7Bvk9Vq/yVL/dZgTb9UOI=
Received: from [192.168.0.11] (unknown [183.210.48.59])
 by smtp7 (Coremail) with SMTP id C8CowADn0YnC9lFgZD_2Sg--.8859S2;
 Wed, 17 Mar 2021 20:32:03 +0800 (CST)
To: Petr Vorel <pvorel@suse.cz>, Cyril Hrubis <chrubis@suse.cz>
References: <20210317100154.20389-1-zhaogongyi@huawei.com>
 <YFHghQWbAmjmKDx3@pevik>
 <OS0PR01MB6371A1E607BDFBC2421E6788836A9@OS0PR01MB6371.jpnprd01.prod.outlook.com>
 <YFHpSspnD52A8N0P@pevik> <YFHxcgN/3TG2Y9Mx@yuki.lan> <YFHyg8m3CmU8as2C@pevik>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <32fcff9e-54d4-a4ed-0d4c-3b703921d035@163.com>
Date: Wed, 17 Mar 2021 20:32:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <YFHyg8m3CmU8as2C@pevik>
Content-Language: en-US
X-CM-TRANSID: C8CowADn0YnC9lFgZD_2Sg--.8859S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKry5Ww47Gw48GFWUKw4fuFg_yoWxKwbE9r
 nFqFW8WF4qyFZ3Zan3GF4fJrWxKrWjqFyUZrZ5Gr43J3s7Xa93CanF9r4xA34rXwnrCr9I
 gFyqv3yYyw17ujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU5xnY7UUUUU==
X-Originating-IP: [183.210.48.59]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/xtbBEgRYXl6ibQ46ngAAsr
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] ??????: [PATCH v2] cleanup: Unify the annotation style
 and remove Redundant code
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
Cc: "yangx.jy@fujitsu.com" <yangx.jy@fujitsu.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 3/17/21 8:13 PM, Petr Vorel wrote:
> Hi,
>
>> Hi!
>>> I'd keep both: this is for cleanup of old approach, conversion in testinfo.pl in
>>> case there is inconsistency in the future.
>> If we agree on a certain format I would vote for docparse to fail the
>> build if the format is wrong, that will force us to maintain the
>> metadata correctly.
+1
> Make sense. But being the one who often fixes docparse failures I'm not sure if
> I want to implement extra work for myself :).
>
> (It'd help to implement https://github.com/linux-test-project/ltp/issues/599,
> but I don't have any server to run it).

This issue is about docparse, I think we can merge the patch itself 
directly.

Best Regards,

Xiao Yang

>
> Kind regards,
> Petr
>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
