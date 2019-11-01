Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D448EC017
	for <lists+linux-ltp@lfdr.de>; Fri,  1 Nov 2019 09:54:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A2D373C24A4
	for <lists+linux-ltp@lfdr.de>; Fri,  1 Nov 2019 09:54:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 4D0D53C246B
 for <ltp@lists.linux.it>; Fri,  1 Nov 2019 09:54:45 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 07D44600909
 for <ltp@lists.linux.it>; Fri,  1 Nov 2019 09:54:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572598482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MzvXO5sY6LeeLzIEwpZep7A/x/JlzqVjFb+bkxWMUXw=;
 b=HNPRtfLiIBoxszmNio6vy4T1BHIXWi19PpEqyxlxJagA5biUi0anE6wY7/KTLo9b31rXG7
 5d2K3O8kxvwMjzja+e+HV5JrW//DG1RrLju3nstzNx8x4NipUtpSfaGSWIMTj7bUqrxhu2
 Y6TXlGaaa2AFte0+ipMUBhKv3q82Zw4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-nJHtmOWiNHikcIS1ywKmdg-1; Fri, 01 Nov 2019 04:54:34 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6DF9800C77;
 Fri,  1 Nov 2019 08:54:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF1915D9CA;
 Fri,  1 Nov 2019 08:54:33 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id A4E8B18095FF;
 Fri,  1 Nov 2019 08:54:33 +0000 (UTC)
Date: Fri, 1 Nov 2019 04:54:33 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>, Petr Vorel <pvorel@suse.cz>
Message-ID: <53174843.10094606.1572598473354.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAEemH2eT1aAujLbt7HtuBo1gpE2OadYFuBCf5fiaVKxboj7TtQ@mail.gmail.com>
References: <20190925094721.18932-1-chrubis@suse.cz>
 <575273995.9684474.1572426415443.JavaMail.zimbra@redhat.com>
 <1665612504.9724602.1572440600772.JavaMail.zimbra@redhat.com>
 <20191030144649.GA25642@dell5510>
 <116299070.9793183.1572457283737.JavaMail.zimbra@redhat.com>
 <CAEemH2dO95d2_CZyMpE4fM8CcC+p0ou9XfA43sS9fX0LmQBWoQ@mail.gmail.com>
 <2003376860.9886044.1572511989903.JavaMail.zimbra@redhat.com>
 <CAEemH2eT1aAujLbt7HtuBo1gpE2OadYFuBCf5fiaVKxboj7TtQ@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.30]
Thread-Topic: syscalls/acct02: Check read size.
Thread-Index: DtA4Jk+Az1p3HwjwrGigvxCx5RSf4A==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: nJHtmOWiNHikcIS1ywKmdg-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/acct02: Check read size.
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
> On Thu, Oct 31, 2019 at 4:53 PM Jan Stancek <jstancek@redhat.com> wrote:
> 
> >
> > ----- Original Message -----
> > > > Above was RHEL7. Do you expect different outcome on RHEL8?
> > > > I was looking at upstream sources too and it looked similar.
> > > >
> > > > Anyway, I don't think this part is an issue, test will skip it
> > > > because "comm" doesn't match.
> > > >
> > > > We can tweak 'ac_btime' condition, but I think the test will remain
> > > >
> > >
> > > How much time of the ac_btime shaking to be tolerated is proper?
> >
> > I wanted to go with 1 sec:
> >
> 
> I'm ok with that. Seems no better way so far.

I want to look at this a bit more, and add some extra traces to kernel.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
