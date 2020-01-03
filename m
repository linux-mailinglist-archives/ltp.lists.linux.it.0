Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2946E12F9C6
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jan 2020 16:30:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DF2133C244B
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jan 2020 16:30:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 7BDA93C243A
 for <ltp@lists.linux.it>; Fri,  3 Jan 2020 16:30:15 +0100 (CET)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 9B48B1000C3B
 for <ltp@lists.linux.it>; Fri,  3 Jan 2020 16:30:14 +0100 (CET)
Received: from mail-qk1-f170.google.com ([209.85.222.170]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MWjUc-1jFwI13VCi-00X6qg for <ltp@lists.linux.it>; Fri, 03 Jan 2020
 16:30:14 +0100
Received: by mail-qk1-f170.google.com with SMTP id x1so33986548qkl.12
 for <ltp@lists.linux.it>; Fri, 03 Jan 2020 07:30:13 -0800 (PST)
X-Gm-Message-State: APjAAAWAbO6oG8dpQBJejr8z4ymGUnp0mrmKQATBGCCIRWInjmKtvu5s
 XSMQeOKpjtZMDGUhJRJqkzHz95v8d+VyeoSX5F8=
X-Google-Smtp-Source: APXvYqwHUYXqxj/j23T+ikUyIYNwMZifF+nmQ9YLHsVb0EE95ucvNJpStysB4sIHolKlqgQ3wE0r3lfmMIjKWFkIpZ0=
X-Received: by 2002:a05:620a:a5b:: with SMTP id
 j27mr71961132qka.286.1578065412765; 
 Fri, 03 Jan 2020 07:30:12 -0800 (PST)
MIME-Version: 1.0
References: <20200102215829.911231638@linuxfoundation.org>
 <CA+G9fYuPkOGKbeQ0FKKx4H0Bs-nRHALsFtwyRw0Rt5DoOCvRHg@mail.gmail.com>
 <CAK8P3a1+Srey_7cUd0xfaO8HdMv5tkUcs6DeDXzcUKkUD-DnGQ@mail.gmail.com>
In-Reply-To: <CAK8P3a1+Srey_7cUd0xfaO8HdMv5tkUcs6DeDXzcUKkUD-DnGQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 3 Jan 2020 16:29:56 +0100
X-Gmail-Original-Message-ID: <CAK8P3a24EkUXTu-K2c-5B3w-LZwY7zNcX0dZixb3gd59vRw_Kw@mail.gmail.com>
Message-ID: <CAK8P3a24EkUXTu-K2c-5B3w-LZwY7zNcX0dZixb3gd59vRw_Kw@mail.gmail.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
X-Provags-ID: V03:K1:sJqlIRAl+hd1C0qRk3ufcQ8yFv8fzEa0ZaV2Nz0PgMguEPpDjpq
 EiK+QS6hlBWhcTDbKkyfrVsEMBdPa9krYESHCllTDRRapoSrAUDTr1TbQsUtCu7PPo4aeDn
 Eq1sEwX0Lj+l7aOOjHY5O/yuZSuAcFiAZt7OJ1t4FYyzrDpcI+RDzBgkZ6M6DstsILQ4PxY
 pYFZdSn1dHQvMbJtAYCtg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HWGzWzE/KcY=:K9JhgA78ZPYEz3zVOhBTgl
 r+YoawfSSDMPIsEMKPqq2ILe+p545H5lnhgproC43St/d0RxsD/aUOOdzAcQhFGZJLyZ53MDp
 lzYiDpq6q8fwV9enLMYHJenAEuOcGCwENvFSoaU+OxLUUeErYyPOgXP+C/WVYTRUiNajYFl2v
 S24wHW0/2h8H6J/iWHHOl0q2hBhUYoAQSOrjq1woNwOflwAci6TNt+JAma2xo+idcY14rtZGa
 waQU6+ytyyUDBiOFe1sT0kZ29aJbY0P61EhfmkLbz38Mmn6u9gNHkhPBqUh/WXmLtN9HBi665
 PazmsIsp8MmVUHpBt1HqXSiyBj74o5ioRE/6cxIctzsLJq91fVawcz9De4QcZQSiyXOBMuU0Q
 xrzzuQERyVh7yRdNk/Qr3j75dTE1l2riFzwvGhtst7i/Ub94YTgQxD+bHoCWQMVebJ67Sz0he
 Bot3mL8HIqMvmtW1kZwX0NmxPv2GaJmye1iDLYsQgQI1UnBl2jFHkFv2Uv63jhTEUf+PjRHKI
 NLHZ7NgT4FkeLOPQW1jXNc+ya/YLZ38wBPoH0rGduYABByuqnrzlOjNTc2NjkmUnJSyXp7jcL
 WUNU5aFWI5xZJvC5yvVeaSJedc8gyx1eVsT0pkRLQDmuj2YCUy5AGNYArZSRcvT1tDi/utslY
 arrCb+/XkCfQ/JiZda42WphZ6KBPUCff70TqpLqDlX5bnoeVuTNa/lYAfJhESkZpehIpKExhU
 IPIB2X3nHq2yhwdefv9c28mFDBUFp9Rw7D1fshvwrlQnBxYoas1nqU97OMrfTGzHLKzoSVw8x
 Qc8Cc6UdNJZcKL3slHuzmY9JrIqLAB1wdzNFoR2Mne9ZpmUCf2o381HtKaQ/Oo5ZEfyndO4um
 cZ2RzeOASaS4ahdeqW2Q==
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
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
Cc: Al Viro <viro@zeniv.linux.org.uk>, David Howells <dhowells@redhat.com>,
 Ben Hutchings <ben.hutchings@codethink.co.uk>, Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LTP List <ltp@lists.linux.it>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 patches@kernelci.org, Chengguang Xu <cgxu519@mykernel.net>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 John Stultz <john.stultz@linaro.org>, linux- stable <stable@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, Jan 3, 2020 at 4:25 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, Jan 3, 2020 at 4:03 PM Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> >
> > On Fri, 3 Jan 2020 at 03:42, Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
>
> -ENOENT is what you get when hugetlbfs is not mounted, so this hints to
>
> 8fc312b32b2  mm/hugetlbfs: fix error handling when setting up mounts
>
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?h=linux-5.4.y&id=3f549fb42a39bea3b29c0fc12afee53c4a01bec9

I see that Mike Kravetz suggested not putting this patch into stable in

https://lore.kernel.org/lkml/befca227-cb8a-8f47-617d-e3bf9972bfec@oracle.com/

but it was picked through the autosel mechanism later.

      Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
