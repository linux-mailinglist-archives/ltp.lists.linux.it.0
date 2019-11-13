Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB59FB50B
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Nov 2019 17:27:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 359A33C22B9
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Nov 2019 17:27:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id C28923C226D
 for <ltp@lists.linux.it>; Wed, 13 Nov 2019 17:27:48 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 16DDE601487
 for <ltp@lists.linux.it>; Wed, 13 Nov 2019 17:27:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573662466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V/XR+Oh2nQ0G+KmkdpCerIm9fEdQiA+9kAujau9oJtc=;
 b=Gq48I18DqLbs2t/sj7yl9URbt6jzq6p0261c2ipl9xPIUFZdukOiJwPSitN/oUe9tspzUj
 eE9MpMPPaK3bLtkIOjsQ/4TJ9GChmsSQAQ8XKQ5mJRYd4tbv1joJt/xhpuz37XB6TFoXfd
 d2zy8bk+UvuSmLirefpqETBwKJIMv/E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-PlfBX0dXNkmHqv3gNYzHQQ-1; Wed, 13 Nov 2019 11:27:43 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5DFF2803CFC;
 Wed, 13 Nov 2019 16:27:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 54F25D01E0;
 Wed, 13 Nov 2019 16:27:42 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4BBE618095FF;
 Wed, 13 Nov 2019 16:27:42 +0000 (UTC)
Date: Wed, 13 Nov 2019 11:27:42 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Yongxin Liu <yongxin.liu@windriver.com>
Message-ID: <81526046.11972982.1573662462115.JavaMail.zimbra@redhat.com>
In-Reply-To: <2005122441.11970775.1573662156034.JavaMail.zimbra@redhat.com>
References: <20191112035237.39839-1-yongxin.liu@windriver.com>
 <2005122441.11970775.1573662156034.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.214, 10.4.195.7]
Thread-Topic: mkswap01.sh: Add "udevadm trigger" before swap verification
Thread-Index: ToQbfcldrS3wq/xTE8QQmiVsI+0N2jsz26Qj
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: PlfBX0dXNkmHqv3gNYzHQQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] mkswap01.sh: Add "udevadm trigger" before swap
 verification
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
> 
> 
> ----- Original Message -----
> > diff --git a/testcases/commands/mkswap/mkswap01.sh
> > b/testcases/commands/mkswap/mkswap01.sh
> > index 3a348c6e6..9437c4a4e 100755
> > --- a/testcases/commands/mkswap/mkswap01.sh
> > +++ b/testcases/commands/mkswap/mkswap01.sh
> > @@ -129,6 +129,8 @@ mkswap_test()
> >  		return
> >  	fi
> >  
> > +	udevadm trigger --name-match=$TST_DEVICE
> 
> It's been many months since I looked at this,..
> Can you explain why this fixes it?
> 
> Don't we need "udevadm settle" as well to make sure udev caught up
> before we check result?

Ah, test is using TST_RETRY_FUNC, so udev should have time
to catch up. Please ignore my query.

Thanks,
Jan


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
