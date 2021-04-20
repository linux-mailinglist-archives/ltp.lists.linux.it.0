Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D465365987
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Apr 2021 15:10:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CF1943C6D4D
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Apr 2021 15:10:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BFEE63C6CF3
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 15:10:03 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0793D200D3B
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 15:10:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618924201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ak5td6hsfv9+9meaEB8rGVUByossldVJCdKPJgglykU=;
 b=OwjNKgfE9G8MoyVYt92t1LCbRVq/s09YUPeSuD6aBcPMS/nQb/fjc92rC460Z2urjYjEyH
 KvD0uG3S7btKSceBmxPX0+8mo/R0Wffsu6gaHW5hPWqE6OiBFwDZDlLWVVkwe4h6AzzWKD
 uGOSW1IbDA6c6OPzBqLJwy+ofumPi1Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-b16IhEhmMAqAGZ7Codz6CQ-1; Tue, 20 Apr 2021 09:09:59 -0400
X-MC-Unique: b16IhEhmMAqAGZ7Codz6CQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B95688542C3;
 Tue, 20 Apr 2021 13:09:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B2C30610F1;
 Tue, 20 Apr 2021 13:09:58 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id A9BB21806D0F;
 Tue, 20 Apr 2021 13:09:58 +0000 (UTC)
Date: Tue, 20 Apr 2021 09:09:58 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <1716161919.8919863.1618924198482.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAEemH2fcEjre5xd1KuXsAkYzZG6tGaCttE8x3zbjxamVHfUUng@mail.gmail.com>
References: <20210420075351.16059-1-liwang@redhat.com>
 <728318760.8908748.1618921049585.JavaMail.zimbra@redhat.com>
 <CAEemH2fcEjre5xd1KuXsAkYzZG6tGaCttE8x3zbjxamVHfUUng@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.36.110.13, 10.4.195.11]
Thread-Topic: mkfs: print more info for debugging
Thread-Index: PB5T+slQU8qSBxudKxUImC0xMTwvWg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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



----- Original Message -----
> On Tue, Apr 20, 2021 at 8:17 PM Jan Stancek <jstancek@redhat.com> wrote:
> >
> >
> >
> > ----- Original Message -----
> > > We can NOT reproduce the problem by manual with both ppc64le and s390x,
> > > so let's print more useful info from test when getting fail.
> >
> > It's mkfs_verify_size, test expects to find 90% blocks (of device size),
> > but lately we miss that by ~1-2%:
> >
> > # mkfs.ext3 /dev/loop0 16000
> > mke2fs 1.46.2 (28-Feb-2021)
> 
> Thanks for the info.
> 
> How reproducible of this issue, and which arch/platform you used?

It seemed pretty consistent with Fedora-Rawhide-20210415.n.0 on power9 ppc64le (9006-22P, J:5279637)

> Or, can you reproduce it with a downgrade e2fsprogs version?

Not immediately, I lost reservation of the machine.

> 
> 
> > /dev/loop0 contains a ext3 file system
> >         created on Fri Apr 16 05:09:23 2021
> > Proceed anyway? (y,N) y
> > Discarding device blocks: done
> > Creating filesystem with 16000 1k blocks and 4000 inodes
> > Filesystem UUID: d66c4c37-13ce-41df-b3c4-345ec1641e1f
> > Superblock backups stored on blocks:
> >         8193
> >
> > Allocating group tables: done
> > Writing inode tables: done
> > Creating journal (1024 blocks): done
> > Writing superblocks and filesystem accounting information: done
> >
> >  mount /dev/loop0  /mnt/test
> > # df -T
> > Filesystem                           Type      1K-blocks      Used
> > Available Use% Mounted on
> > /dev/loop0                           ext3          14343        19
> > 13524   1% /mnt/test
> >
> >
> > >
> > >  mkfs01 1 TPASS: 'mkfs -t ext4  /dev/loop0 ' passed.
> > >  mkfs01 2 TFAIL: 'mkfs -t ext4  /dev/loop0 16000' failed, not expected.
> > >  mkfs01 3 TPASS: 'mkfs -t ext4 -c /dev/loop0 ' passed.
> > >  mkfs01 4 TPASS: 'mkfs -V   ' passed.
> > >  mkfs01 5 TPASS: 'mkfs -h   ' passed.
> > >
> > > Signed-off-by: Li Wang <liwang@redhat.com>
> > > ---
> > >  testcases/commands/mkfs/mkfs01.sh | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/testcases/commands/mkfs/mkfs01.sh
> > > b/testcases/commands/mkfs/mkfs01.sh
> > > index 90368190d..55296c8df 100755
> > > --- a/testcases/commands/mkfs/mkfs01.sh
> > > +++ b/testcases/commands/mkfs/mkfs01.sh
> > > @@ -128,7 +128,8 @@ mkfs_test()
> > >       if [ -n "$device" ]; then
> > >               mkfs_verify_type "$fs_type" "$device"
> > >               if [ $? -ne 0 ]; then
> > > -                     tst_res TFAIL "'${mkfs_cmd}' failed, not expected."
> > > +                     tst_res TFAIL "'${mkfs_cmd}' failed, not expected
> > > type."
> > > +                     cat temp
> > >                       return
> > >               fi
> > >       fi
> > > @@ -136,7 +137,8 @@ mkfs_test()
> > >       if [ -n "$size" ]; then
> > >               mkfs_verify_size "$fs_type" "$size"
> > >               if [ $? -ne 0 ]; then
> > > -                     tst_res TFAIL "'${mkfs_cmd}' failed, not expected."
> > > +                     tst_res TFAIL "'${mkfs_cmd}' failed, not expected
> > > size."
> > > +                     cat temp
> > >                       return
> > >               fi
> > >       fi
> > > --
> > > 2.30.2
> > >
> > >
> > > --
> > > Mailing list info: https://lists.linux.it/listinfo/ltp
> > >
> > >
> >
> 
> 
> --
> Regards,
> Li Wang
> 
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
