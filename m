Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C409104E43
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 09:45:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C80463C1CA3
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 09:45:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 907693C0738
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 09:45:09 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 10620209D48
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 09:45:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574325907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ohyKjw/I3oJ8seUodNyA+DwMv+eqCUggxLUorBsjwE=;
 b=TXeezBzgnC58SyNpAJjiAtexoqVrxLbMUOZWGwWtJuBXDVlq6umVXxGk8vNtkJeS4ipggp
 HypP+6TNLY6/Mm+DRC962bOT+FOnlZF57W6Yd3GV5Rp7/sfhQuIg284UcyC1eDFUblTwg2
 VH3qjKr6CRT8tZg1R252LwndOh5GBnA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-23dx4Dt3NE6EqpfM_UAnOQ-1; Thu, 21 Nov 2019 03:45:04 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07E18801E76;
 Thu, 21 Nov 2019 08:45:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E4E225F92C;
 Thu, 21 Nov 2019 08:45:02 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id C22B14BB5B;
 Thu, 21 Nov 2019 08:45:02 +0000 (UTC)
Date: Thu, 21 Nov 2019 03:45:02 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <983876625.13285336.1574325902291.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191120122910.GD14963@rei.lan>
References: <cover.1574087532.git.jstancek@redhat.com>
 <53c6b3308d3e77fd95cae17b2a7ed1d4e8b2f60e.1574087532.git.jstancek@redhat.com>
 <20191120122910.GD14963@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.22]
Thread-Topic: perf_event_open02: migrate to newlib
Thread-Index: Gm2GcxojNbnkjYhnwgr+5fwEM/RmWA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 23dx4Dt3NE6EqpfM_UAnOQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] perf_event_open02: migrate to newlib
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
> Hi!
> > @@ -312,15 +238,13 @@ static void cleanup(void)
> >  {
> >  	int i;
> >  
> > -	for (i = 0; i < n; i++) {
> > -		if (hwfd[i] > 0 && close(hwfd[i]) == -1)
> > -			tst_resm(TWARN | TERRNO, "close(%d) failed", hwfd[i]);
> > -		if (tskfd[i] > 0 && close(tskfd[i]) == -1)
> > -			tst_resm(TWARN | TERRNO, "close(%d) failed", tskfd[i]);
> > +	for (i = 0; i < ntotal; i++) {
> > +		SAFE_CLOSE(hwfd[i]);
> > +		SAFE_CLOSE(tskfd[i]);
> 
> Shouldn't we check that the hwfd[i] and tskfd[i] are > 0?
> 
> I guess that we may do SAFE_CLOSE(0) repeatedly here in a case that
> perf_event_open() failed somewhere in the middle of the setup().

I'll add check for -1, since 0 could be valid (even though it's unlikely).

> 
> Otherwise this is a nice cleanup, acked.

Thanks for review.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
