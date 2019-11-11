Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B09D3F6FA6
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Nov 2019 09:19:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 37EB43C1C94
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Nov 2019 09:19:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id B07CE3C17A2
 for <ltp@lists.linux.it>; Mon, 11 Nov 2019 09:19:54 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 1983214001E3
 for <ltp@lists.linux.it>; Mon, 11 Nov 2019 09:19:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573460392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y+d9HgiQd/ROeqheIWevtzZ1281FA0vSMCBkopaTcHI=;
 b=CLpJtUmDsTSP0P2x6qNdqKbVVAREaLTlyBT99JJQT918j3RVyXMIJzy7MZHzbi+f4K3777
 Q+ycsnSBcuo5/lGClYCQR5lCIiV67tv7V6i8ck4vCvREKSh6znjw70f9l14Op1ARUg7SWE
 MoMPbqxh8Pn5ksByCiy2ktfy3ZoXDdM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-_0XAJepROSaUejme0jEEIQ-1; Mon, 11 Nov 2019 03:19:44 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CAFC107ACC4;
 Mon, 11 Nov 2019 08:19:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BFE4100EBA6;
 Mon, 11 Nov 2019 08:19:41 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9754118089C8;
 Mon, 11 Nov 2019 08:19:40 +0000 (UTC)
Date: Mon, 11 Nov 2019 03:19:40 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <1751469294.11431533.1573460380206.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191111012614.GC6235@magnolia>
References: <CA+G9fYtmA5F174nTAtyshr03wkSqMS7+7NTDuJMd_DhJF6a4pw@mail.gmail.com>
 <852514139.11036267.1573172443439.JavaMail.zimbra@redhat.com>
 <20191111012614.GC6235@magnolia>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.18]
Thread-Topic: diotest4.c:476: read to read-only space. returns 0: Success
Thread-Index: OoFxfOUloBUkdPsY/du59GUryWTVqQ==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: _0XAJepROSaUejme0jEEIQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] LTP: diotest4.c:476: read to read-only space. returns 0:
 Success
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
Cc: Theodore Ts'o <tytso@mit.edu>, Arnd Bergmann <arnd@arndb.de>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Christoph Hellwig <hch@infradead.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, linux-ext4 <linux-ext4@vger.kernel.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


----- Original Message -----
> I can't do a whole lot with a code snippet that lacks a proper SOB
> header.

I'll resend as a patch, maybe split it to 2 returns instead.

> > diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
> > index 2f88d64c2a4d..8615b1f78389 100644
> > --- a/fs/iomap/direct-io.c
> > +++ b/fs/iomap/direct-io.c
> > @@ -318,7 +318,7 @@ iomap_dio_bio_actor(struct inode *inode, loff_t pos,
> > loff_t length,
> >                 if (pad)
> >                         iomap_dio_zero(dio, iomap, pos, fs_block_size -
> >                         pad);
> >         }
> > -       return copied ? copied : ret;
> > +       return copied ? (loff_t) copied : ret;
> 
> I'm a little confused on this proposed fix -- why does casting size_t
> (aka unsigned long) to loff_t (long long) on a 32-bit system change the
> test outcome?

Ternary operator has a return type and an attempt is made to convert
each of operands to the type of the other. So, in this case "ret"
appears to be converted to type of "copied" first. Both have size of
4 bytes on 32-bit x86:

size_t copied = 0;
int ret = -14;
long long actor_ret = copied ? copied : ret;

On x86_64: actor_ret == -14;
On x86   : actor_ret == 4294967282

> Does this same diotest4 failure happen with XFS?  I ask
> because XFS has been using iomap for directio for ages.

Yes, it fails on XFS too.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
