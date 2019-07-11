Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 55159654D7
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jul 2019 12:59:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 122BD3C1C95
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jul 2019 12:59:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 606203C1C67
 for <ltp@lists.linux.it>; Thu, 11 Jul 2019 12:59:50 +0200 (CEST)
Received: from mail-m972.mail.163.com (mail-m972.mail.163.com [123.126.97.2])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 5C88B1001994
 for <ltp@lists.linux.it>; Thu, 11 Jul 2019 12:59:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=8db9u
 1bDGvoFnj7EeK52sJmX1wBiX/RPSGPMaxe5zmM=; b=In6XGBanAPIlR8k1IyT2A
 0fjE/VgwNFSfqT7T/QWg6EPPioAijlslAylGZDjLLVUEAtZYcQNWRxvf4xGEETHK
 n1zMdiuRwtCALEXLa+wedr2esmlyopSWyDdwh0Su1xjUvhhnIfHCrHUE3SCAxk56
 d+ub33pDppovIFZ60RDx44=
Received: from [172.20.10.4] (unknown [122.194.3.19])
 by smtp2 (Coremail) with SMTP id GtxpCgBntvadFiddlrH+CA--.1457S2;
 Thu, 11 Jul 2019 18:59:42 +0800 (CST)
To: Petr Vorel <pvorel@suse.cz>, Xiao Yang <yangx.jy@cn.fujitsu.com>
References: <1562769310-4918-1-git-send-email-ice_yangxiao@163.com>
 <20190711060357.GA28190@dell5510> <5D26F438.5010706@cn.fujitsu.com>
 <20190711104226.GA23477@dell5510>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <d6c9e8af-b84c-7dd6-803b-c8b76a50ed49@163.com>
Date: Thu, 11 Jul 2019 18:59:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20190711104226.GA23477@dell5510>
Content-Language: en-US
X-CM-TRANSID: GtxpCgBntvadFiddlrH+CA--.1457S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrWr48CF15Wr13tr1xJrW5KFg_yoWxWrcE9r
 Z0y3s3uFsrJr1DCanxtwn0qr4UGa4jvryUW34fAw1aka4xZasrCa1ktrnFq3yrJ3y2qa4q
 kw1jvayFyry7ujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnnmRUUUUUU==
X-Originating-IP: [122.194.3.19]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/1tbiqADuXlc7JWkJjgAAs-
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] rcu/rcu_torture.sh: Rewrite test
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

On 07/11/2019 06:42 PM, Petr Vorel wrote:
> Hi Xiao,
>
>> Thanks for your detailed review.  Just one question:
>>> Maybe print dmesg (for automated tests, when you don't have direct access to
>>> machine).
>> Do you have any simple way to only print related dmesg for the every run
>> when running it in loops?
> Maybe some -c or -C dmesg switch? (at least cgroup_regression_test.sh or
> pm_sched_mc.py uses that).
> But that's maybe too aggressive (removes dmesg for all previous tests).
> So feel free to ignore this.
Hi Petr,

It's aggressive to me as well. :-)
I will send v4 patch as you suggested.

Best Regards,
Xiao Yang
>
> Kind regards,
> Petr


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
