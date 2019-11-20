Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AD1103459
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Nov 2019 07:41:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 518843C2383
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Nov 2019 07:41:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 59D383C17A3
 for <ltp@lists.linux.it>; Wed, 20 Nov 2019 07:41:04 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 603C61A00EB9
 for <ltp@lists.linux.it>; Wed, 20 Nov 2019 07:41:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574232062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8GbYrPiGo/WrpymA+Fl5JmaQWrq9woMnjiZ4flMdl3s=;
 b=XlNgWIZD5uv07go58f1VWfmEGzDgmHo6d0EIQLiDnwSsOOxT7EJR89FyTc0QauGFLeSM8Z
 Xay39fSgUH1ZGm/Oam69KkX9yVZmLfnNsFUhL6RN12Wre7+FF2aDCYUJMtR4U6/oeSTZuL
 WY9e6FQqHWAmvhhIB+OGdGISZ8oesNU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-fCrccZv2PquVaBX42L1jJw-1; Wed, 20 Nov 2019 01:40:59 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FF21107ACC5;
 Wed, 20 Nov 2019 06:40:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B363E5C1B2;
 Wed, 20 Nov 2019 06:40:57 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 20EC418089C8;
 Wed, 20 Nov 2019 06:40:57 +0000 (UTC)
Date: Wed, 20 Nov 2019 01:40:56 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <1055215037.13116966.1574232056907.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAEemH2dZCm5MVyhzWiFKVK-jt+UUw65u5CRFk-moUVUgpDHHWg@mail.gmail.com>
References: <20191119094156.20348-1-liwang@redhat.com>
 <1860355560.12961927.1574161647388.JavaMail.zimbra@redhat.com>
 <CAEemH2cN8qv_YpsFKJazcOKEvgfjXpacZOV_Er-0bjK86=6VpQ@mail.gmail.com>
 <c9d278e6-5700-6c16-019b-1770a6ede0ff@suse.cz>
 <CAEemH2dZCm5MVyhzWiFKVK-jt+UUw65u5CRFk-moUVUgpDHHWg@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.56, 10.4.195.1]
Thread-Topic: tst_fill_fs: enhance the filesystem filling routine
Thread-Index: A/rnHdPqQrQ3jlibzzH16aIEp46Bew==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: fCrccZv2PquVaBX42L1jJw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_fill_fs: enhance the filesystem filling
 routine
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


----- Original Message -----
> > You don't need to reduce the write size in the first place. Kernel will
> > happily do short writes for you if the file system somehow finds some
> >
> 
> You're probably right, but here I just want to enhance the tst_fill_fs
> routine, it obviously couldn't  be guaranteed way to perfectly fill a
> filesystem, this action from userspace is what I can think of.
> 
> 
> > free blocks. The more important question is how to trigger garbage
> > collection of internal file system book-keeping data.
> >
> 
> Okay. I'm not good at FS issues. Or, do you have a better idea for that?

FS devs mentioned couple ideas. Repeated writes (this thread), fsync, mount+umount.
But all suggestions were from "better" category, don't think we have 100% reliable one.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
