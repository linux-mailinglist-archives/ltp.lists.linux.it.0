Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CD74B16FFDD
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 14:23:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0F96B3C2544
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 14:23:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id D805A3C08C9
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 14:23:47 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 523921000A0F
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 14:23:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582723425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b08ngHZcNw+wjxzgSByW7xzoai7M9A2aSL7RJHy3Cno=;
 b=UFGiXYY1b2H1OLlXFwVeNqO/EobElq38x9oBJlIq9GmH4fGD8mO5wX1ZlvG5UEcCX9LzbS
 uP/fVd/UF/COu19kr4T2zmLBHFmdz//eLvCZS1FsmmMu0KsCRGSIHn6ssjIwxMkI+y22nl
 q3ysLRo/TvA5fhr+bPQzb2yPXLBLlFU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-rsYTWy1-NtGZCvm_8woY_A-1; Wed, 26 Feb 2020 08:23:44 -0500
X-MC-Unique: rsYTWy1-NtGZCvm_8woY_A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E8CF66F;
 Wed, 26 Feb 2020 13:23:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 355E95C28E;
 Wed, 26 Feb 2020 13:23:43 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id B9ED784460;
 Wed, 26 Feb 2020 13:23:42 +0000 (UTC)
Date: Wed, 26 Feb 2020 08:23:42 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <1576675558.9115231.1582723422538.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200226124826.GA24080@rei>
References: <20200226084249.29561-1-pvorel@suse.cz>
 <CAEemH2cMBtVV-1_RZb_UHN9rQF3sD2w-H2gS11BD2WHPTPzvgQ@mail.gmail.com>
 <20200226091824.GA2215@dell5510>
 <CAEemH2cXGOh=MX28kYvhFaHspHGXiVdGuNZeyN97+O3+bt1jGg@mail.gmail.com>
 <20200226113757.GA24342@dell5510> <20200226124826.GA24080@rei>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.25]
Thread-Topic: request_key04: Use TFAIL instead of TBROK
Thread-Index: IEwmaAKrqj0yUED9pKILTg1KSf8Y7A==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] request_key04: Use TFAIL instead of TBROK
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
> Hi!
> > > In personally, I'd let tst_res() only accept 'TPASS, TFAIL, TINFO, TCONF,
> > > TWARN'.
> > +1. Cyril, Jan?
> 
> I guess that it does not make much sense to report TBROK and then
> continue the test. But that all depends on how exactly are these states
> defined. Have we ever wrote them down?
> 
> I guess that TPASS and TFAIL are obvious.
> 
> TINFO is just additional information.
> 
> TCONF is test skipped.
> 
> TWARN something went wrong but we decided to continue?

This appears to be mostly used in cleanup() when something goes wrong.
So a failure that's not critical, not related to goal of test,
but still something we want to draw attention to.

> 
> TBROK something went wrong and we decided to exit?

We do have following in style-guide.txt:

Use +TBROK+ when an unexpected failure unrelated to the goal of the testcase
occurred, and use +TFAIL+ when an unexpected failure related to the goal of
the testcase occurred.

I agree that tst_res with TBROK doesn't make much sense. I see TBROK as
something we can't recover from and need to end the test. Otherwise
if we want to skip part of test, then TCONF looks more fitting.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
