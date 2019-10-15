Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 44486D7830
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Oct 2019 16:15:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5566E3C227F
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Oct 2019 16:15:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 561613C2092
 for <ltp@lists.linux.it>; Tue, 15 Oct 2019 16:15:43 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id EAD6A1401499
 for <ltp@lists.linux.it>; Tue, 15 Oct 2019 16:15:42 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C8E64793D1;
 Tue, 15 Oct 2019 14:15:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B5D0110027A9;
 Tue, 15 Oct 2019 14:15:40 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9DDFA1808878;
 Tue, 15 Oct 2019 14:15:40 +0000 (UTC)
Date: Tue, 15 Oct 2019 10:15:40 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <377148518.6295185.1571148940389.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAEemH2cCi5y9PPKnynF5DMwV4Wiyx1jYCvqpTTa-duBNH1CbFw@mail.gmail.com>
References: <26d555b1d9deddb5a6f0a93a7c7d3b00e8abc1ff.1570616598.git.jstancek@redhat.com>
 <CAEemH2eYc1VVtavWKTE-x1gqY6q7qyMVZ-bETXJytPkdvHJriw@mail.gmail.com>
 <1445930938.5951899.1570861051806.JavaMail.zimbra@redhat.com>
 <CAEemH2f2_5wNfNB=a-+=E+KevFOVvjCQ0sjBEG-eS27dwQxarw@mail.gmail.com>
 <23965038.5952515.1570862960195.JavaMail.zimbra@redhat.com>
 <CAEemH2cuxbW55Y_mv9t0u7PEJyQVr9dgtZVFrDYKLi51MSsLmg@mail.gmail.com>
 <1498901254.5980601.1570953247355.JavaMail.zimbra@redhat.com>
 <CAEemH2cCi5y9PPKnynF5DMwV4Wiyx1jYCvqpTTa-duBNH1CbFw@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.7]
Thread-Topic: read_all: retry to queue work for any worker
Thread-Index: L6SphPW3Tqy4ARRfNjI6GV7G23PAOw==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Tue, 15 Oct 2019 14:15:40 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] read_all: retry to queue work for any worker
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
> Well, right! You can merge this patch as it is.

Pushed.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
