Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6A812F9B2
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jan 2020 16:26:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 62ABB3C244B
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jan 2020 16:26:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 8B56A3C243A
 for <ltp@lists.linux.it>; Fri,  3 Jan 2020 16:26:03 +0100 (CET)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 90BFD201082
 for <ltp@lists.linux.it>; Fri,  3 Jan 2020 16:26:02 +0100 (CET)
Received: from mail-qk1-f181.google.com ([209.85.222.181]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MXGSU-1jEHnL2hag-00YhV4 for <ltp@lists.linux.it>; Fri, 03 Jan 2020
 16:26:01 +0100
Received: by mail-qk1-f181.google.com with SMTP id k6so34022641qki.5
 for <ltp@lists.linux.it>; Fri, 03 Jan 2020 07:26:01 -0800 (PST)
X-Gm-Message-State: APjAAAVe53N0JQLj17x4hQd5gh+fZ5toR0tiew/et07JUE2gxqgiO6Xi
 IdbZBfCW6r/3wKTdREJE7qE6f2alwk9tGLVfy4k=
X-Google-Smtp-Source: APXvYqw5wnevAuaN2LN4c1YLinEZyD+hKfKYUMCcrCgzN//nGAYKw5prrzNRF6UgFsNumMjF27D+d3bIomT5Tv6ETuE=
X-Received: by 2002:a37:84a:: with SMTP id 71mr69963622qki.138.1578065160510; 
 Fri, 03 Jan 2020 07:26:00 -0800 (PST)
MIME-Version: 1.0
References: <20200102215829.911231638@linuxfoundation.org>
 <CA+G9fYuPkOGKbeQ0FKKx4H0Bs-nRHALsFtwyRw0Rt5DoOCvRHg@mail.gmail.com>
In-Reply-To: <CA+G9fYuPkOGKbeQ0FKKx4H0Bs-nRHALsFtwyRw0Rt5DoOCvRHg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 3 Jan 2020 16:25:44 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1+Srey_7cUd0xfaO8HdMv5tkUcs6DeDXzcUKkUD-DnGQ@mail.gmail.com>
Message-ID: <CAK8P3a1+Srey_7cUd0xfaO8HdMv5tkUcs6DeDXzcUKkUD-DnGQ@mail.gmail.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
X-Provags-ID: V03:K1:AB47UPq0RYBvxcohIqTAmpnfAdA8qB3xqJrbTqtdCMvZRSuuOmU
 HzrFdDipSmIcD3b6ZtsNopNOZR6FEkvN4bZodBQ4R7XRoUjkMI+wjHEHoRbxsJl4XI5lmiV
 zXeIveRlRpi6BzvIOlh/mW8PpMjqHajB18BnsSEOKMzZvvWaOPgQ7xR1+BDl0UIneAwjFHb
 Cc4p7m2a9jp+w5hVhOlvQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XOxjZAN/SN8=:/0L+fprfZPgkQwIVZsI3xr
 Su4qjJDt0OeKniwHsrHsPifbb4bamuMHchvC/KF849ycFHCMmHmCgScR15sS006LOMmVjBbOf
 3KprqEeOuHk0qVTYT6Koml53t6BElxt0j2cAZLkqlls2qvQGgtF2en+jIN4GJ9v2JN2PkwN3F
 MoGboTdQz/KzTfihmkQwyZoryYnWxETd11Ehi23IHS7TNctciaa5XLluVhGRJqkHTuJ7r8+Oz
 YZzm+2SqZwZxR8W2amhNKS4MNiP6buekKY5cnHdkuwVE4+2w3gGTwbuMkNC+N0n0gJZGeQJBZ
 Mx/MuhHVq9bRTklTeZVG5438jb0ftxUGE/pCJUgr3VIg/IXeWxcxOQDYrAcsMoubT9Q8BqNks
 vh6yAxyeAQd9srXI/gyDT1R+PIW04mmGSSISlPSA1kL8EWzmXLC0RXbt64mkHmBYbnceE929y
 QZxyq8MW8SbCF8bS1dGmgQYoZ3tpWxlMpdezrzJzdPqxOhq+TbA77AhX2XfkvmmAEYt2g362A
 PHFaFo2ChhnV2yTSt9kVk5k5DeWzaEWbpBMYwe31ZAX5sJwkGKS4VouhVx5EQCv7TRshaIpon
 1nBkid0UNiIiunPTGcIhpmQ1MdIxwEL9lquzcIniQx3aLVf6ni2VPKP6yVOM8kK0oHzgxuvhI
 aN111KgNJkCyypUGhvdWujemi6YgvflGgODM3eDDYBqMURZ5BhrRdiQnvC3pbpDM3LvHA16F7
 RtV08zaeorZVY/AdwOs0hqpY9viedMrPrLhuW8JM7hzheNapTQ6WYp3k3Wq2jJsuK3icJNRbK
 qaeL39xIt/kBshqAhL8MbvZKaRT4oyRFY95EP1hNhGppG799AFuVqAsF/w4xQQzeslKEAqpoH
 9b1D/8YAnroACXtkt+WA==
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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

On Fri, Jan 3, 2020 at 4:03 PM Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> On Fri, 3 Jan 2020 at 03:42, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > This is the start of the stable review cycle for the 5.4.8 release.
> > There are 191 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> >
> > Responses should be made by Sat, 04 Jan 2020 21:55:35 +0000.
> > Anything received after that time might be too late.
> >
> > The whole patch series can be found in one patch at:
> >         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.4.8-rc1.gz
> > or in the git tree and branch at:
> >         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.4.y
> > and the diffstat can be found below.
> >
> > thanks,
> >
> > greg k-h
>
> LTP syscalls memfd_create04 failed on arm64 devices.
> Test PASS on arm, i386 and x86_64.
>
> We are bisecting this failure on arm64.
>
> Test case failed log,
> memfd_create04.c:68: INFO: Attempt to create file using 64kB huge page size
> memfd_create04.c:76: FAIL: memfd_create() failed unexpectedly: ENOENT (2)
>
> Strace output:
> memfd_create(\"tfile\", MFD_HUGETLB|0x40000000) = -1 ENOENT (No such
> file or directory)

-ENOENT is what you get when hugetlbfs is not mounted, so this hints to

8fc312b32b2  mm/hugetlbfs: fix error handling when setting up mounts

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?h=linux-5.4.y&id=3f549fb42a39bea3b29c0fc12afee53c4a01bec9


> Test case Description,
>
> /*
> * Test: Validating memfd_create() with MFD_HUGETLB and MFD_HUGE_x flags.
> *
> * Test cases: Attempt to create files in the hugetlbfs filesystem using
> * different huge page sizes.
> *
> * Test logic: memfd_create() should return non-negative value (fd)
> * if the system supports that particular huge page size.
> * On success, fd is returned.
> * On failure, -1 is returned with ENODEV error.
> */
>
> Test code snippet:
> <>
> check_hugepage_support(&tflag);
> tst_res(TINFO,
> "Attempt to create file using %s huge page size",
> tflag.h_size);
>
> fd = sys_memfd_create("tfile", MFD_HUGETLB | tflag.flag);
> if (fd < 0) {
> if (errno == tflag.exp_err)
> tst_res(TPASS, "Test failed as expected\n");
> else
> tst_brk(TFAIL | TERRNO,
> "memfd_create() failed unexpectedly");
> return;
> }
>
> <>
>
> Steps to reproduce:
>           - cd /opt/ltp/testcases/bin/
>           - ./memfd_create04
>
> https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/syscalls/memfd_create/memfd_create04.c#L75
>
> Test output log,
> https://lkft.validation.linaro.org/scheduler/job/1081716
>
> Test results comparison,
> https://qa-reports.linaro.org/lkft/linux-stable-rc-5.4-oe/tests/ltp-syscalls-tests/memfd_create04
>
>
> --
> Linaro LKFT
> https://lkft.linaro.org

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
