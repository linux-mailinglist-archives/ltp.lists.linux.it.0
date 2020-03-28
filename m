Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E8ACE1965AC
	for <lists+linux-ltp@lfdr.de>; Sat, 28 Mar 2020 12:22:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 012FA3C329A
	for <lists+linux-ltp@lfdr.de>; Sat, 28 Mar 2020 12:22:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id ACE003C325D
 for <ltp@lists.linux.it>; Sat, 28 Mar 2020 12:22:17 +0100 (CET)
Received: from m12-14.163.com (m12-14.163.com [220.181.12.14])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B6073200DDA
 for <ltp@lists.linux.it>; Sat, 28 Mar 2020 12:22:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=GVZKW
 tzAbz/hI9OYL0bZScExBRHsCXyWa0fFJS++a50=; b=fh6uCcbh5Q4vyEvBoNrmj
 V7H13QDv3xTUllIMWDT6e5Fpea54OTJn2kF0BDR2zjtmhs1cqdTFupyt804zM69i
 HBosxM3k7TOapaAy8YBm6gyBXsYVjYJBJkwmGUTWHG4DngzwQoqn/KTFu8NI+Y8B
 i2O/M3SP14bbZMw/PIlD6g=
Received: from [192.168.0.10] (unknown [223.64.160.247])
 by smtp10 (Coremail) with SMTP id DsCowACnfXZhM39eRY8mBw--.895S2;
 Sat, 28 Mar 2020 19:22:09 +0800 (CST)
To: Zou Wei <zou_wei@huawei.com>, ltp@lists.linux.it
References: <1585378614-16872-1-git-send-email-zou_wei@huawei.com>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <37690463-e988-cc75-4ffb-da036a83d027@163.com>
Date: Sat, 28 Mar 2020 19:22:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1585378614-16872-1-git-send-email-zou_wei@huawei.com>
Content-Language: en-US
X-CM-TRANSID: DsCowACnfXZhM39eRY8mBw--.895S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF4DCw47uFW5tF4kAr1fWFg_yoWfKFXEkF
 12kr18Kr9xZ3Wjkay7CFn3ZF909as7Gay5KrnrK34DWws2qr1DurnxAr4rJrs5CrnYvFZF
 gwn5GFZYqa1qvjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU5fgA7UUUUU==
X-Originating-IP: [223.64.160.247]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/xtbBEAH0XlUMQBTjiQAAsc
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] security/dirtyc0w: Get and set umask in setup
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 3/28/20 2:56 PM, Zou Wei wrote:
> The case is only successful when system default umask is 0022.
> When umask is 0077, should change the value to 0022 in setup.
>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>
> ---
>   testcases/kernel/security/dirtyc0w/dirtyc0w.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/testcases/kernel/security/dirtyc0w/dirtyc0w.c b/testcases/kernel/security/dirtyc0w/dirtyc0w.c
> index a0a81b6..7abb5a2 100644
> --- a/testcases/kernel/security/dirtyc0w/dirtyc0w.c
> +++ b/testcases/kernel/security/dirtyc0w/dirtyc0w.c
> @@ -45,6 +45,10 @@ static void setup(void)
>   {
>   	struct passwd *pw;
>
> +	if ((umask(0))==63){
> +		umask(18);
> +	}
> +

Hi Zou,

just clear current umask by umask(0) here if you want to exclude the 
impact of umask.

btw: it is readable to use otcal number(e.g. umask(0022) == 0022)

Thanks,

Xiao Yang

>   	pw = SAFE_GETPWNAM("nobody");
>
>   	nobody_uid = pw->pw_uid;
> --
> 2.6.2
>
>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
