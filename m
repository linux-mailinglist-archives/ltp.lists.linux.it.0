Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FD014684D
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jan 2020 13:44:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9FB023C24C1
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jan 2020 13:44:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 9B8343C2499
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 13:44:54 +0100 (CET)
Received: from m12-17.163.com (m12-17.163.com [220.181.12.17])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A84921000D43
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 13:44:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=6C6Mb
 Dx0+mD73uhQgzR+i+kzCbK+tD6T6hN07H4mHmU=; b=kvObP8fZs0BFbZ7rEJ5fk
 rzMc+CbdDakh7G8EJvYQTJfM8vtxSVOcIh42ZOCZdVJac9hx4d/szRuhhpYuzOJa
 RPVzadQo0S9I0hqiBff4qTZies2JOQ9pljjifjAtjKcu9Clqlz6XiKHuLxM/diUr
 oxqbmPctu5xUCBeAIffeU0=
Received: from [192.168.0.109] (unknown [112.22.70.203])
 by smtp13 (Coremail) with SMTP id EcCowAAXUvNAlSlej7qUfw--.450S2;
 Thu, 23 Jan 2020 20:44:49 +0800 (CST)
To: Cyril Hrubis <chrubis@suse.cz>
References: <20200121151342.GD6337@rei>
 <1579670796-21233-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200123111347.GE27845@rei>
From: Yang Xu <xuyang_jy_0410@163.com>
Message-ID: <0b715eaf-cb87-8604-a305-5443f4741c9f@163.com>
Date: Thu, 23 Jan 2020 20:44:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200123111347.GE27845@rei>
X-CM-TRANSID: EcCowAAXUvNAlSlej7qUfw--.450S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFy7Kr1rGr4kJFy3XrWfAFb_yoWfXFc_Wr
 ZrZas7WrZ5tFn7JF4Dt3y3J3y7Gr4xGrn7Jryvvry3ta4FvFnrWa18CryrJa1xtFZIvrsx
 Gr4FvryxX34akjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0veHDUUUUU==
X-Originating-IP: [112.22.70.203]
X-CM-SenderInfo: p0x1t05jbm5saquriqqrwthudrp/1tbiXAGzhFXluxGaawAAsB
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/add_key01: test the length of payload
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


> Hi!
>> Seeing add_key manpages, the length of payload for "user"/"logon"
>> is 32767, this value is up tp 1M for "big_key". For "keyring" type
>> , this value is zero.
> 
> This version is nearly good, there are a few minor things I can fix up
> before applying.
> 
> However the test fails for me unless I run it as root. Looks like any
> key that is bigger than certain threshold fails with EDQUOT for me. Have
> you tried to run the test as an unpriviledged user?
Hi Cyril

I don't run this test under an unpriviledged user. Seeing keyrings 
manpages, it said "
/proc/sys/kernel/keys/maxbytes (since Linux 2.6.26)
This  is  the  maximum  number of bytes of data that a 	nonroot user can 
hold in the payloads of the keys owned by theuser.
The default value in this file is 20,000.

I perfer to add .needs_root in this flag and check this in a new case.
What do you think about it?

Best Regards
Yang Xu
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
