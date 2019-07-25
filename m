Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CE302748C9
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jul 2019 10:08:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 52DC43C1CF6
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jul 2019 10:08:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id A02B53C104D
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 10:08:12 +0200 (CEST)
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C053C1A01524
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 10:08:11 +0200 (CEST)
Received: by mail-yb1-xb42.google.com with SMTP id y123so15177699yby.10
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 01:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=de5HBqlTXwGzZiq9bSnmPfjZYV2B+zc49P72gAkSdU8=;
 b=SS1TP4HoXtSzAygBhJ5pNjRhXW6dD8g60q5U5bEDbIplE9J5nxZxtadqSGxQwzMX/s
 21MYUVogkWdvbcNk5j/DPaWF5elfKR0WH9cpt6f93kQCey122tNnbkxF7DanCKPgs9gv
 FkJiUpez+gyGPi2DvyMnB/i1+39UtWA1y4rW9FbHxZjmgYrPen/6OSoXpS2uLY1d0Txa
 XoMoCtg9uHZt8O0jXqFoINDON/gEhtn9ddkyq0xX60+xTAO7KO3R3FOY6ShhHeWNbTNB
 Pbf79jl0E5LH3bzf0OM0Ejfh2zrMIFZTh3YFO8K7DVK5K6ePELP1K3PM6xw8XXrh/pRW
 CaDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=de5HBqlTXwGzZiq9bSnmPfjZYV2B+zc49P72gAkSdU8=;
 b=b9qOPfKvHjPDRuSCOEFKs5NDXJiCkS/pIfv7hIJKQkNdYxY0hr9DCRUUlHfmJ4AD92
 yekxxdrVtzOfjgjjuKeF3FnW6cLsRcGabU0V8ktDXf06QXI5Rgg1ME72bHRdz3Ip31VU
 VVMmERj5lfUTLTgfgNQMnRSqMsdiZL+EeFWY+AJwV060W2Gh1QQ8XPbk0snKNZQsmLt2
 muBZE+lzYjDaO1ZtbO2otJ52+U5OSt892s7YtfDbu4g6vTVIx4IeWEXXU++0z2lfl9Ol
 g0FiPy4aCW3epNReriLfjNgsg0zVvO63h+2MJt+OOOdTcUTNa4mEnYCgtHUJEzlUN3W7
 Ovdg==
X-Gm-Message-State: APjAAAUdah83nxlpKhnnTdMWACeZDQKrRvft25xicoDo0tRT40rSKH8+
 u/g4zFhfMLDz9Qbo8emhcpu4RJGhCOBOWythJ5c=
X-Google-Smtp-Source: APXvYqz0+dD4cpeG9eBygX3Nkw30W4Iitk4dTjbyYC3EX0guQFQnkvmq/Bf/ueGEvT58i9jwbAoPa/axTPSEo/Wpu4w=
X-Received: by 2002:a25:7683:: with SMTP id
 r125mr52759173ybc.144.1564042090567; 
 Thu, 25 Jul 2019 01:08:10 -0700 (PDT)
MIME-Version: 1.0
References: <5D30200B.4050306@cn.fujitsu.com>
 <1564030915-3211-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1564030915-3211-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAOQ4uxg-5UUTB6Z=4Ma9+6LkLVnCz6NBFS4=7Zq_pJfNhZFRqA@mail.gmail.com>
 <5D3941C4.2070601@cn.fujitsu.com>
In-Reply-To: <5D3941C4.2070601@cn.fujitsu.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 25 Jul 2019 11:08:00 +0300
Message-ID: <CAOQ4uxg7w51AVD6fig9HH0s7vjC=G2fz8H1nauBZ3V5TiRzuVQ@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6 3/3] syscalls/copy_file_range02: increase
 coverage and remove EXDEV test
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Jul 25, 2019 at 8:44 AM Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote:
>
> on 2019/07/25 13:24, Amir Goldstein wrote:
>
> > On Thu, Jul 25, 2019 at 8:02 AM Yang Xu<xuyang2018.jy@cn.fujitsu.com>  wrote:
> >>
> >>
> >>   static void setup(void)
> >>   {
> >>          syscall_info();
> >> +       char dev_path[1024];
> > Why? What is the point of filling this string if you're not going to
> > use it. That's exactly what tst_find_free_loopdev(NULL, 0) is for.
> > I don't think you understood Cyril's comment about the API
> > correctly.
> > He meant he rather keep the *option* in the API to fill out the
> > suggested loopdev file name. Not that you *have* to fill it.
> >
> > Thanks,
> > Amir.
> >
> Hi Amir
>
>   I think you don't see the whole patch.
>
>   I use this dev_path as below:
>
>   fd_blkdev = SAFE_OPEN(dev_path, O_RDWR, 0600);
>
> on v5 patch, I use  tst_find_free_loopdev(NULL, 0) and create a customized loop dev named "file_block" by mknod .
>
> But why we don't use a path directly filled by tst_find_free_loopdev(dev_path, len)? It will not change lib internal state or overwirte data.
>
> I only use a standard loop device as same as char device use "/dev/null".
>

Right, sorry, missed that.
It is generally better not to define 1024 array on the stack.
Most LTP tests define test path vars as static char arrays in top of test file.


>
>
> >
> >>          if (access(FILE_DIR_PATH, F_OK) == -1)
> >>                  SAFE_MKDIR(FILE_DIR_PATH, 0777);
> >> +       /*
> >> +        * call tst_find_free_loopdev(), avoid overwriting its
> >> +        * content on used loopdev.
> >> +        */
> >> +       loop_devn = tst_find_free_loopdev(dev_path, sizeof(dev_path));
> >> +
> >> +       SAFE_MKNOD(FILE_FIFO, S_IFIFO | 0777, 0);
> >>
> >>          fd_src    = SAFE_OPEN(FILE_SRC_PATH, O_RDWR | O_CREAT, 0664);
> >>          fd_dest   = SAFE_OPEN(FILE_DEST_PATH, O_RDWR | O_CREAT, 0664);
> >>          fd_rdonly = SAFE_OPEN(FILE_RDONL_PATH, O_RDONLY | O_CREAT, 0664);
> >> -       fd_mnted  = SAFE_OPEN(FILE_MNTED_PATH, O_RDWR | O_CREAT, 0664);
> >>          fd_dir    = SAFE_OPEN(FILE_DIR_PATH, O_DIRECTORY);
> >>          fd_closed = -1;
> >>          fd_append = SAFE_OPEN(FILE_DEST_PATH,
> >>                          O_RDWR | O_CREAT | O_APPEND, 0664);
> >> +       fd_immutable = SAFE_OPEN(FILE_IMMUTABLE_PATH, O_RDWR | O_CREAT, 0664);
> >> +       fd_swapfile = SAFE_OPEN(FILE_SWAP_PATH, O_RDWR | O_CREAT, 0600);
> >> +
> >> +       if (loop_devn == -1)
> >> +               fd_blkdev = SAFE_OPEN(dev_path, O_RDWR, 0600);
> >> +
>        I use the dev_path string.

(loop_devn != 1) ??

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
