Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED05137183
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jan 2020 16:40:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B25513C25AE
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jan 2020 16:40:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 0441A3C24FB
 for <ltp@lists.linux.it>; Fri, 10 Jan 2020 16:40:31 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 609FD601241
 for <ltp@lists.linux.it>; Fri, 10 Jan 2020 16:40:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578670829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SYuUokwwkCO9sAaKzv9B3uFQqLvFzzXTHObS53kObRw=;
 b=FWDeVxdxGhls6bSJJbwyLrJ7N96aE2dS+8AhjShrlbl78CmypJuueUPdvktV0hQxvUUiOL
 eWWZH+7atAUDYChzKQKF3Z2cfFYl5Dt5pZVFs+qVoXnuJYHDm8fLdPG0u7CzT5O9s/p8EU
 ruxKk1ZmWqhlGyvaLjQp/anON2C2Avc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203--bCQuV4aP8Sfn_oltt7EbQ-1; Fri, 10 Jan 2020 10:40:25 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C46028024D6;
 Fri, 10 Jan 2020 15:40:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB5F786CD8;
 Fri, 10 Jan 2020 15:40:24 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id AFF4081C72;
 Fri, 10 Jan 2020 15:40:24 +0000 (UTC)
Date: Fri, 10 Jan 2020 10:40:24 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <140774842.1403937.1578670824528.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200110153539.GC219598@x230>
References: <20200110151443.212842-1-pvorel@suse.cz>
 <20200110152607.GB23359@rei.lan>
 <888974477.1402999.1578670362098.JavaMail.zimbra@redhat.com>
 <20200110153539.GC219598@x230>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.12]
Thread-Topic: tst_device: use raw syscall in the tst_device.h
Thread-Index: 2WfbcEu/89Ki3Bt/eNj7LFKM+2iTPQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: -bCQuV4aP8Sfn_oltt7EbQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] tst_device: use raw syscall in the
 tst_device.h
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
> Hi Jan,
> 
> > > > tested on
> > > > https://travis-ci.org/pevik/ltp/builds/635305638
> 
> > > > Please anybody ack and merge, so we can move on with merging other
> > > > things before git freeze.
> 
> > > Acked once and if the travis run finishes green.
> 
> > Ack, looks good on RHEL too (6.10/7.8/8.1).
> 
> Thanks a lot for testing!
> Sorry, I was faster, so merged without your ack.

No worries, thanks for getting this resolved.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
