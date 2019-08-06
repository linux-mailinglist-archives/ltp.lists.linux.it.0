Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 024A083075
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Aug 2019 13:17:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C7C3F3C1CF5
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Aug 2019 13:17:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 8B1103C194D
 for <ltp@lists.linux.it>; Tue,  6 Aug 2019 13:17:07 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 83D43600BC3
 for <ltp@lists.linux.it>; Tue,  6 Aug 2019 13:17:09 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8CAA6C00F7D5
 for <ltp@lists.linux.it>; Tue,  6 Aug 2019 11:17:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82D3B5C1B5
 for <ltp@lists.linux.it>; Tue,  6 Aug 2019 11:17:05 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 78C312551B;
 Tue,  6 Aug 2019 11:17:05 +0000 (UTC)
Date: Tue, 6 Aug 2019 07:17:05 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <23449784.4890660.1565090225268.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAEemH2cDDgKrhxDwNgUq_yg_=v0YKXhHWBVugfg4Wy6UKOuNcA@mail.gmail.com>
References: <6db4a928733290dca3b2e4b4a27f1cb69d805401.1563959090.git.jstancek@redhat.com>
 <CAEemH2dqE8Ad_r+vnrd0BnBoyOO9GTLoE20SPSQtV7mbr-Yabg@mail.gmail.com>
 <1049532097.3289438.1564481693647.JavaMail.zimbra@redhat.com>
 <CAEemH2cDDgKrhxDwNgUq_yg_=v0YKXhHWBVugfg4Wy6UKOuNcA@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.25]
Thread-Topic: syslog: fix sporadic failures due to rate-limitting
Thread-Index: QD7hM2RPmP4THJT8P6j0zpyl5ADxFg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Tue, 06 Aug 2019 11:17:05 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syslog: fix sporadic failures due to
 rate-limitting
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
> > Have you followed all the steps?
> > - stop rsyslog
> > - delete imjournal.state
> > - run kmsg01 couple times
> > - run syslog01
> 
> Finally, I run more times for ksm01 to make a large backlog of
> messages then reproduced it. After applying your patch, the problem
> does not appear anymore.  So, ACK for this patch.

Pushed.

Thanks,
Jan

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
