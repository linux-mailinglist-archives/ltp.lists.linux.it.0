Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 139CE12F9FE
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jan 2020 16:48:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D1F823C244A
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jan 2020 16:48:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 2B8803C2437
 for <ltp@lists.linux.it>; Fri,  3 Jan 2020 16:48:55 +0100 (CET)
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id F08FE1000BDD
 for <ltp@lists.linux.it>; Fri,  3 Jan 2020 16:48:53 +0100 (CET)
Received: by mail-pf1-x442.google.com with SMTP id x184so23717389pfb.3
 for <ltp@lists.linux.it>; Fri, 03 Jan 2020 07:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4841VwPNpkn9wbZnO4BJL9lu8LuOyQW8ecW89W7VNVc=;
 b=Pa8jbl7NgH9la/TweVO32qWWwqzMuJNgzm8nH7knLfbRtYW9QE6qaXLJ2/1dCij4nW
 Ux8yY1QF/sDJIAih9Ef5Hhi799FQtwTcYELpqRcb1hX1ave09efKfCyUFTB1/S7SmMX5
 PMa0Axr1Dzu+JxBEgMPZiVDvskx4a3XBW6c7lfxGJnSyWloTCTijtHizbakiD35zFiZK
 v+P8WEnSE6cAxvu+3qoG8SnvmrnlSXzhd8FwOipZjt5le5YDgJ6LB1177ZRktCSCbOys
 osFZKTpD8GkzDsv7Q/vJSqDXC4BFGVAD1OjwGd6/ZaiUGH9TdgAleWzq/LezF4F1xvjo
 9J2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4841VwPNpkn9wbZnO4BJL9lu8LuOyQW8ecW89W7VNVc=;
 b=Utz6GDRy2fupJ3XkMSBtyQ/kbYeHQIpUdR9IcmgQi6WhC+K6jYX1u0PMjDAetGde8l
 Ylmao6PshClfACv/sksTNnJSQ0Y2WSb90hSysioXubn+7UAx0ME1HwbjX/Kw0E+Aukp2
 198E34zAmAnzHti4H9TZz+g+psHA621PBoyTpKNhbzS+J9UEZuDMquvvpYpuXFCHxMDx
 YxN0Rg2c4cDjo51bKH8oXnIdduqxmxbrE2V4+olTG1LM75TwrQ5l3jvd5x5Zek4n20g4
 DVEzy9B7PGl4xhIVWGO4G1uJHMGjFlKgR0KdBFukT5s1/hOR8UlF6y6Z32ZduugZu1uS
 w/XQ==
X-Gm-Message-State: APjAAAXwRZ/1s9GrJ2u8yb3x6qkZO4BqoOBSjlnUVirvWIH5BAxopBzn
 whhx/wNYH/8Xpc4HP7dhAd8=
X-Google-Smtp-Source: APXvYqyfy6Tr7QCeoOvv+AXrziEDm9uVlHL+x6axpvgqGKFvrxVuIPtwM1hrAiXqYJWCcCLRyDTVDA==
X-Received: by 2002:a63:2ac2:: with SMTP id
 q185mr97770833pgq.417.1578066532263; 
 Fri, 03 Jan 2020 07:48:52 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 k5sm14922486pju.5.2020.01.03.07.48.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jan 2020 07:48:51 -0800 (PST)
To: Arnd Bergmann <arnd@arndb.de>, Naresh Kamboju <naresh.kamboju@linaro.org>
References: <20200102215829.911231638@linuxfoundation.org>
 <CA+G9fYuPkOGKbeQ0FKKx4H0Bs-nRHALsFtwyRw0Rt5DoOCvRHg@mail.gmail.com>
 <CAK8P3a1+Srey_7cUd0xfaO8HdMv5tkUcs6DeDXzcUKkUD-DnGQ@mail.gmail.com>
 <CAK8P3a24EkUXTu-K2c-5B3w-LZwY7zNcX0dZixb3gd59vRw_Kw@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <180c36d7-336b-f7a9-66d4-49703eca2aa9@roeck-us.net>
Date: Fri, 3 Jan 2020 07:48:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAK8P3a24EkUXTu-K2c-5B3w-LZwY7zNcX0dZixb3gd59vRw_Kw@mail.gmail.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.7 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 5.4 000/191] 5.4.8-stable review
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
Cc: Al Viro <viro@zeniv.linux.org.uk>, David Howells <dhowells@redhat.com>,
 Ben Hutchings <ben.hutchings@codethink.co.uk>, Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 patches@kernelci.org, Chengguang Xu <cgxu519@mykernel.net>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 John Stultz <john.stultz@linaro.org>, linux- stable <stable@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 LTP List <ltp@lists.linux.it>, Mike Kravetz <mike.kravetz@oracle.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 1/3/20 7:29 AM, Arnd Bergmann wrote:
> On Fri, Jan 3, 2020 at 4:25 PM Arnd Bergmann <arnd@arndb.de> wrote:
>>
>> On Fri, Jan 3, 2020 at 4:03 PM Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>>>
>>> On Fri, 3 Jan 2020 at 03:42, Greg Kroah-Hartman
>>> <gregkh@linuxfoundation.org> wrote:
>>
>> -ENOENT is what you get when hugetlbfs is not mounted, so this hints to
>>
>> 8fc312b32b2  mm/hugetlbfs: fix error handling when setting up mounts
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?h=linux-5.4.y&id=3f549fb42a39bea3b29c0fc12afee53c4a01bec9
> 
> I see that Mike Kravetz suggested not putting this patch into stable in
> 
> https://lore.kernel.org/lkml/befca227-cb8a-8f47-617d-e3bf9972bfec@oracle.com/
> 
> but it was picked through the autosel mechanism later.
> 

I think autosel is way too aggressive. This is an excellent example.

Guenter

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
