Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 226061D4DCF
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 14:37:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CCC3B3C53A8
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 14:37:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 640903C1414
 for <ltp@lists.linux.it>; Fri, 15 May 2020 14:37:12 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 782EF601F16
 for <ltp@lists.linux.it>; Fri, 15 May 2020 14:37:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589546230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TT1YWAYowcuRJdbqZE3VezA7AD+Vg8HBrsguxHJQbrs=;
 b=LSNfYHGm29Yy7ecZckhiy0XdSWpx+4pPuPdlNDcE6gxQcIDkH8/mlwmpIec9ehU6ZzV8ek
 WQ42S6Z1pb7K0txMGlcpi6RAkWYJ7BYvNJxzUPscIcr/2us+PR7rzQ5/k7rYE38gHf2dS+
 E4lCZ0ev0PR61bRGEsS12/BlrsD7xxc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-jVAk_QlJP7ymT5OLcH0DAQ-1; Fri, 15 May 2020 08:37:08 -0400
X-MC-Unique: jVAk_QlJP7ymT5OLcH0DAQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBF23107ACF2;
 Fri, 15 May 2020 12:37:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E54CF5D9D7;
 Fri, 15 May 2020 12:37:07 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id DE9DA4E9E4;
 Fri, 15 May 2020 12:37:07 +0000 (UTC)
Date: Fri, 15 May 2020 08:37:07 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <1899128312.12583700.1589546227679.JavaMail.zimbra@redhat.com>
In-Reply-To: <914267680.12582166.1589545134812.JavaMail.zimbra@redhat.com>
References: <20200515103910.8703-1-rpalethorpe@suse.com>
 <20200515114837.GB3395@yuki.lan>
 <914267680.12582166.1589545134812.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.7]
Thread-Topic: pty04: Avoid receiving packets from all interfaces
Thread-Index: OpVaiSRHSjCFOUvUEAouqnu9ndVK25GHO3Fi
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] pty04: Avoid receiving packets from all interfaces
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


----- Original Message -----
> 
> 
> ----- Original Message -----
> > Hi!
> > Sounds reasonable, also hope it's the last patch. :-)
> > 
> > @Jan do you want to test this as well, or should I apply and proceed
> > with the release?
> 
> I haven't spotted potential issue while looking at kernel code,
> will test the patch just to be sure.

It still gets occasionally stuck on 5.7.0-rc4, but the chance to hit
it appears lower. I think merge the patch and we'll see how frequently
it happens with single iteration. We can always disable it later in
runtest file.

# ./pty04 -i 10
tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s
pty04.c:130: INFO: PTS path is /dev/pts/2
pty04.c:207: INFO: Netdev is sl0
pty04.c:216: INFO: Netdev MTU is 8192 (we set 8192)
pty04.c:233: INFO: Bound netdev 245 to socket 5
tst_buffers.c:55: INFO: Test is using guarded buffers
pty04.c:324: INFO: Reading from socket 5
tst_buffers.c:55: INFO: Test is using guarded buffers
pty04.c:180: PASS: Wrote PTY N_SLIP 3 (1)
pty04.c:191: PASS: Wrote PTY N_SLIP 3 (2)
pty04.c:328: PASS: Read netdev N_SLIP 5 (1)


tst_checkpoint.c:149: BROK: pty04.c:364: tst_checkpoint_wait(0, 100000): ETIMEDOUT (110)
tst_test.c:373: BROK: Reported by child (2990)
pty04.c:306: BROK: Read 0 of 8191 bytes: ENETDOWN (100)
pty04.c:196: PASS: Writing to PTY interrupted by hangup
tst_test.c:373: WARN: Reported by child (2987)


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
