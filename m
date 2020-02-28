Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F771733BF
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Feb 2020 10:22:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 43FA33C6ABF
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Feb 2020 10:22:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id B8AA23C2457
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 10:22:13 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 055502015E2
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 10:22:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582881731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q8ebZFffL8Lmw4hJR206UbkDksVkM9lLgPNyMBLncAE=;
 b=QKmwBmaWt5/5hlzcOiQvplNT5H2VSmxsSlZLx1e0BXYc/vkBzd/iSNR3zVVVpiJ2zu0PBU
 GytPNNmvR7VCx07rHUgDAyCrbEmhQJAUxpvCq0NtXtwxALi0hvwGljJSMRPMp5D03CI+tG
 HT8+1Lxix2D7Cz+B27PvK0+sLkoaDqc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-hJQyU1hwNiqoOpZkUKJo-w-1; Fri, 28 Feb 2020 04:22:09 -0500
X-MC-Unique: hJQyU1hwNiqoOpZkUKJo-w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D47E1417;
 Fri, 28 Feb 2020 09:22:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 92FE09299D;
 Fri, 28 Feb 2020 09:22:08 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4D21184481;
 Fri, 28 Feb 2020 09:22:08 +0000 (UTC)
Date: Fri, 28 Feb 2020 04:22:08 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <513439094.9393483.1582881728087.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200228084236.GA4925@dell5510>
References: <20200227163922.317-1-pvorel@suse.cz>
 <20200227163922.317-4-pvorel@suse.cz>
 <CAEemH2ddNJTjzvPgHvtwVTM0CeFYH2_wy7SeK90ZPDMvME9K5g@mail.gmail.com>
 <20200228084236.GA4925@dell5510>
MIME-Version: 1.0
X-Originating-IP: [90.64.79.227, 10.4.196.10, 10.5.101.130, 10.4.195.13]
Thread-Topic: Update style guide to new API
Thread-Index: /+MgFdg0FGg7gnlC16bPiHEAHHdQdg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/4] doc: Update style guide to new API
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
> Hi Jan,
> 
> > > Do we want to keep this document?
> 
> > I agree to remove this old document.
> 
> > > Wouldn't it be better to have this info in Test-Writing-Guidelines (to
> > > have a single document)?
> 
> > Yes, and there are too much-duplicated contents in this, maybe we can
> > extract something useful to library-api-writing-guidelines.txt
> > and test-writing-guidelines.txt then delete it?
> 
> You often quote the style guide. What do you suggest?
> Keep it or delete and move some of it's content to Test-Writing-Guidelines?
> (which ones)?

I'm fine with removing it, and move what's not covered to other docs.

> 
> Kind regards,
> Petr
> 
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
