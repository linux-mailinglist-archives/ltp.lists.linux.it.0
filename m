Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A36231EF5
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jul 2020 15:05:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 88F5C3C262B
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jul 2020 15:05:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id B1BC33C0488
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 15:05:19 +0200 (CEST)
Received: from m12-18.163.com (m12-18.163.com [220.181.12.18])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 56DA4600059
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 15:05:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=LgNOw
 gCiSvBZSa6V8KAOANUsMvhpDB9d+P9QIsi9mFs=; b=hudAGg1ItE0Wy798tRXE8
 D6AacBdWhPrXoSgvbc+q+IQfE4veIp+99N9xoHYPMYR2DnRUn+14af//itoGHRTD
 A6OMGknYAdJXh+V1cb6ULkbkCewgEytC3gxiY0wTei//z2aCH4gnyXcW6dJDwNLe
 yxvHr0eVMPkmR6hBbQAcyc=
Received: from [192.168.0.10] (unknown [112.23.239.14])
 by smtp14 (Coremail) with SMTP id EsCowAAHR1cEdCFfUmfCGg--.26201S2;
 Wed, 29 Jul 2020 21:05:09 +0800 (CST)
To: aidengao <aiden.gaoyuan@gmail.com>, ltp@lists.linux.it
References: <20200727164355.1177602-1-aiden.gaoyuan@gmail.com>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <62530509-aba6-9180-ecea-150f3c5b8ebb@163.com>
Date: Wed, 29 Jul 2020 21:05:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200727164355.1177602-1-aiden.gaoyuan@gmail.com>
Content-Language: en-US
X-CM-TRANSID: EsCowAAHR1cEdCFfUmfCGg--.26201S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtr1xCF1DWrWfAFyxGrWkXrb_yoW3KFb_K3
 WUtr97WrW7Zr17KF4UZa93Xr4Sgw4xKrWruwnxKas7Ja1DJw47Aw1qqF1rWr98Wr4aqryv
 kr90krs0k3y7WjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUeg4S7UUUUU==
X-Originating-IP: [112.23.239.14]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/xtbBEAhwXlUMS49wPQAAsm
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.7 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] hotplug/memory_hotplug: Remove unused goto label
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
Cc: kernel-team@android.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 7/28/20 12:43 AM, aidengao wrote:
> From: aidengao <aidengao@google.com>
>
> Remove unused goto label in parse_command_line_args function
>
> Signed-off-by: Yuan Gao <aiden.gaoyuan@gmail.com>
> ---
>   testcases/kernel/hotplug/memory_hotplug/memtoy.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/testcases/kernel/hotplug/memory_hotplug/memtoy.c b/testcases/kernel/hotplug/memory_hotplug/memtoy.c
> index 8ac9600de..90bfd7f2f 100644
> --- a/testcases/kernel/hotplug/memory_hotplug/memtoy.c
> +++ b/testcases/kernel/hotplug/memory_hotplug/memtoy.c
> @@ -447,7 +447,7 @@ int parse_command_line_args(int argc, char *argv[])
>   			break;
>   		}
>   	}
> -done:
> +
>   

Hi Gao,

Pushed with a minor change(delete a redundant blank line). :-)

Thanks,

Xiao Yang

>   	return (error);
>   }


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
