Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBFF14EA3A
	for <lists+linux-ltp@lfdr.de>; Fri, 31 Jan 2020 10:45:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2A2293C247C
	for <lists+linux-ltp@lfdr.de>; Fri, 31 Jan 2020 10:45:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 70AEB3C2460
 for <ltp@lists.linux.it>; Fri, 31 Jan 2020 10:45:26 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id AE20D200B7F
 for <ltp@lists.linux.it>; Fri, 31 Jan 2020 10:45:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580463924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VTk/z+YpHT7WLhDsEeioCdr2NYcTGiu2V6fdWhIaJ2Y=;
 b=DihBCMP3GPcKheHekq6CdHq2DXC0wFfxqotF4S8HBbpr8O4vVtmCqeNYPUm6BuKE8uBxK4
 RzQPKGbkR+I2Zn9SDzyUogC5oMVbOgR7J/2QRZuk6J9b5CdKb0+y1u8pKJlT+JRZ9zsH/O
 KbXWlf6RW6H1MBnJDKQys2K2KD5N1qw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-_iExodKTPXCQEVBBtdhWZw-1; Fri, 31 Jan 2020 04:45:20 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57186800D53;
 Fri, 31 Jan 2020 09:45:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BDD8100EBA8;
 Fri, 31 Jan 2020 09:45:19 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3C59318095FF;
 Fri, 31 Jan 2020 09:45:19 +0000 (UTC)
Date: Fri, 31 Jan 2020 04:45:19 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <1480601816.5094241.1580463919045.JavaMail.zimbra@redhat.com>
In-Reply-To: <CA+G9fYvMc73OCXNz_9Ks-GqE828Vd3YFeX_iOrWq3bobGpgUtQ@mail.gmail.com>
References: <20200128135749.822297911@linuxfoundation.org>
 <CA+G9fYsnSGw0NmV5hWwZSs5OYu18YRam3jYCsg4Sn+KUQJSMWw@mail.gmail.com>
 <1680515224.4725561.1580289411736.JavaMail.zimbra@redhat.com>
 <CA+G9fYvMc73OCXNz_9Ks-GqE828Vd3YFeX_iOrWq3bobGpgUtQ@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.9]
Thread-Topic: 4.14.169-stable review
Thread-Index: /iTC7JtruhBmTRcX0HqtKO6ruzvmOQ==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: _iExodKTPXCQEVBBtdhWZw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4.14 00/46] 4.14.169-stable review
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
> On Wed, 29 Jan 2020 at 14:46, Jan Stancek <jstancek@redhat.com> wrote:
> >
> >
> >
> > ----- Original Message -----
> > > NOTE:
> > > LTP fs test read_all_proc fails intermittently on 4.9 and 4.14 branches.
> >
> > [trim CC list to LTP]
> >
> > Naresh, do you have some examples of these failures?
> 
> Yes.
> I have posted the links below.
> 
> > Has it started recently or do you see it long-term?
> 
> We have seen this from a this test is introduced.
> Not specific to any branch. This failure is intermittent and found on
> multiple trees and branches.

Those look like kernel bugs, but it's hard to see what /proc entries
trigger it.

I've been running v5.5 and read_all_proc for ~24 hours on aarch64,
but so far no crashes.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
