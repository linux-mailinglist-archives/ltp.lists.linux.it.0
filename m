Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB00225E91
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 14:30:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DAEC93C4E33
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 14:30:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 9EA433C072E
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 14:30:26 +0200 (CEST)
Received: from m12-12.163.com (m12-12.163.com [220.181.12.12])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 315A8600BDC
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 14:30:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=AyyQ3
 CyWHWNxo8ctwFxhrDDbxAVGiZ8GAVMo+cBFGZ0=; b=OvsZIPBXAFYanbvjUYNPi
 ED+Cvmv/Kohrt7IlgmX6m+kmlffHv9B228p6SbUHtEwtPrmUutOt0GRqlXyYhFoU
 nGVU8RQw/B29v3+rZXRk8KN4/cOau3uq3/f5xxURzNIUYX5JiGRczbxv2FgU+8FA
 spAONAi5wSK+najqjDGAEg=
Received: from [192.168.0.10] (unknown [183.210.51.228])
 by smtp8 (Coremail) with SMTP id DMCowAB39vZbjhVfSDivEw--.43829S2;
 Mon, 20 Jul 2020 20:30:20 +0800 (CST)
To: Petr Vorel <pvorel@suse.cz>, Xiao Yang <yangx.jy@cn.fujitsu.com>
References: <20200710172044.21592-1-pvorel@suse.cz>
 <20200710172044.21592-7-pvorel@suse.cz> <5F155DB2.8080709@cn.fujitsu.com>
 <20200720115345.GA21201@dell5510>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <9a30538f-bb7b-3fb9-7102-2f75b2d7de8c@163.com>
Date: Mon, 20 Jul 2020 20:30:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200720115345.GA21201@dell5510>
Content-Language: en-US
X-CM-TRANSID: DMCowAB39vZbjhVfSDivEw--.43829S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kw1DtFW3GFy5XF15uF13twb_yoW8Wr18pw
 43GF43Ar4UtFn5Ar1xtw1UGw4jqr1jyryUJr1xJrWxJFn8Zw1UtF4UCF18XFyUJayDJryU
 ZFW8JFWUWw48JFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jm89NUUUUU=
X-Originating-IP: [183.210.51.228]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/xtbBEBhnXlUMSsQl6AAAsr
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 6/7] net/test: Add basic testing for
 tst_rhost_run
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

On 7/20/20 7:53 PM, Petr Vorel wrote:
> Hi,
>
>>> +	tst_rhost_run -c 'which grep > /dev/null' || \
>>> +		tst_res TCONF "grep not found on rhost"
>> Hi Petr,
>> 1) Do you want to discard stderr as well? For example:
>> -------------------------------------------------
>> # which gre >/dev/null
>> /usr/bin/which: no gre in
>> (/opt/ltp/testcases/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:/root/bin)
> That's not needed because tst_rhost_run already redirect stderr to stdout.

Hi Petr,

I think you means tst_rhost_run -c 'which grep' >/dev/null rather than 
tst_rhost_run -c 'which grep > /dev/null'

The current code just discard stdout, for example:

-------------------------------------------------------

[root@Fedora-30-workstation net]# ./tst_rhost_run.sh
...
tst_rhost_run 1 TINFO: NETNS: ns_exec 3079 net,mnt sh -c " which gre > 
/dev/null || echo RTERR" 2>&1
which: no gre in 
(./../../../../testcases/lib/:/usr/share/Modules/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/root/bin:/opt/ltp/testcases/bin)

-------------------------------------------------------

Thanks,

Xiao Yang

>
>> -------------------------------------------------
>> 2) Is it necessary to continue if grep command is not found on rhost?
>> How about calling tst_brk?
> Good catch, I should use tst_brk on both places.
>
>>> +
>>> +	tst_rhost_run -c "[ -f $file ]" || \
>>> +		tst_res TCONF "$file not found on rhost"
>> Call tst_brk as well?
>> Thanks,
>> Xiao Yang
> Thanks!
> Petr
>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
