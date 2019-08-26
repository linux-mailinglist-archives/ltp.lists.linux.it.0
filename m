Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B23119D110
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Aug 2019 15:51:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4CB1E3C1CF9
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Aug 2019 15:51:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 8E67E3C12EB
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 15:51:13 +0200 (CEST)
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 984861A011F6
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 15:51:12 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id l1so15126173lji.12
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 06:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8H72TrYC5gZvMPhRumnBYIWBJ5xS8zMVHqHb8s+Sb3o=;
 b=Dn4xaVrTDityhgDmAXP5mahh8jhaq+TI8TXcev4ytU9RMTXCbnfaNmqYWkr/ZM1N3G
 Dmn0ReLawj12cfsKUCvSAKiy+jV58Ah/khvkXPKmAwYJ8eFGbp/uAL3/Pyt0AOLEoBit
 gYk6Uno5KfxtnY9+NXurS1w20hKq3j1OgLspIc6Z8qROdW9UNRk/oMRavNc8jrkjl3mx
 uVjnh1nJjYeJybcif8BsxjSjzCEuwv7+QF3Hz7MocC1xHDzuoMrnESTHoVCGlsT8wHMm
 Ocjqs7g4Buu5frPRBqa8B5IcB/Twam2qrOd+lAWRx0IWDhbKWggsNWDR+hf2gVLjAAlX
 Q/nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8H72TrYC5gZvMPhRumnBYIWBJ5xS8zMVHqHb8s+Sb3o=;
 b=Q2OifyYqWy78vKx6JLCNE7Zm8knqakPGO5KWT4reVyJI+zVJ0oXVLWJbaUefqFEY9i
 588ZNpuSnJMqI/Mucq9mDH094nGuwi0wS/m2deTrjUlub6xAXzidyzSqDb4ehRRTPQOR
 VMhewaEK42kNwth/Og8YS53IVwx8SERqHXT1hJZYWk9i+tBBzipXU/dwbAS8ztCDdpP9
 cCS0Gim5xt1P7/PljJOBnknHv/4RdYp2TLhSfcQAZBZ006YAvkGZ/qRm61tcJZ/DeBMx
 GboPLSMHJFTP72f87IK8R9yoBMzV4KbeCGrUnZKEs+B1tyt3IHjsYL5THGQCZMIIB3oB
 LxvQ==
X-Gm-Message-State: APjAAAUQAR7ppgcDXIndRHI2uoX+wWuT9qK7uWflDrJrZFu5lehV5Sjp
 +vuFhjClYCMWZyG9USHz2ULBvekCTXw2Dk7m2Xu2sA==
X-Google-Smtp-Source: APXvYqxfoDUXiZvyj8ZD8yhHri4inkNQ1AyC2xCtZuHCXJahSPiD+yMmzxFbp0qFrMVuZ6SHpjt+O8ffbyiazKLxWuY=
X-Received: by 2002:a2e:a0c3:: with SMTP id f3mr10776519ljm.123.1566827471744; 
 Mon, 26 Aug 2019 06:51:11 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYtN2tjHZtjtc8isdsD5hF76teeh2-pngUp+uj3WYdj7jA@mail.gmail.com>
 <20190826104127.GA14729@haruka>
 <1264279239.8133737.1566817520787.JavaMail.zimbra@redhat.com>
In-Reply-To: <1264279239.8133737.1566817520787.JavaMail.zimbra@redhat.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 26 Aug 2019 19:20:59 +0530
Message-ID: <CA+G9fYsHpNKFHr=ZukVvj+uMJDyHj2Xwb9bCfzPQyYzMjZ0rCw@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] Linux-next-20190823: x86_64/i386: prot_hsymlinks.c:325:
 Failed to run cmd: useradd hsym
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
Cc: open list <linux-kernel@vger.kernel.org>,
 the hoang0709 <the_hoang0709@yahoo.com>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Jan and Cyril,

On Mon, 26 Aug 2019 at 16:35, Jan Stancek <jstancek@redhat.com> wrote:
>
>
>
> ----- Original Message -----
> > Hi!
> > > Do you see this LTP prot_hsymlinks failure on linux next 20190823 on
> > > x86_64 and i386 devices?
> > >
> > > test output log,
> > > useradd: failure while writing changes to /etc/passwd
> > > useradd: /home/hsym was created, but could not be removed
> >
> > This looks like an unrelated problem, failure to write to /etc/passwd
> > probably means that filesystem is full or some problem happend and how
> > is remounted RO.
>
> In Naresh' example, root is on NFS:
>   root=/dev/nfs rw nfsroot=10.66.16.123:/var/lib/lava/dispatcher/tmp/886412/extract-nfsrootfs-tyuevoxm,tcp,hard,intr

Right !
root is mounted on NFS.

>
> 10.66.16.123:/var/lib/lava/dispatcher/tmp/886412/extract-nfsrootfs-tyuevoxm on / type nfs (rw,relatime,vers=2,rsize=4096,wsize=4096,namlen=255,hard,nolock,proto=tcp,timeo=600,retrans=2,sec=sys,mountaddr=10.66.16.123,mountvers=1,mountproto=tcp,local_lock=all,addr=10.66.16.123)
> devtmpfs on /dev type devtmpfs (rw,relatime,size=3977640k,nr_inodes=994410,mode=755)
>
> Following message repeats couple times in logs:
>   NFS: Server wrote zero bytes, expected XXX
>
> Naresh, can you check if there are any errors on NFS server side?

I have re-tested the failed tests on next-20190822 and all get pass
which is also
using same NFS server [1] [2].

> Maybe run NFS cthon against that server with client running next-20190822 and next-20190823.

Thanks for the pointers.
I will setup and run NFS cthon on next-20190822 and next-20190823.

>
> >
> > I do not see the kernel messages from this job anywhere at the job
> > pages, is it stored somewhere?
>
> It appears to be mixed in same log file:
>   https://qa-reports.linaro.org/lkft/linux-next-oe/build/next-20190823/testrun/886412/log

For the record the following tests failed on linux -next-20190823 on x86_64
and i386. The filesystem is mounted on NFS and tests are using
locally mounted hard drive ( with -d /scratch ).

Juno-r2 device filesystem mounted on NFS and did not see these errors
and test getting pass on -next-20190823.

These failures are reproducible all time on next-20190823 kernel on x86_64
and i386 device with root mounted on NFS [3] [4] [5] [6].

I will git bisect to find out which is bad commit.

prot_hsymlinks: [3]
------------------
useradd: failure while writing changes to /etc/passwd
useradd: /home/hsym was created, but could not be removed
userdel: user 'hsym' does not exist
prot_hsymlinks    1  TBROK  :  prot_hsymlinks.c:325: Failed to run
cmd: useradd hsym
prot_hsymlinks    2  TBROK  :  prot_hsymlinks.c:325: Remaining cases broken
prot_hsymlinks    3  TBROK  :  prot_hsymlinks.c:325: Failed to run
cmd: userdel -r hsym
prot_hsymlinks    4  TBROK  :  tst_sig.c:234: unexpected signal
SIGIOT/SIGABRT(6) received (pid = 8324).

logrotate01: [4]
-------------
compressing log with: /bin/gzip
error: error creating temp state file /var/lib/logrotate.status.tmp:
Input/output error
logrotate01    1  TFAIL  :  ltpapicmd.c:154: Test #1: logrotate
command exited with 1 return code. Output:

sem_unlink_2-2: [5]
------------------
make[3]: Entering directory
'/opt/ltp/testcases/open_posix_testsuite/conformance/interfaces/sem_unlink'
cat: write error: Input/output error
conformance/interfaces/sem_unlink/sem_unlink_2-2: execution: FAILED

syslog{01 ...10} [6]
-------------------
cp: failed to close '/etc/syslog.conf.ltpback': Input/output error
syslog01    1  TBROK  :  ltpapicmd.c:188: failed to backup /etc/syslog.conf

cp: failed to close '/etc/syslog.conf.ltpback': Input/output error
syslog02    1  TBROK  :  ltpapicmd.c:188: failed to backup /etc/syslog.conf

...
cp: failed to close '/etc/syslog.conf.ltpback': Input/output error
syslog10    1  TBROK  :  ltpapicmd.c:188: failed to backup /etc/syslog.conf

ref:
PASS on 20190222:
[1] https://lkft.validation.linaro.org/scheduler/job/890446#L1232
[2] https://lkft.validation.linaro.org/scheduler/job/890454

FAILED on 20190823:
[3] https://lkft.validation.linaro.org/scheduler/job/890404#L1245
[4] https://lkft.validation.linaro.org/scheduler/job/886408#L2544
[5] https://lkft.validation.linaro.org/scheduler/job/886409#L3088
[6] https://lkft.validation.linaro.org/scheduler/job/890400#L1234

 - Naresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
