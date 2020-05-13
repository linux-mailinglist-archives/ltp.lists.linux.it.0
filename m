Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A6E1D1B68
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 18:42:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5F19B3C54E1
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 18:42:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 3BEF93C54DB
 for <ltp@lists.linux.it>; Wed, 13 May 2020 18:42:28 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 6523C1A01448
 for <ltp@lists.linux.it>; Wed, 13 May 2020 18:42:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589388145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CN3NtNiEXl4YD+Ny8QWzARoOQ25hXkin9vm9ElmbYQw=;
 b=Vl9w+7RIEioFgSORyEcbEWVqMw9X21uHmmmIBJTf7kZV2tMvfixzTc/OQefB9LMUxWgGtP
 v4Edy2pWsqO0vqxmxXXN/irXvyf0saWr52XtpMtNgreV2EVFzhqiogSpPVlXC78YZEM0MH
 aPwAIYiVh1Xp8zAbUJGI3WG87BAmV1I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-hiDsddEVNomYMcBFxTcnMA-1; Wed, 13 May 2020 12:42:23 -0400
X-MC-Unique: hiDsddEVNomYMcBFxTcnMA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFC44107ACCD;
 Wed, 13 May 2020 16:42:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B792760C87;
 Wed, 13 May 2020 16:42:22 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id AECA34E561;
 Wed, 13 May 2020 16:42:22 +0000 (UTC)
Date: Wed, 13 May 2020 12:42:22 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Richard Palethorpe <rpalethorpe@suse.com>, Petr Vorel <pvorel@suse.cz>
Message-ID: <1294007425.12313251.1589388142490.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200513123944.31411-1-rpalethorpe@suse.com>
References: <20200513123944.31411-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.9]
Thread-Topic: pty04: Retry reads when short and wait longer
Thread-Index: VGqQjNzzON63dbbT1p9h2tA1qmDECw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] pty04: Retry reads when short and wait longer
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
> Even though reads are blocking and packets are flipped into the netdevice
> buffer whole, it seems read may return before a full packet is read into user
> land. Retrying read should prevent timeouts and read failures on some
> machines.
> 
> Also this increases the timeout to wait for the checkpoint to a large value
> because sometimes the kernel stalls, possibly while trying to (re)claim
> memory, and this causes the checkpoint wait to timeout and everything to be
> cleaned up. If the kernel is left in a stalled state, this can result in a
> stack trace which is more useful.
> 
> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> Reported-by: Jan Stancek <jstancek@redhat.com>
> Cc: Petr Vorel <pvorel@suse.cz>
> ---
> 
> V3:
> * Increase the timeout on the wait for the reason described above
> * Add some more info to read and write results

Looks good to me as well, ack.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
