Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA652AA17F
	for <lists+linux-ltp@lfdr.de>; Sat,  7 Nov 2020 00:46:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DCBDE3C6D68
	for <lists+linux-ltp@lfdr.de>; Sat,  7 Nov 2020 00:46:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 01FAD3C2FD6
 for <ltp@lists.linux.it>; Sat,  7 Nov 2020 00:46:26 +0100 (CET)
Received: from m12-12.163.com (m12-12.163.com [220.181.12.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C948E6009AD
 for <ltp@lists.linux.it>; Sat,  7 Nov 2020 00:46:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=JKTBs
 nUFYXcAwCJvGrTDJfsTQxxbL9Re89beLOBGGe0=; b=XOYc55CzgPzUoiOEbhbqT
 CGK1ocXAnHG6jx7THgTuj2yJqE2V+N5gwIRmkjrShlAk/4H/s2zugbj0fBORrSQO
 ssq7gDLk1Ew3vd1B/M3HQ7ccqtF1ZwcSRMb/yMZFXqnDO8e2NCOewiykV6G14I9Y
 1chG/Od4krDSPqccnoa2tg=
Received: from [192.168.0.5] (unknown [112.23.237.186])
 by smtp8 (Coremail) with SMTP id DMCowAAnju5M4KVfhnCtAA--.3807S2;
 Sat, 07 Nov 2020 07:46:21 +0800 (CST)
To: Cyril Hrubis <chrubis@suse.cz>
References: <1603691317-22811-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <5FA21AA9.9020208@cn.fujitsu.com> <20201106123604.GA30097@yuki.lan>
 <0bc685ce-1983-b900-787f-3d89e75ca48d@163.com>
 <20201106164742.GA6449@rei.lan>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <f99d3484-f86d-dd8a-e64e-7d9d94533de4@163.com>
Date: Sat, 7 Nov 2020 07:46:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201106164742.GA6449@rei.lan>
Content-Language: en-US
X-CM-TRANSID: DMCowAAnju5M4KVfhnCtAA--.3807S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxBOJUUUUU
X-Originating-IP: [112.23.237.186]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/xtbBEA3UXlUMUbPWaQAAsT
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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

On 11/7/20 12:47 AM, Cyril Hrubis wrote:
> Hi!
>> I have a doubt after reading Xu's patch[1] and Martin's patch[2]:
>>
>> 1) Xu removed sync01 because sync() always return 0.
> Actually sync() is defined as void function, so the tests were bogusly
> checking the TST_RET value which haven't been set at all.

Hi Cyril,

Oops, I gave a wrong example. :-(

On error, I just wonder if we need to check all return value(i.e. 
negative value except -1).

IOW, Is it possible for syscall to get a error value which is not -1?

Best Regards,

Xiao Yang

>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
