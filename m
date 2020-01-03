Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD4012F972
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jan 2020 16:03:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 260D53C244B
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jan 2020 16:03:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 2EEA13C242A
 for <ltp@lists.linux.it>; Fri,  3 Jan 2020 16:03:35 +0100 (CET)
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 6BA9E600A58
 for <ltp@lists.linux.it>; Fri,  3 Jan 2020 16:03:34 +0100 (CET)
Received: by mail-lf1-x142.google.com with SMTP id l18so23871302lfc.1
 for <ltp@lists.linux.it>; Fri, 03 Jan 2020 07:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fXLuplpySrohqFP6kS7OpIEbP/zNERMePL4SR7+mMjs=;
 b=xvXL8AjzcVepvA9glzXDHT0fioLRNmbgVkJ0/9FZHbw7TOvSZOhWG2oTR3lrLr4fFS
 xvJvT3VjsTxoQlt2RRk8qYfOnwTXauUgzaMN6AZ8mmx6mawvrLaObvPuwQFI5cMsS52b
 gdkmpDZoSvX7Oz/7rwqlScIm22M68k6KgpmMNjbBvP/IDpTWp5ontHVuvJsLjq2Q+vwa
 yBmxqrzlpLByYN+vMlQtn+CadZ8L3SJZ97abkEr7kQnQxp3FTVycCcbP4yQcetMwuEoZ
 cjJkGbcIlHNVJ9MWdhHO1pHd2ru6qzdVy2xYQsefeW+tmreZ4XW4bpOuanrf/supdelY
 KmJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fXLuplpySrohqFP6kS7OpIEbP/zNERMePL4SR7+mMjs=;
 b=fcDCm/nSYNdV0U8Ux0qP/psf4GpYYCuFtuCMNafFAxndxGvqjvm34cp/GiEMfr1sCu
 pYeBqxTC0hWZpLTG0H/+PfYS730pifIB8+WeYocp1GtW4HS6tbofVcGxOdf+qvdZnR28
 gZtdbQSnvBkXHxysSD5HQYVYhtmZiy64QYDNXhGZDdy4aO5L3Oh5ZnLdyC4BXXthyIeQ
 zT0GntpWyorzyF4VwKELdXMRxPoBJ61dyTJBDD5k2GtDVuhtHWPnIRg2UCbqC6FAdpJZ
 LLaJOVMoNBu5VBvsbZcTMcDuf8uiqzp65iRcFjcvuJqdpRaSROnxHqn11U/r4P4vAG8v
 55LA==
X-Gm-Message-State: APjAAAXydfK767cnXxcZsP3LBmlI/nEE0EMCJ3PTT82QoD4ryJmpywkZ
 5czV6JEOptu9Vci+4kwwAY2dfPu7eSUXGO+VI253cA==
X-Google-Smtp-Source: APXvYqw4vzT9NE5JBE4750Ibpsg4DfZbpJYeAmaoiYp8s1njp31bKNa9lXROJc+TkxaJZn7Eff6d3LMnkGO/OqxXMpU=
X-Received: by 2002:a19:784:: with SMTP id 126mr49377262lfh.191.1578063813660; 
 Fri, 03 Jan 2020 07:03:33 -0800 (PST)
MIME-Version: 1.0
References: <20200102215829.911231638@linuxfoundation.org>
In-Reply-To: <20200102215829.911231638@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 3 Jan 2020 20:33:22 +0530
Message-ID: <CA+G9fYuPkOGKbeQ0FKKx4H0Bs-nRHALsFtwyRw0Rt5DoOCvRHg@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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
 Linus Torvalds <torvalds@linux-foundation.org>, LTP List <ltp@lists.linux.it>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 patches@kernelci.org, Chengguang Xu <cgxu519@mykernel.net>,
 John Stultz <john.stultz@linaro.org>, linux- stable <stable@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, 3 Jan 2020 at 03:42, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 5.4.8 release.
> There are 191 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sat, 04 Jan 2020 21:55:35 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.4.8-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.4.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

LTP syscalls memfd_create04 failed on arm64 devices.
Test PASS on arm, i386 and x86_64.

We are bisecting this failure on arm64.

Test case failed log,
memfd_create04.c:68: INFO: Attempt to create file using 64kB huge page size
memfd_create04.c:76: FAIL: memfd_create() failed unexpectedly: ENOENT (2)

Strace output:
memfd_create(\"tfile\", MFD_HUGETLB|0x40000000) = -1 ENOENT (No such
file or directory)

Test case Description,

/*
* Test: Validating memfd_create() with MFD_HUGETLB and MFD_HUGE_x flags.
*
* Test cases: Attempt to create files in the hugetlbfs filesystem using
* different huge page sizes.
*
* Test logic: memfd_create() should return non-negative value (fd)
* if the system supports that particular huge page size.
* On success, fd is returned.
* On failure, -1 is returned with ENODEV error.
*/

Test code snippet:
<>
check_hugepage_support(&tflag);
tst_res(TINFO,
"Attempt to create file using %s huge page size",
tflag.h_size);

fd = sys_memfd_create("tfile", MFD_HUGETLB | tflag.flag);
if (fd < 0) {
if (errno == tflag.exp_err)
tst_res(TPASS, "Test failed as expected\n");
else
tst_brk(TFAIL | TERRNO,
"memfd_create() failed unexpectedly");
return;
}
<>

Steps to reproduce:
          - cd /opt/ltp/testcases/bin/
          - ./memfd_create04

https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/syscalls/memfd_create/memfd_create04.c#L75

Test output log,
https://lkft.validation.linaro.org/scheduler/job/1081716

Test results comparison,
https://qa-reports.linaro.org/lkft/linux-stable-rc-5.4-oe/tests/ltp-syscalls-tests/memfd_create04


-- 
Linaro LKFT
https://lkft.linaro.org

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
