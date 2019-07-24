Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A7E72BDF
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2019 11:57:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9ED7B3C1CF3
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2019 11:57:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 0A99E3C13D8
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 11:57:10 +0200 (CEST)
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
 [209.85.217.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0D0FA601CE0
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 11:57:09 +0200 (CEST)
Received: by mail-vs1-f67.google.com with SMTP id a186so29321623vsd.7
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 02:57:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FA7q6QzJJfaPSLTn9aCUKUCxiDn1BHXiRLQsUfktZ1A=;
 b=pYj0vW7VOe3h8RBAgKKsipmBgZoUwCtsr/aiGsTmZX5pnHWt9bCT4Y8+06w5bx+FGR
 kKU4b+fzDDl2TY9VJBUAqqRNQu9oI8qYneWqnLOvrp8nQxJWWrNNMSOCAOUtI4QStk7M
 LNwmY2rHHZmw8GdOUYs9j+4mJYCuM2qhP6vLciSDtt+R/WUN56xSdYGYYdcMB+w5bvlO
 Ew97B7n7o3218BjHyit6PaINpQzTe49boNB71Ae0jOxQlZyr/s2fstJIyPm9Zat/XHz6
 FZIaIv6T4R1Dkls/bIR6Ucr4XZohnuz3eAk6hh6ciSS1QUxLu0T96Ih71IcXxnL3by9C
 kjPA==
X-Gm-Message-State: APjAAAXVOKDDKMwkm2juGS9tPKzfHHkb09fIN1OfFo8MKavPLpGrVYn1
 QhZ2YVaIHn0z6R9+oiJnaqDhUuA3YaveVAH3IPWuzAbuo3VizA==
X-Google-Smtp-Source: APXvYqxr52FRX1+l9Ovpijbl/R1+o8FjPJLNvoL8kv72lbA231r1DdLGgt5UxT30pVxMq/ZwK6oRLqN6CPxdhkSP8+8=
X-Received: by 2002:a67:fc45:: with SMTP id p5mr51378321vsq.179.1563962227766; 
 Wed, 24 Jul 2019 02:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <56f854e2-9cc6-4725-3182-ff83e106ee23@windriver.com>
 <20190717094614.GA9539@rei>
 <7d2c4936-2e89-6285-c856-a156d3a76284@windriver.com>
 <CAEemH2edg4R-JFM=u_ceLoRcNAMmV=c+hVV6kxoK4g6DOBnGeg@mail.gmail.com>
 <e7d0e66d-f348-9d57-0ea9-dc1fa289942d@windriver.com>
In-Reply-To: <e7d0e66d-f348-9d57-0ea9-dc1fa289942d@windriver.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 24 Jul 2019 17:56:56 +0800
Message-ID: <CAEemH2e+_b66or6MZCMXh5AbXk_WAzwVMjx==XFYKYEHRCy7cA@mail.gmail.com>
To: "Hongzhi, Song" <hongzhi.song@windriver.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] Question about kernel/syscall/signal/signal06.c
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
Cc: x86-ml <x86@kernel.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Hongzhi,

On Mon, Jul 22, 2019 at 9:59 AM Hongzhi, Song
<hongzhi.song@windriver.com> wrote:
>
>
> On 7/19/19 4:44 PM, Li Wang wrote:
> > On Fri, Jul 19, 2019 at 4:14 PM Hongzhi, Song
> > <hongzhi.song@windriver.com> wrote:
> >> This case fails when boot qemux86-64 with 1/2 cores.
> >>
> >> I find [kernel 5.2-rc1: 0d714dba162] causes the failure by git bisect.
>
> Hi Li,Wang
>
>
> Sorry for my a bit mistake, the exact tag is [5.1-rc3 : 0d714dba162]
>
> commit 0d714dba162620fd8b9f5b3104a487e041353c4d
> Author: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Date:   Wed Apr 3 18:41:48 2019 +0200
>
>      x86/fpu: Update xstate's PKRU value on write_pkru()
>
>      During the context switch the xstate is loaded which also includes the
>      PKRU value.
>
>      If xstate is restored on return to userland it is required
>      that the PKRU value in xstate is the same as the one in the CPU.
>
>      Save the PKRU in xstate during modification.
>
>
> >>
> >> If git checkout a commit before 0d714dba162, the case will pass on the
> >> same qemu configuration.
> > It sounds like a new regression on fpu. I will have a try on this test then.
> >
> > @Hongzhi, could you provide more info of your test machine? (e.g.
> > lscpu, uname -r)
> > and test result with 1vcpu, 2vcpus?
>
>
> I tested "-smp 1/2/4" and "-cpu Skylake-Client-IBRS/core2duo", all of
> them failed.
>
>
> 1. This is my qemu boot cmdline:
>
> qemu-system-x86_64 -device
> virtio-net-pci,netdev=net0,mac=52:54:00:12:35:02 -netdev
> user,id=net0,hostfwd=tcp::2222-:22,hostfwd=tcp::2323-:23,tftp=images/qemux86-64
> -drive file=image.rootfs.ext4,if=virtio,format=raw -vga vmware
> -show-cursor -usb -device usb-tablet -object
> rng-random,filename=/dev/urandom,id=rng0 -device
> virtio-rng-pci,rng=rng0  -nographic  -m 256  -cpu Skylake-Client-IBRS
> -serial mon:stdio -serial null -kernel linux/arch/x86/boot/bzImage
> -append 'root=/dev/vda rw highres=off console=ttyS0 mem=256M ip=dhcp
> vga=0 uvesafb.mode_option=640x480-32 oprofile.timer=1
> uvesafb.task_timeout=-1 '
>
> 2. lscpu
>
> root@qemux86-64:~# lscpu
> Architecture:                    x86_64
> CPU op-mode(s):              32-bit, 64-bit
> Byte Order:                      Little Endian
> Address sizes:                 40 bits physical, 48 bits virtual
> CPU(s):                            4
> On-line CPU(s) list:           0
> Thread(s) per core:          1
> Core(s) per socket:          1
> Socket(s):                        1
> Vendor ID:                       GenuineIntel
> CPU family:                      6
> Model:                             94
> Model name:                   Intel Core Processor (Skylake, IBRS)

Thanks for the information.

I tried the mainline kernel-v5.2 on the kvm system(with 1/2 Skylake
vCPUs) but didn't reproduce your failure, I'm not sure if I missed
anything there, maybe the virtualization way is related, I will have a
try on your command when I available.

--
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
