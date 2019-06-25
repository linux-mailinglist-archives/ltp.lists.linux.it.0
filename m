Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBA85543C
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Jun 2019 18:13:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D71C03C1426
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Jun 2019 18:13:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 0A47C3C0309
 for <ltp@lists.linux.it>; Tue, 25 Jun 2019 18:13:36 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 2FB2F140055B
 for <ltp@lists.linux.it>; Tue, 25 Jun 2019 18:13:35 +0200 (CEST)
Received: from mail-wr1-f69.google.com ([209.85.221.69])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <po-hsu.lin@canonical.com>)
 id 1hfo4c-0007l3-Te
 for ltp@lists.linux.it; Tue, 25 Jun 2019 16:13:34 +0000
Received: by mail-wr1-f69.google.com with SMTP id n8so8141942wrx.14
 for <ltp@lists.linux.it>; Tue, 25 Jun 2019 09:13:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tUd2+HsB3NGP8HBdVDHMa5xKcDnUV77XO3hegn4rJzo=;
 b=ccVSfXJDnyJ73Yc6v4koskRbB16AAAsqrqKH9g++0AtqTGPFdFD219CriVTOn0UTE0
 SsnjL283MMl02hryVurlfDWQ7fCddw4NmLkMVWV57TGu4zVodnKFlkLzMMRYTXMiW80N
 J4BSrqaIkji5ARGoKPkl6obQX5dTND4r4tJWa7J2Aa3hFgS6Q6GNvIhu+rEgmuofSXPz
 IxNyBe9UV+RPEQMP0HFV1xXtD60ccghR6r8JaK4jlN6We6ClLcMKTys+hRYNAeA59PD5
 tl/cliEfihPtQ6fZqoWzop1tsBEcQ7QkrUu1ce605k7rsztm43tQosx/YKJuH5IotRbu
 82Xg==
X-Gm-Message-State: APjAAAUcEvoxTmyFw+qPPb+pGtksm4ZfHIThkX0E24uGhk3Y6sjxv9XN
 TALiAbXo6E3wMXRmIPY3QY8IlpMe4KIHJoQSIroS5fDwhwbR/5jyjmgqOKoTqivPG6jiy2OBHIB
 rUfzUuIXPjSJyrTAHhdupZ6LlN/jKbIo7zLf59umnbQ4=
X-Received: by 2002:adf:f104:: with SMTP id r4mr23230849wro.140.1561479214510; 
 Tue, 25 Jun 2019 09:13:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzaOnDTeRH8aTETnEPLQnh3v08Oq9zV3kDmm2Ub3on2mXAidgtqb0Mvai5g2hXidaSBnxEiw16p/5IGLQFU9Bg=
X-Received: by 2002:adf:f104:: with SMTP id r4mr23230836wro.140.1561479214262; 
 Tue, 25 Jun 2019 09:13:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190625100351.19800-1-po-hsu.lin@canonical.com>
 <5D11FEA7.1000104@cn.fujitsu.com>
In-Reply-To: <5D11FEA7.1000104@cn.fujitsu.com>
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
Date: Wed, 26 Jun 2019 00:13:23 +0800
Message-ID: <CAMy_GT-BOitiVB6vJCno6=M5d+iz6+RxKMxsiXHH0TYbiZS7+w@mail.gmail.com>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] runpwtests03: use expr to calculate total_cpus
 for runpwtests03
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello!

The $() here is for the tst_ncpus executable, which will return the
total cpu number.

Thanks
PHLin

On Tue, Jun 25, 2019 at 6:59 PM Xiao Yang <yangx.jy@cn.fujitsu.com> wrote:
>
> On 2019/06/25 18:03, Po-Hsu Lin wrote:
> > The arithmetic operation (( total_cpus-=1 )) does not work for dash,
> > which was symbolic linked to /bin/sh on some OS like Ubuntu.
> >
> > In such case, people will see error like:
> >    runpwtests03.sh: total_cpus-=1: not found
> >
> > And this further leads to access for a non-existing file and cause
> > false-positive result in the end:
> >    runpwtests03.sh: cannot create
> >    /sys/devices/system/cpu/cpu8/cpufreq/scaling_governor: Directory nonexistent
> >    runpwtests03.sh: FAIL: Unable to set governor -- powersave for cpu8
> >    Power_Management03 2 TFAIL: Changing governors
> >
> > Use expr instead for fix this issue.
> >
> > Signed-off-by: Po-Hsu Lin<po-hsu.lin@canonical.com>
> > ---
> >   testcases/kernel/power_management/runpwtests03.sh | 9 +++------
> >   1 file changed, 3 insertions(+), 6 deletions(-)
> >
> > diff --git a/testcases/kernel/power_management/runpwtests03.sh b/testcases/kernel/power_management/runpwtests03.sh
> > index 11197937f..3fb85d273 100755
> > --- a/testcases/kernel/power_management/runpwtests03.sh
> > +++ b/testcases/kernel/power_management/runpwtests03.sh
> > @@ -25,8 +25,7 @@ export TST_TOTAL=4
> >   . pm_include.sh
> >
> >   check_cpufreq_sysfs_files() {
> > -     total_cpus=$(tst_ncpus)
> > -     (( total_cpus-=1 ))
> > +     total_cpus=`expr $(tst_ncpus) - 1`
>
> Hi,
>
> It's wrong for single variable to use $(), did you mean ${tst_ncpus}?
>
> Best Regards,
> Xiao Yang
> >       RC=0
> >
> >       for cpu in $(seq 0 "${total_cpus}" )
> > @@ -51,8 +50,7 @@ check_cpufreq_sysfs_files() {
> >   change_govr() {
> >       available_govr=$(get_supporting_govr)
> >
> > -     total_cpus=$(tst_ncpus)
> > -     (( total_cpus-=1 ))
> > +     total_cpus=`expr $(tst_ncpus) - 1`
> >       RC=0
> >
> >       for cpu in $(seq 0 "${total_cpus}" )
> > @@ -79,8 +77,7 @@ change_freq() {
> >       available_govr=$(get_supporting_govr)
> >       RC=0
> >
> > -     total_cpus=$(tst_ncpus)
> > -     (( total_cpus-=1 ))
> > +     total_cpus=`expr $(tst_ncpus) - 1`
> >
> >       if ( echo ${available_govr} | grep -i "userspace" \
> >               >/dev/null 2>&1 ); then
>
>
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
