Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE8A36596E
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Apr 2021 15:01:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B2FBC3C6D49
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Apr 2021 15:01:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7A3733C1DFC
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 15:01:28 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5759460080A
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 15:01:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618923685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5o5zKDWcO8nw7axrhTwO/KxGceITtF+3AcOeCr2dnsg=;
 b=JR/w9/QzzbQfbrhrfYGRjK9S62IA8Dsc/vzZL7LCtbo+nik9vkckOuBDDVb4kXO3oNYrPv
 R3Ptimxq6zjUJtZ2VThZuWxD4xlgDFr+Y1TZz2nmVkoZAWIkHL3YWEETQJqQmRVDtl0yY0
 dHILh6VYxKbgvO8yVI26yVnQFv7t3T4=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-E4kTA-w_N1aJzBG9dj_FbQ-1; Tue, 20 Apr 2021 09:01:21 -0400
X-MC-Unique: E4kTA-w_N1aJzBG9dj_FbQ-1
Received: by mail-yb1-f197.google.com with SMTP id
 135-20020a25048d0000b02904e4ed8b411bso11663642ybe.20
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 06:01:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5o5zKDWcO8nw7axrhTwO/KxGceITtF+3AcOeCr2dnsg=;
 b=tagHHtp3Rsg16QYswHzqkjkmEbWZf4Ukk1SvRZ03MxZsxv6ZhojQ+AggpBukJScl3W
 gVXhAVTCcI1VJgw0mfrbG3B+dEJySyFzgUN+bGBglZBophua7nqw22P+xg8TlTe5F1q+
 irzKaKvy3zH2xqBMetLvjOaTebDircGqt0M9sg5uob0ygefOJMHk0iPuUaimoqj06EmB
 rcdgiL2g3Bb2UymJjbA+u9Z3ahpLT4UzcdM32SlYqWEP/S4WAHU+EmtjWSaJ2Nlhog6I
 ycj3LeXp+KLqjQUhSI9bnNTbN0VreqH2WZSzUKrwfec2CTIvzBwEd80+gugiKZ5euixI
 wSqg==
X-Gm-Message-State: AOAM530GKpeECXp5K6AxXgt5juws1EygmVzRUtPnh5uXGEG6a7WNg0N0
 aqEg7ew4m3vAtq6Wj7EWCyhNLR49LiBYbWx/knoSvl48XslHN8Dx90dnzRL/HnqTZWRWC0/EXs1
 tdQtdicHSjKdumFyO6rmF1DVRIbE=
X-Received: by 2002:a25:8710:: with SMTP id a16mr14890318ybl.286.1618923680541; 
 Tue, 20 Apr 2021 06:01:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzN/AqTuGM/H8lFz3InHtUUt0UlAZ84W0RB1r6H1HBFrEZm7e/11gS1gYm9Fvi5hzLkrmuJ5phoE9XO3q8gr2E=
X-Received: by 2002:a25:8710:: with SMTP id a16mr14890291ybl.286.1618923680333; 
 Tue, 20 Apr 2021 06:01:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210420075351.16059-1-liwang@redhat.com>
 <728318760.8908748.1618921049585.JavaMail.zimbra@redhat.com>
In-Reply-To: <728318760.8908748.1618921049585.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 20 Apr 2021 21:01:08 +0800
Message-ID: <CAEemH2fcEjre5xd1KuXsAkYzZG6tGaCttE8x3zbjxamVHfUUng@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] mkfs: print more info for debugging
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
Cc: xuyang2018 jy <xuyang2018.jy@cn.fujitsu.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Apr 20, 2021 at 8:17 PM Jan Stancek <jstancek@redhat.com> wrote:
>
>
>
> ----- Original Message -----
> > We can NOT reproduce the problem by manual with both ppc64le and s390x,
> > so let's print more useful info from test when getting fail.
>
> It's mkfs_verify_size, test expects to find 90% blocks (of device size),
> but lately we miss that by ~1-2%:
>
> # mkfs.ext3 /dev/loop0 16000
> mke2fs 1.46.2 (28-Feb-2021)

Thanks for the info.

How reproducible of this issue, and which arch/platform you used?
Or, can you reproduce it with a downgrade e2fsprogs version?


> /dev/loop0 contains a ext3 file system
>         created on Fri Apr 16 05:09:23 2021
> Proceed anyway? (y,N) y
> Discarding device blocks: done
> Creating filesystem with 16000 1k blocks and 4000 inodes
> Filesystem UUID: d66c4c37-13ce-41df-b3c4-345ec1641e1f
> Superblock backups stored on blocks:
>         8193
>
> Allocating group tables: done
> Writing inode tables: done
> Creating journal (1024 blocks): done
> Writing superblocks and filesystem accounting information: done
>
>  mount /dev/loop0  /mnt/test
> # df -T
> Filesystem                           Type      1K-blocks      Used  Available Use% Mounted on
> /dev/loop0                           ext3          14343        19      13524   1% /mnt/test
>
>
> >
> >  mkfs01 1 TPASS: 'mkfs -t ext4  /dev/loop0 ' passed.
> >  mkfs01 2 TFAIL: 'mkfs -t ext4  /dev/loop0 16000' failed, not expected.
> >  mkfs01 3 TPASS: 'mkfs -t ext4 -c /dev/loop0 ' passed.
> >  mkfs01 4 TPASS: 'mkfs -V   ' passed.
> >  mkfs01 5 TPASS: 'mkfs -h   ' passed.
> >
> > Signed-off-by: Li Wang <liwang@redhat.com>
> > ---
> >  testcases/commands/mkfs/mkfs01.sh | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/testcases/commands/mkfs/mkfs01.sh
> > b/testcases/commands/mkfs/mkfs01.sh
> > index 90368190d..55296c8df 100755
> > --- a/testcases/commands/mkfs/mkfs01.sh
> > +++ b/testcases/commands/mkfs/mkfs01.sh
> > @@ -128,7 +128,8 @@ mkfs_test()
> >       if [ -n "$device" ]; then
> >               mkfs_verify_type "$fs_type" "$device"
> >               if [ $? -ne 0 ]; then
> > -                     tst_res TFAIL "'${mkfs_cmd}' failed, not expected."
> > +                     tst_res TFAIL "'${mkfs_cmd}' failed, not expected type."
> > +                     cat temp
> >                       return
> >               fi
> >       fi
> > @@ -136,7 +137,8 @@ mkfs_test()
> >       if [ -n "$size" ]; then
> >               mkfs_verify_size "$fs_type" "$size"
> >               if [ $? -ne 0 ]; then
> > -                     tst_res TFAIL "'${mkfs_cmd}' failed, not expected."
> > +                     tst_res TFAIL "'${mkfs_cmd}' failed, not expected size."
> > +                     cat temp
> >                       return
> >               fi
> >       fi
> > --
> > 2.30.2
> >
> >
> > --
> > Mailing list info: https://lists.linux.it/listinfo/ltp
> >
> >
>


-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
