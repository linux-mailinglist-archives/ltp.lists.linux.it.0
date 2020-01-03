Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 874AE12FCB9
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jan 2020 19:48:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 307553C2454
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jan 2020 19:48:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id CDCBD3C2430
 for <ltp@lists.linux.it>; Fri,  3 Jan 2020 19:48:05 +0100 (CET)
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5A1AE1000445
 for <ltp@lists.linux.it>; Fri,  3 Jan 2020 19:48:05 +0100 (CET)
Received: by mail-lj1-x243.google.com with SMTP id y6so36750574lji.0
 for <ltp@lists.linux.it>; Fri, 03 Jan 2020 10:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=09Fhb5KJtdVXpuTOxj9n6AxgCLlTa7iHkIeQIqz8ZXQ=;
 b=gQn987UynqGEaSDi7PzqcZnNE24GYhuSwEuB8jnz/K2ht/y/6Y4Eaq+5ZrqWLDJKFm
 DLfYiRceU9rAJ/iKZ+Kcq3FhJfAejLiEOsXP6+apzeqFfjISklQkC5r1Z/2//zpdza/L
 28M2GzAciQMj90SjWNUCeoNq+D6s1/JuCsIig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=09Fhb5KJtdVXpuTOxj9n6AxgCLlTa7iHkIeQIqz8ZXQ=;
 b=NqqdJUWhK8xzXZXd5+uhSydcUm67v2N+0CCUNFa46yNktwqgVv/B1A92NlOVme+0+h
 DtZ5oQQf2QBDfHV1rJwWWyFBebQsrcQ5Uk13+wvoGHCadxY0qFQc3ul8Yd5qVkVmWfZI
 NSv0JYfPwoThN/0jUAAKj74OYksAx654eokORkNsuWjg6YxXz47URHBPIA62jy0iAAnF
 3DuMpZnytkauiPa+pVBI19/f4X54kbJca9Wvn7CCvPiqpiIX0/rVLDk4XRACUqxW+VK7
 BAl8f00EY3b6kW0l/4c6TtQSF1pTsUBFo9Xo+QFu2hrbTr3gOcoWfG2a2bJFusi0lY5C
 NklQ==
X-Gm-Message-State: APjAAAXsJiG3QI165fgFc1Fj688+TZ2gx6Sq1Nws3GxqkE0eQh3CpUnx
 2TAfE3GtdESRvwfPvpBtm9rlMfElc6Y=
X-Google-Smtp-Source: APXvYqz+XDdk6OynZ/o59RXYMR3rVbKzf2KAcEIpt5RZa9OUONhD5IfRo//4GUBXq8v5RoIhMw0RYQ==
X-Received: by 2002:a2e:8316:: with SMTP id a22mr2091029ljh.141.1578077284350; 
 Fri, 03 Jan 2020 10:48:04 -0800 (PST)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174])
 by smtp.gmail.com with ESMTPSA id q17sm24992970ljg.23.2020.01.03.10.48.03
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jan 2020 10:48:04 -0800 (PST)
Received: by mail-lj1-f174.google.com with SMTP id y4so30418582ljj.9
 for <ltp@lists.linux.it>; Fri, 03 Jan 2020 10:48:03 -0800 (PST)
X-Received: by 2002:a2e:9ad8:: with SMTP id p24mr53118229ljj.148.1578076856282; 
 Fri, 03 Jan 2020 10:40:56 -0800 (PST)
MIME-Version: 1.0
References: <20200102215829.911231638@linuxfoundation.org>
 <CA+G9fYuPkOGKbeQ0FKKx4H0Bs-nRHALsFtwyRw0Rt5DoOCvRHg@mail.gmail.com>
 <CAK8P3a1+Srey_7cUd0xfaO8HdMv5tkUcs6DeDXzcUKkUD-DnGQ@mail.gmail.com>
 <CAK8P3a24EkUXTu-K2c-5B3w-LZwY7zNcX0dZixb3gd59vRw_Kw@mail.gmail.com>
 <20200103154518.GB1064304@kroah.com>
 <CAK8P3a00SpVfSE5oL8_F_8jHdg_8A5fyEKH_DWNyPToxack=zA@mail.gmail.com>
 <a2fc8b36-c512-b6dd-7349-dfb551e348b6@oracle.com>
 <8283b231-f6e8-876f-7094-d3265096ab9a@oracle.com>
In-Reply-To: <8283b231-f6e8-876f-7094-d3265096ab9a@oracle.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 3 Jan 2020 10:40:40 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjvWTFn=C3mT5wA=mtOwXw44U+OHLVxk5DCe4v+7nOvKg@mail.gmail.com>
Message-ID: <CAHk-=wjvWTFn=C3mT5wA=mtOwXw44U+OHLVxk5DCe4v+7nOvKg@mail.gmail.com>
To: Mike Kravetz <mike.kravetz@oracle.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
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
Cc: Sasha Levin <sashal@kernel.org>, David Howells <dhowells@redhat.com>,
 Ben Hutchings <ben.hutchings@codethink.co.uk>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LTP List <ltp@lists.linux.it>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 patches@kernelci.org, Chengguang Xu <cgxu519@mykernel.net>,
 John Stultz <john.stultz@linaro.org>, linux- stable <stable@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, Jan 3, 2020 at 9:59 AM Mike Kravetz <mike.kravetz@oracle.com> wrote:
>
> Before I started investigating, Jan Stancek found and fixed the issue.
>
> http://lkml.kernel.org/r/a14b944b6e5e207d2f84f43227c98ed1f68290a2.1578072927.git.jstancek@redhat.com

Applied upstream as commit 15f0ec941f4f ("mm/hugetlbfs: fix
for_each_hstate() loop in init_hugetlbfs_fs()").

I didn't add a cc: stable, because the original didn't have one, and
the "Fixes:" tag should make it happen.

               Linus

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
