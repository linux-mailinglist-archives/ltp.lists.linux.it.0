Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 247596AA39
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jul 2019 16:04:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B46943C1D37
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jul 2019 16:04:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 9E7D13C1C68
 for <ltp@lists.linux.it>; Tue, 16 Jul 2019 16:04:21 +0200 (CEST)
Received: from m12-12.163.com (m12-12.163.com [220.181.12.12])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id A96C61000525
 for <ltp@lists.linux.it>; Tue, 16 Jul 2019 16:04:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=5eWcF
 u59drF3sBa+PWF/czWoWDCb2R6utva3jQkt8w4=; b=qLza3nT4XMGLSsq5KCITV
 b5PgaFRwxwHp3hQC40wjt2pawFEG1o4yGvbbloYnJkJgIkgydmvXOVJhOyOIMqHr
 aeYKKIkRldUSELBKl9kAsG0qGYzqZ0TI8am2FQz25JLGV6dZBtwWGMCndbaQyDeT
 DStJyXytWTElWvL2R4PLj0=
Received: from [192.168.0.10] (unknown [183.210.51.51])
 by smtp8 (Coremail) with SMTP id DMCowACXxOxh2S1dApLLCg--.58932S2;
 Tue, 16 Jul 2019 22:04:18 +0800 (CST)
To: Cyril Hrubis <chrubis@suse.cz>
References: <1563203796-22102-1-git-send-email-ice_yangxiao@163.com>
 <20190715160010.GA30303@rei.lan>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <02b9f80d-05ec-e837-5770-c12f73f6bb0f@163.com>
Date: Tue, 16 Jul 2019 22:04:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20190715160010.GA30303@rei.lan>
Content-Language: en-US
X-CM-TRANSID: DMCowACXxOxh2S1dApLLCg--.58932S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrCFWUAFWUtF4rKF13Aw43Jrb_yoWxGwb_Wa
 40ga4xCw18trWrZryDAr43Ar4Ikr1UJrn5Jw1DGFy7Cr1ruF98Za929rW8JayDJay5WFWq
 934rXFsrKw17ZjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnovVtUUUUU==
X-Originating-IP: [183.210.51.51]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/xtbBEALzXlUMOHV3YgAAs+
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/acct02.c: Read threshold from
 /proc/sys/kernel/acct
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

On 07/16/2019 12:00 AM, Cyril Hrubis wrote:
> Hi!
>> Don't use hardcoded threshold(default 4%) to check free space
>> because it can be changed by writing "/proc/sys/kernel/acct"
>> or using sysctl.
> Good catch, I missed the sysctl API since I haven't realized that the
> proc handlers are all stuffed in a different file in kernel/sysctl.c.
>
> What about we as well temporarily lower the value if needed while the
> test is running?
Hi Cyril,

When free space is not enough, test can change the threshold by itself
or remind user to modify the threshold by sysctl API manually.

Which one do you prefer?

Best Regards,
Xiao Yang
>



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
