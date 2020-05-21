Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA631DCDBC
	for <lists+linux-ltp@lfdr.de>; Thu, 21 May 2020 15:08:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8C52D3C4D3A
	for <lists+linux-ltp@lfdr.de>; Thu, 21 May 2020 15:08:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id AADEC3C25E9
 for <ltp@lists.linux.it>; Thu, 21 May 2020 15:08:52 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id DFD0D200FF4
 for <ltp@lists.linux.it>; Thu, 21 May 2020 15:08:51 +0200 (CEST)
Received: from mail-qv1-f42.google.com ([209.85.219.42]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1Mna0x-1jAdBW0SkH-00jcTz for <ltp@lists.linux.it>; Thu, 21 May 2020
 15:08:51 +0200
Received: by mail-qv1-f42.google.com with SMTP id l3so3002999qvo.7
 for <ltp@lists.linux.it>; Thu, 21 May 2020 06:08:50 -0700 (PDT)
X-Gm-Message-State: AOAM531NI7bSzg2EdOHiURPdjUUFrE9kBCOo98ilseMCb7jNk+FQ7CDf
 ZGCLrSg5WbeZx74W/KZgVij3xZWP3fVLoQXB78U=
X-Google-Smtp-Source: ABdhPJwAd7d+cSS3Eat7IunW3y8sUy/MSMMfCl7yV/Hir1b1ugmEHJzLIxlm6tUj7mR8mxfBTdOYm+vPaNOEiC+nga0=
X-Received: by 2002:a05:6214:905:: with SMTP id
 dj5mr9844833qvb.222.1590066529821; 
 Thu, 21 May 2020 06:08:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590057824.git.viresh.kumar@linaro.org>
In-Reply-To: <cover.1590057824.git.viresh.kumar@linaro.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 21 May 2020 15:08:33 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2N-J5LoNPHa7hjRPcOR0ytNfZQ678pFuCJaJJHGYS--A@mail.gmail.com>
Message-ID: <CAK8P3a2N-J5LoNPHa7hjRPcOR0ytNfZQ678pFuCJaJJHGYS--A@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Provags-ID: V03:K1:VygHvzm4nykeXwPA/lJ7+ru4uwz6Dn5Mbc/7uHj7K+4ZKPH7kSG
 hoTXDaAvlcMQoS4t4gkwLEVHvEZ79KGPVgZC+UTi2LE2/JpuH7k4paUSasP8hyCZ25kQmoP
 ExoGzxetCcxBIKDYkFEkoDjhFO8f1zoG4AiHBzfoA5p4d9MBCwTxU7B25dEQ2f4tudAJcTt
 Ww6E/s4v5aBGHpDY5epfw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZuEwrBSLWNM=:LD1SVkpHEU2p64ZoV2UgP0
 aipU7PqMdwUtFdeyOZaEKjmryiC5S+jZBjPTtTrvyNblSPptoBR63r/lIFGDh2FPq60pwemkX
 Pg7y7Xg3tQXg116Bb8wr1Q4vsO6Y/w3RGxGYjf5JqFP/Zp76uw6Kq2ak82mVZqsvIBdsspWcv
 NMFL89EQnn4NE7QHJ1tqMCdPnqSIG44LznjDQ8H9lGS0u+t73d1MmXh76qwnBVT53HgTloK4o
 zIL3IdDfY3cYAfkXguJIm5gztH5h0Jb0niHFFhlU2AF5scMHHx5K377DwuqXbTKQm+MwMYT/+
 5mALNuqfjgDqYDAHhS1U2X/g6RiYlzohztC8//h7b7HhqjJK0djpijPmies8sCihZGAWBDytC
 NYkF+cBkCUcbltmvRLOieXzBqP1NkQt6xSGgsrH/8w0wvc36EMuXlDBbCDp2eZHl59fKvBKRm
 +ur8yhmp5zRprKVet/bYYeRnzVudwFOBHfZTJTO3UeQlISMTHgoiTM+XUNgSvxQRQohEJCg/4
 OCTdtQVAI41WlJvwed1z1k4ZFp4YWNlSdobtrMj6QLggOcILPNOJIFsUL3PYgIxx7c0Mb8PiI
 b7MyeKZfZpIJya77BLq5ujZp3PRDeAEsIIHNt93QEbQOOmzdqClZ3KSgXI21V4e9udWiGSz/l
 2jV1/FViB2TKk/2GHBgi1eYuQcw+NwT0Y4nr/VWfgOpPoNMfRH6L1yoXEonLmHDw3pSxL5vnu
 K+oTmFVaaHk3FlJ5dm4pwk3bfvQ7lX7Fs/o/Oxg3j7LEcL22CXeQmUv+lWTxl+PvKl0ML2oJU
 4+yY7VxCtEnzdCyHURsW8S1wvo30X4quKfeSYEOSNTdV2TbVKM=
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/5] syscalls: Add tests to verify the _time_high
 fields
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, May 21, 2020 at 12:47 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> Hello,
>
> This patchset adds a new test to three syscalls to verify that the
> extended fields, _time_high, are cleared by the kernel. This was
> suggested by Arnd.
>
> I did run them, but on a 64 bit machine. Please see if you can check
> that they work properly on 32 bit machines, where we really want to test
> them. This is rebased over ltp master.
>
> Cyril, This conflicts a bit with my other time64 syscall tests, I will
> rebase one of these, after you apply any of these first :)

The known bugs we had here were actually on 64-bit machines running
compat 32-bit user space. You should be able to test this on most
64-bit distros using the compat libraries and building ltp against the
32-bit version (not sure what the best way is to configure that, but it
should not be hard).

     Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
