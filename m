Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CF293225D5A
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 13:25:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5936E3C4E25
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 13:25:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id A3D103C2490
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 13:25:03 +0200 (CEST)
Received: from m12-13.163.com (m12-13.163.com [220.181.12.13])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5CA4C6006D9
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 13:23:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=tdRy/
 fsdbdEy8cMl8Fjgj2udKZBNKsuO8RsNzTFqr1w=; b=IxWtCsLiIlvcr0YlzzWSH
 UZe4OIxdzA0V2Fm6+AYtNfo6YnUD2aqXeTvOhda2NykmUZ0FXC2BFewhjbhpoXbd
 jUWhHE/tv6CGjNKwC86bZKaLAGD5HipJ11ERopxnMpbiqTWZsYjw3HGESf1jEqlV
 nxHaJM5TEb0+CoCuFkiQNY=
Received: from [192.168.0.10] (unknown [183.210.51.228])
 by smtp9 (Coremail) with SMTP id DcCowABHXkoGfxVfXXB9KA--.1096S2;
 Mon, 20 Jul 2020 19:24:55 +0800 (CST)
To: Viresh Kumar <viresh.kumar@linaro.org>, Xiao Yang <yangx.jy@cn.fujitsu.com>
References: <20200720052755.21105-1-yangx.jy@cn.fujitsu.com>
 <20200720085311.h77zxzfsqrhmmy2w@vireshk-mac-ubuntu>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <19b160e1-be12-bb32-a2cd-1c2be24428cb@163.com>
Date: Mon, 20 Jul 2020 19:24:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200720085311.h77zxzfsqrhmmy2w@vireshk-mac-ubuntu>
Content-Language: en-US
X-CM-TRANSID: DcCowABHXkoGfxVfXXB9KA--.1096S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JFWrCw45CFy7Gw4xZr4fXwb_yoW3Grb_Ca
 yF9rZ7urWjgFnakaySkan8Z3s2ka1xX34UXF15XryrXrn0qa98XF93KrWvyr1DuFZ7XFnr
 WF1ava4Iqr1IqjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0uMKtUUUUU==
X-Originating-IP: [183.210.51.228]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/1tbiFgRnXl44MN86VwABsO
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] syscalls/pidfd_open01.c: Add check for
 close-on-exec flag
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

Hi Petr, Viresh

Thanks a lot for your review, pushed. :-)

Thanks,

Xiao Yang

On 7/20/20 4:53 PM, Viresh Kumar wrote:
> On 20-07-20, 13:27, Xiao Yang wrote:
>> pidfd_open(2) will set close-on-exec flag on the file descriptor as
>> it manpage states, so check close-on-exec flag by fcntl(2).
>>
>> Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
>> ---
>>
>> 1) We don't care if the test uses the TEST() macro so just keep it.
>> 2) Use bare fcntl() instead of SAFE_FCNTL() so that file descriptor
>>     can be closed when fcntl(F_GETFD) fails.
>>
>>   .../kernel/syscalls/pidfd_open/pidfd_open01.c  | 18 ++++++++++++++++--
>>   1 file changed, 16 insertions(+), 2 deletions(-)
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
