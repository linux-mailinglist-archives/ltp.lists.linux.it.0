Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C6584197C3E
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 14:49:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5A7C53C3187
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 14:49:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id B662E3C3145
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 14:49:14 +0200 (CEST)
Received: from mail-m973.mail.163.com (mail-m973.mail.163.com [123.126.97.3])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 0C0EC1A00ECB
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 14:49:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=MYlJM
 2yNCKsz22F34ZkRgCPFjg+q2KJJn5dBcEQ8NOE=; b=n1Evr1MisoWUNaaCiLeXj
 EnThNvtSfRIkglnm+P4GvfFhunX1zsUlA+51aKMl3bvksmr6sXCYfGK5IMCpE1R/
 vKNz/DKmdCnhSZniYxCHuLSgE48RxRS+RKveZmFMrbs6p+NApKr/kPmq9DPKCzMZ
 VhZrOpuHUbsox5e93vdKUY=
Received: from [172.20.10.4] (unknown [122.96.41.200])
 by smtp3 (Coremail) with SMTP id G9xpCgA3Oiq76oFeDrRzAQ--.2S2;
 Mon, 30 Mar 2020 20:49:00 +0800 (CST)
To: Cyril Hrubis <chrubis@suse.cz>, Petr Vorel <pvorel@suse.cz>
References: <1585553269-119544-1-git-send-email-zou_wei@huawei.com>
 <1585553269-119544-2-git-send-email-zou_wei@huawei.com>
 <20200330091835.GA9845@yuki.lan> <20200330092046.GB9845@yuki.lan>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <f78cb609-b4f1-2f89-a641-09a97c2d0a03@163.com>
Date: Mon, 30 Mar 2020 20:48:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200330092046.GB9845@yuki.lan>
Content-Language: en-US
X-CM-TRANSID: G9xpCgA3Oiq76oFeDrRzAQ--.2S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFy8CF43JF15GrW7tFWrZrb_yoWfGrgEgr
 4jyF1xG34UWr4fXan8Jr1jqrZ2kry7X3yayrZ8Xa40g34furn8KFnY9rZrJay7Jw4ayFn8
 WryDXF4fK3y2qjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUeveH3UUUUU==
X-Originating-IP: [122.96.41.200]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/xtbBEBz2XlUMQDgazwAAsQ
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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

Hi Cyril, Petr

Just one question when reviewing this patch set.

I saw the umask set(e.g. set umask to 0 or 0022) is used by a lot of tests.

Is it necessary for metadata project to introduce .needs_umask?

Thanks,

Xiao Yang

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


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
