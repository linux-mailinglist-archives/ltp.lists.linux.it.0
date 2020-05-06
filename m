Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ED01C6EB9
	for <lists+linux-ltp@lfdr.de>; Wed,  6 May 2020 12:50:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 511EE3C2620
	for <lists+linux-ltp@lfdr.de>; Wed,  6 May 2020 12:50:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id CDD6A3C2608
 for <ltp@lists.linux.it>; Wed,  6 May 2020 12:50:03 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id D87DA14016AD
 for <ltp@lists.linux.it>; Wed,  6 May 2020 12:50:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588762201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LAwO6jCkAo1zKBr5cRGhgkiLkugxfYDm+URqJZB+MFw=;
 b=ZJnA9+GReavtO/yJ59klRerGwbEu+mwVfBlpkDb08jmI7ofVZIqoXQe4cjGrEgW500Rtlw
 agIaOhlFUy32lGb7ngzmTBUyNe+lkeSAVMTfdRZvjygEQGcPFSeZygN5pkN49YSduN0MSN
 eBtUP4wCSck3lWk1Fq82fmaYxkJK0QI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-xDgXzpPnNKKg-sJ5qC9pdg-1; Wed, 06 May 2020 06:49:57 -0400
X-MC-Unique: xDgXzpPnNKKg-sJ5qC9pdg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64AD780183C;
 Wed,  6 May 2020 10:49:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 577805C1D4;
 Wed,  6 May 2020 10:49:56 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id EE9DB4CA94;
 Wed,  6 May 2020 10:49:55 +0000 (UTC)
Date: Wed, 6 May 2020 06:49:55 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: rpalethorpe@suse.de
Message-ID: <1106041841.11477901.1588762195733.JavaMail.zimbra@redhat.com>
In-Reply-To: <877dxpsb4n.fsf@our.domain.is.not.set>
References: <20200505101625.25020-1-rpalethorpe@suse.com>
 <20200505133746.GB21884@dell5510> <87d07isaka.fsf@our.domain.is.not.set>
 <877dxpsb4n.fsf@our.domain.is.not.set>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.21]
Thread-Topic: pty04: Use guarded buffers for transmission
Thread-Index: FZu0K7Q24OBVbinaOKalbyOymO07RQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/2] pty04: Use guarded buffers for transmission
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



----- Original Message -----
> Hi,
> 
> Richard Palethorpe <rpalethorpe@suse.de> writes:
> 
> > Hello,
> >
> > Petr Vorel <pvorel@suse.cz> writes:
> >
> >> Hi Richard,
> >>
> >>> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> >>> ---
> >>
> >> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> >>
> >> BTW Every second run with this patch it blocks after pty04.c:214: PASS:
> >> Read netdev 1
> >> and then:
> >> tst_checkpoint.c:147: BROK: pty04.c:249: tst_checkpoint_wait(0, 10000):
> >> ETIMEDOUT (110)
> >> tst_test.c:373: BROK: Reported by child (26650)
> >> safe_macros.c:258: BROK: pty04.c:215: read(5,0x7efebc306001,8191) failed,
> >> returned -1: ENETDOWN (100)
> >> pty04.c:139: PASS: Writing to PTY interrupted by hangup
> >> tst_test.c:373: WARN: Reported by child (26648)
> >>
> >> Tested on 5.7.0-rc3 in Tumbleweed.
> >> But it looks this is not caused by this change, but was here before,
> >> because the
> >> same behavior I see when testing pty04 *without* this patch on various
> >> kernels
> >> (5.3.7, 5.6.0-rc5) and some of the never SLES (4.12 based).
> >>
> >> Kind regards,
> >> Petr
> >
> > This looks similar to the issue reported by Jan:
> >
> > https://github.com/linux-test-project/ltp/issues/674
> >
> > Is this the full output?
> >
> > Thinking aloud: the following (probably) happens when writing to the PTY
> >
> > write() -> PTY -> SLIP/SLCAN -> netdev -> read()
> >
> > Writing to the PTY causes the PTY to write to the line discipline. What
> > I found was that when the line discipline receive buffer got full and the
> > PTY
> > send buffer got full. The write would go to sleep and never wake up
> > because the line discipline drained the receive buffer, but doesn't
> > signal it is ready for more data (with tty_unthrottle). So I used
> > nonblocking writes which just retry writing.
> >
> > From Jan's errors it looks like it might just be reading that is failing
> > in one case and that writing is also failing in the other until we
> > cancel the read. I doubt this is anything to do with the netdev code
> > because it is generic networking code AFAICT and should work correctly
> > with blocking reads...
> 
> Probably the best thing todo for now is to remove the test before the
> release as this requires some more investigation.

We can keep it in tree, I'd just disable it in runtest file(s), so it's not
run by default.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
