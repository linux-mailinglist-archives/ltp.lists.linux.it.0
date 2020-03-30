Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE9B197BE7
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 14:33:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B79D13C3171
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 14:33:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 17AFC3C313D
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 14:33:50 +0200 (CEST)
Received: from mail-m973.mail.163.com (mail-m973.mail.163.com [123.126.97.3])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id CFEE11400123
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 14:33:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=Qp6R5
 WMX1Rg1HarXh+gdt/MRxL4w+r0nI/voOyBDScs=; b=OE77n6c5/7i48R9o6T0hJ
 OTaWihJuWDEBWCCrmDhora11gu4Smmpd1x5LBqESf4frc74D1FCE1GAsm6FlWzOW
 /la9/pwvL7m/oqdBm4sUJi2iiqIA0/QapfRXkObv+vlrvkiv0DHiTkiVSuc4GOUf
 /gf5IQX47gsaU+jglbSExM=
Received: from [172.20.10.4] (unknown [122.96.41.200])
 by smtp3 (Coremail) with SMTP id G9xpCgBHQNgi54FezN5yAQ--.137S2;
 Mon, 30 Mar 2020 20:33:38 +0800 (CST)
To: Cyril Hrubis <chrubis@suse.cz>, Zou Wei <zou_wei@huawei.com>
References: <1585553269-119544-1-git-send-email-zou_wei@huawei.com>
 <1585553269-119544-2-git-send-email-zou_wei@huawei.com>
 <20200330091835.GA9845@yuki.lan> <20200330092046.GB9845@yuki.lan>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <e08ee1c3-c537-a1ca-01b1-cf7d25d77117@163.com>
Date: Mon, 30 Mar 2020 20:33:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200330092046.GB9845@yuki.lan>
Content-Language: en-US
X-CM-TRANSID: G9xpCgBHQNgi54FezN5yAQ--.137S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKrW8uFW8Cry5JFWxCF1rJFb_yoW3WrbE9r
 Wayr48G34UWF47Jan8tr1UXrZFyFy3Z3yavrZ8Xay2g3s7Zr98KFyF9rZ7Ga47Aa12yFn8
 WFykWF4fK3yqvjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUekR65UUUUU==
X-Originating-IP: [122.96.41.200]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/1tbiMwL2XlXl2nmO4AAAsk
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/3] security/dirtyc0w: Fix bug caused by
 default umask
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

On 3/30/20 5:20 PM, Cyril Hrubis wrote:
> Hi!
>>> The case is only successful when system default umask is 0022.
>>> When default umask is 0077 or other values, should clear current umask by umask(0) in setup().
>> What exactly fails in the dirtyc0w because of non-standard umask?
>>
>> I can easily understand why fstat and statx fail, since we check the
>> file permissions there. Ideally the failure should have been part of the
>> patch description.
> Looking at the code I guess that the child fails to open the file
> created in parent before the setgid/setuid, something like this should
> really have been part of the patch description.
>
Hi Cyril,

Right, some default mask drop the read permission of g/o and

nobody user cannot do read. :-)

Thanks,

Xiao Yang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
