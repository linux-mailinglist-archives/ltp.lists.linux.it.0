Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DABF32A9936
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Nov 2020 17:14:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A30733C666F
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Nov 2020 17:14:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id B76E43C2FD6
 for <ltp@lists.linux.it>; Fri,  6 Nov 2020 17:14:39 +0100 (CET)
Received: from mail-m975.mail.163.com (mail-m975.mail.163.com [123.126.97.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 5BD2F200AFD
 for <ltp@lists.linux.it>; Fri,  6 Nov 2020 17:14:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=2xi0M
 CP1RuBNqPI71kph1+Z+1HA68P3vBEOargazQXY=; b=kiIcFmI9mPtbwa1wBaZJ5
 atOmwXGyhbgNd+5iHdRHS/fq8+Iz+ZHAImCzapuDZEHNnMAQSX2kkF8A9thaKiIc
 nNmQFon4d/Iya9GtvwrmEu/5wzuw8NX/zgi4uI2bqLrJNu2vFzPKFw65DKFMTT2z
 CLW8erDos1bRXCT4P+z8hA=
Received: from [172.20.10.4] (unknown [122.96.47.240])
 by smtp5 (Coremail) with SMTP id HdxpCgCXn6NfdqVfrAp4Ag--.4156S2;
 Sat, 07 Nov 2020 00:14:23 +0800 (CST)
To: Cyril Hrubis <chrubis@suse.cz>, Petr Vorel <pvorel@suse.cz>
References: <1603691317-22811-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <5FA21AA9.9020208@cn.fujitsu.com> <20201106123604.GA30097@yuki.lan>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <0bc685ce-1983-b900-787f-3d89e75ca48d@163.com>
Date: Sat, 7 Nov 2020 00:14:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201106123604.GA30097@yuki.lan>
Content-Language: en-US
X-CM-TRANSID: HdxpCgCXn6NfdqVfrAp4Ag--.4156S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU2-VyDUUUU
X-Originating-IP: [122.96.47.240]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/xtbBEB-UXlUMUa-7vAAAsl
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/4] syscalls/sync01: Remove it
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
Cc: LTP List <ltp@lists.linux.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 11/6/20 8:36 PM, Cyril Hrubis wrote:
> Hi!
>> Ping. I think this patchset is simple.
> Great cleanup, pushed, thanks.

Hi Cyril, Petr


I have a doubt after reading Xu's patch[1] and Martin's patch[2]:

1) Xu removed sync01 because sync() always return 0.

2) On error, normal syscall always return -1 but Martin added a check 
for undefined return value(i.e. negative value except -1).

Is it necessary to check undefined return value?


Patches:

[1]: [PATCH 1/4] syscalls/sync01: Remove it

[2]: [PATCH 03/19] Unify error handling in lib/tst_safe_timerfd.c


Best Regards,

Xiao Yang

>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
