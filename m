Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9A4410F53
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Sep 2021 07:32:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9DFEA3C8631
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Sep 2021 07:32:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 55FDF3C1B0A
 for <ltp@lists.linux.it>; Mon, 20 Sep 2021 07:32:23 +0200 (CEST)
Received: from m12-16.163.com (m12-16.163.com [220.181.12.16])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id A86CA200990
 for <ltp@lists.linux.it>; Mon, 20 Sep 2021 07:32:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=Eodk4
 mW1IncHtkThSxcuW2e9wUMZY2OfJZFnG1BIlyE=; b=FP9M6x/HVv/+fbKDoUuHu
 z6higx3Ww158oPAcetzsYbClyn5scazzeDd/r8XuhnKXO+a0yJScFUzIa9EyL8Dx
 L216AfTvIhlBaTtCdmFxlQz8i0PHY/WLoFn95oZz27cFArSrPm9OukvbQP/dKP9w
 tyZ0Piz2EFN6kygsAS2suM=
Received: from [192.168.0.11] (unknown [183.210.46.254])
 by smtp12 (Coremail) with SMTP id EMCowAB3h7HcHEhhxRJMBg--.1093S2;
 Mon, 20 Sep 2021 13:32:14 +0800 (CST)
To: QI Fuli <fukuri.sai@gmail.com>, ltp@lists.linux.it
References: <20210920033705.20544-1-qi.fuli@fujitsu.com>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <3b698f71-b8d8-2ef6-3a83-d978f659c4d1@163.com>
Date: Mon, 20 Sep 2021 13:32:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20210920033705.20544-1-qi.fuli@fujitsu.com>
Content-Language: en-US
X-CM-TRANSID: EMCowAB3h7HcHEhhxRJMBg--.1093S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZr4kZF4rGF4DKw1xAFW5Jrb_yoWftwcEvF
 yUJFy5Jr4UAa9xJFnxGrsYqrs8KrWkJFs5JrnxG395JrsF9r17CFnIyr45ZFn5WFWrWF93
 Grs8KrW5J3sxAjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0hYFtUUUUU==
X-Originating-IP: [183.210.46.254]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/1tbiTB4UXlSIpCCgFAAAs0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6 0/5] Convert syscalls/dup2/dup2{01...05} to new
 API
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
Cc: QI Fuli <qi.fuli@fujitsu.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Qi,

I have pushed the patch set with two minor changes:

1) Fix some warnings from checkpatch.pl.

2) Fix the description in dup204.

Best Regards,

Xiao Yang

On 9/20/21 11:37 AM, QI Fuli wrote:
> From: QI Fuli <qi.fuli@fujitsu.com>
>
> Convert syscalls/dup2/dup2{01...05} to new API
>
> QI Fuli (5):
>    syscalls/dup2/dup201: Convert to new API
>    syscalls/dup2/dup202: Convert to new API
>    syscalls/dup2/dup203: Convert to new API
>    syscalls/dup2/dup204: Convert to new API
>    syscalls/dup2/dup205: Convert to new API
>
>   testcases/kernel/syscalls/dup2/dup201.c | 174 +++-------------
>   testcases/kernel/syscalls/dup2/dup202.c | 196 ++++++------------
>   testcases/kernel/syscalls/dup2/dup203.c | 265 ++++++++----------------
>   testcases/kernel/syscalls/dup2/dup204.c | 147 ++++---------
>   testcases/kernel/syscalls/dup2/dup205.c | 178 ++++++----------
>   5 files changed, 276 insertions(+), 684 deletions(-)
>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
