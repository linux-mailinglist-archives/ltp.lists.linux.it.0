Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A178B56007
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Jun 2019 05:45:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 28DC33C034E
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Jun 2019 05:45:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id C56473C020B
 for <ltp@lists.linux.it>; Wed, 26 Jun 2019 05:45:47 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 37CBE1A00A3F
 for <ltp@lists.linux.it>; Wed, 26 Jun 2019 05:45:46 +0200 (CEST)
Received: from mail-wr1-f71.google.com ([209.85.221.71])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <po-hsu.lin@canonical.com>)
 id 1hfys0-0005Be-8a
 for ltp@lists.linux.it; Wed, 26 Jun 2019 03:45:16 +0000
Received: by mail-wr1-f71.google.com with SMTP id c6so393081wrp.11
 for <ltp@lists.linux.it>; Tue, 25 Jun 2019 20:45:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jxtitFDPbNI54Qi75lxigeDyNRv5dKLZuVItnRQ3i1o=;
 b=JtYR7YYoUDp7qqZBlGyg3UUszmhz/ZbEB1aohat+cKrn9/8d089Px8UNQ3pfMtbYZQ
 3dfifL/ubZ9nwxks71bEbULrC/WtlvpxS68jinPETLe/ezbdtbR8a6fWN5zEo/hHVX/8
 n8tf2hJadRDEABST2zh7+Xab+XxXDqK962U0JJTIVgO+x7VhZxjqNkcbjs+6+UnzBU2z
 CLorlr6R/EMBOObPjakV/MNAmsiFbMy3s99VFjKd5tYwfP069QYHqta2/XJNzSYNjNfo
 5ETtQmPvktH7964yWryK4NmWZhjK34nAGyzGe9pL/63KifylxjdRUEeb25JMPo+N52tq
 c60Q==
X-Gm-Message-State: APjAAAVJOjZr2kWmA2XY5o6YeHaHBkQ2+7dDbLo2cPKZ7SX2n/+vVR3t
 eV0G3mXDD+vBUM0aezr5ByXIPITAYsvnChlCtZnqJzqW9DIOsSGf+FZXer/kkYg/DcDtyUt0nqd
 60yba9yTIiZja0CwUjiXykKfcsFGiWA2AdTwZWtXqrns=
X-Received: by 2002:a7b:c313:: with SMTP id k19mr766339wmj.2.1561520715943;
 Tue, 25 Jun 2019 20:45:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwNcJWq7KxqpKbKBYlB9zW/BT5C5Nuv/Q7W1+i9TdXR90+SwTBTzAZX8M0uxilVTdtgBFwTK4VhDrCoueKZtcU=
X-Received: by 2002:a7b:c313:: with SMTP id k19mr766311wmj.2.1561520715661;
 Tue, 25 Jun 2019 20:45:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190625100351.19800-1-po-hsu.lin@canonical.com>
 <5D11FEA7.1000104@cn.fujitsu.com>
 <CAMy_GT-BOitiVB6vJCno6=M5d+iz6+RxKMxsiXHH0TYbiZS7+w@mail.gmail.com>
 <e8ca7807-4d4d-8bd5-dc8f-ed9989ba0f01@163.com>
In-Reply-To: <e8ca7807-4d4d-8bd5-dc8f-ed9989ba0f01@163.com>
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
Date: Wed, 26 Jun 2019 11:45:04 +0800
Message-ID: <CAMy_GT9s4DXdaA66GcdUVY2Xx2r9R-6EwN0Uo1cmXHA-KM0HLQ@mail.gmail.com>
To: Xiao Yang <ice_yangxiao@163.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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

Thanks for the review,

They are both fine with me, if you want to see this to be changed into
the double parentheses form, I can send a V2 for that.

Cheers
PHLin

On Wed, Jun 26, 2019 at 10:55 AM Xiao Yang <ice_yangxiao@163.com> wrote:
>
> Hi,
>
> Sorry, I missed the fact that tst_ncpus is executable binary.
>
> It's good to me.
>
> Reviewed-by: Xiao Yang <ice_yangxiao@163.com>
>
> BTW: if you don't want to depend expr command, we can fix it by using
> total_cpus=$((total_cpus - 1)) instead.
>
> Best Regards,
> Xiao Yang
>
> On 06/26/2019 12:13 AM, Po-Hsu Lin wrote:
> > Hello!
> >
> > The $() here is for the tst_ncpus executable, which will return the
> > total cpu number.
> >
> > Thanks
> > PHLin
> >
> > On Tue, Jun 25, 2019 at 6:59 PM Xiao Yang <yangx.jy@cn.fujitsu.com> wrote:
> >> On 2019/06/25 18:03, Po-Hsu Lin wrote:
> >>> The arithmetic operation (( total_cpus-=1 )) does not work for dash,
> >>> which was symbolic linked to /bin/sh on some OS like Ubuntu.
> >>>
> >>> In such case, people will see error like:
> >>>     runpwtests03.sh: total_cpus-=1: not found
> >>>
> >>> And this further leads to access for a non-existing file and cause
> >>> false-positive result in the end:
> >>>     runpwtests03.sh: cannot create
> >>>     /sys/devices/system/cpu/cpu8/cpufreq/scaling_governor: Directory nonexistent
> >>>     runpwtests03.sh: FAIL: Unable to set governor -- powersave for cpu8
> >>>     Power_Management03 2 TFAIL: Changing governors
> >>>
> >>> Use expr instead for fix this issue.
> >>>
> >>> Signed-off-by: Po-Hsu Lin<po-hsu.lin@canonical.com>
> >>> ---
> >>>    testcases/kernel/power_management/runpwtests03.sh | 9 +++------
> >>>    1 file changed, 3 insertions(+), 6 deletions(-)
> >>>
> >>> diff --git a/testcases/kernel/power_management/runpwtests03.sh b/testcases/kernel/power_management/runpwtests03.sh
> >>> index 11197937f..3fb85d273 100755
> >>> --- a/testcases/kernel/power_management/runpwtests03.sh
> >>> +++ b/testcases/kernel/power_management/runpwtests03.sh
> >>> @@ -25,8 +25,7 @@ export TST_TOTAL=4
> >>>    . pm_include.sh
> >>>
> >>>    check_cpufreq_sysfs_files() {
> >>> -     total_cpus=$(tst_ncpus)
> >>> -     (( total_cpus-=1 ))
> >>> +     total_cpus=`expr $(tst_ncpus) - 1`
> >> Hi,
> >>
> >> It's wrong for single variable to use $(), did you mean ${tst_ncpus}?
> >>
> >> Best Regards,
> >> Xiao Yang
> >>>        RC=0
> >>>
> >>>        for cpu in $(seq 0 "${total_cpus}" )
> >>> @@ -51,8 +50,7 @@ check_cpufreq_sysfs_files() {
> >>>    change_govr() {
> >>>        available_govr=$(get_supporting_govr)
> >>>
> >>> -     total_cpus=$(tst_ncpus)
> >>> -     (( total_cpus-=1 ))
> >>> +     total_cpus=`expr $(tst_ncpus) - 1`
> >>>        RC=0
> >>>
> >>>        for cpu in $(seq 0 "${total_cpus}" )
> >>> @@ -79,8 +77,7 @@ change_freq() {
> >>>        available_govr=$(get_supporting_govr)
> >>>        RC=0
> >>>
> >>> -     total_cpus=$(tst_ncpus)
> >>> -     (( total_cpus-=1 ))
> >>> +     total_cpus=`expr $(tst_ncpus) - 1`
> >>>
> >>>        if ( echo ${available_govr} | grep -i "userspace" \
> >>>                >/dev/null 2>&1 ); then
> >>
> >>
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
