Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E71CA130F21
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jan 2020 10:03:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 381C33C24B0
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jan 2020 10:03:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 3D73F3C2454
 for <ltp@lists.linux.it>; Mon,  6 Jan 2020 10:03:15 +0100 (CET)
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4ECB81401627
 for <ltp@lists.linux.it>; Mon,  6 Jan 2020 10:03:15 +0100 (CET)
Received: by mail-lj1-x241.google.com with SMTP id l2so50164301lja.6
 for <ltp@lists.linux.it>; Mon, 06 Jan 2020 01:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CeH+kQ0Qe8jVFl0FEZFj+JiqWbIaJiNDGyhGbyxRwj4=;
 b=XA+w1MAQwy4oE7FoGRn4Ac2fYBZydctJDh5Jb7kz7jErQaINP0+KvyQ50gqNwiZyCS
 4YWjZcvg4tZpWZSwHneQMGnBfazen79DSAkgN8eyiVAY1xjN/hjh4bFDoEpLfHO+gOGz
 quWftU/KkRI78okF7/BNkniOzH0hjILfz5N6n1REhnkiI5Z7wygjilreH3MnhSZ7UIbo
 Sgdh+tmW1HQ+8KHtC7At5UNSnfI6RJgid3CQK8W4VdCWnulJMI8QdwTgaf8JnWZGls3z
 HiY0N45FGP3rvfektTexAH91mLX6eOivmLwuMjVfBEXsoV9eZfhkqWQEhhmamw/VwonI
 uY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CeH+kQ0Qe8jVFl0FEZFj+JiqWbIaJiNDGyhGbyxRwj4=;
 b=WxfLKQ9mtyfmQqQs0m2uN5ta/ZfH1FTOoNsBGWVaAHkORVocfySNIut4LrsitT2eB1
 po/W+4Y+Fne8/e4V8Drlj8hVx8d/rsVjOwtPm6P2HaCYae6sZ1J+E7nIRWvHfiq55A1n
 qrzz1aZ/2yCwcNX5lqMN24z3dN2GLoUJfqlDtNrJqocRQzT3hQ684FItXHFquIkudUNl
 tfcBcwYw4wYtIwPRjx35QnPFNhJr0MZCIPt5ubTzbfDN1m00qq1h3awNJOkhm3+xgd5o
 kKd8hv0LTCioNPxcVZ+JK4a5DM7KWS422pgCkc/PftLHUc75PzFCodXnhoXfe13gTdfH
 mEzw==
X-Gm-Message-State: APjAAAUkOOa5f2uVXDhju3YfA5pYyO0zqK2lrWh7F1nUPy84XgvO6smS
 /B2nFdJixzXqpQhxw7XDOcRsDD01QvUALiQyFkCD9w==
X-Google-Smtp-Source: APXvYqyyYyXfN4bIo8fVghXO5BARXcu9jDvUQwl48nA0BGLXNo7fhOgd419s0X2DFiqJLbTMsn07A84oMJZGJ0aGPVk=
X-Received: by 2002:a2e:5357:: with SMTP id t23mr60119946ljd.227.1578301394444; 
 Mon, 06 Jan 2020 01:03:14 -0800 (PST)
MIME-Version: 1.0
References: <20200102215829.911231638@linuxfoundation.org>
 <CA+G9fYuPkOGKbeQ0FKKx4H0Bs-nRHALsFtwyRw0Rt5DoOCvRHg@mail.gmail.com>
 <CAK8P3a1+Srey_7cUd0xfaO8HdMv5tkUcs6DeDXzcUKkUD-DnGQ@mail.gmail.com>
 <CAK8P3a24EkUXTu-K2c-5B3w-LZwY7zNcX0dZixb3gd59vRw_Kw@mail.gmail.com>
 <20200103154518.GB1064304@kroah.com>
 <CAK8P3a00SpVfSE5oL8_F_8jHdg_8A5fyEKH_DWNyPToxack=zA@mail.gmail.com>
 <a2fc8b36-c512-b6dd-7349-dfb551e348b6@oracle.com>
 <8283b231-f6e8-876f-7094-d3265096ab9a@oracle.com>
 <CAHk-=wjvWTFn=C3mT5wA=mtOwXw44U+OHLVxk5DCe4v+7nOvKg@mail.gmail.com>
In-Reply-To: <CAHk-=wjvWTFn=C3mT5wA=mtOwXw44U+OHLVxk5DCe4v+7nOvKg@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 6 Jan 2020 14:33:02 +0530
Message-ID: <CA+G9fYvzkPz6Ewm00ie+HqBpfQHFuRGn694Av-gj8Pt8iKrDQg@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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
 Ben Hutchings <ben.hutchings@codethink.co.uk>, Arnd Bergmann <arnd@arndb.de>,
 Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LTP List <ltp@lists.linux.it>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 patches@kernelci.org, Chengguang Xu <cgxu519@mykernel.net>,
 John Stultz <john.stultz@linaro.org>, linux- stable <stable@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Sat, 4 Jan 2020 at 00:10, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, Jan 3, 2020 at 9:59 AM Mike Kravetz <mike.kravetz@oracle.com> wrote:
> >
> > Before I started investigating, Jan Stancek found and fixed the issue.
> >
> > http://lkml.kernel.org/r/a14b944b6e5e207d2f84f43227c98ed1f68290a2.1578072927.git.jstancek@redhat.com
>
> Applied upstream as commit 15f0ec941f4f ("mm/hugetlbfs: fix
> for_each_hstate() loop in init_hugetlbfs_fs()").

After applying above patch.
LTP test case memfd_create04 getting PASS on mainline Linus's tree
from Jan 3rd onwards.

ref link,
https://qa-reports.linaro.org/lkft/linux-mainline-oe/tests/ltp-syscalls-tests/memfd_create04

- Naresh Kamboju

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
