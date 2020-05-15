Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D04A21D4921
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 11:10:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 698F53C53BD
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 11:10:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 1662A3C539E
 for <ltp@lists.linux.it>; Fri, 15 May 2020 11:10:46 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id F371E2014B4
 for <ltp@lists.linux.it>; Fri, 15 May 2020 11:10:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589533844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yhtjX4LY2Rkm5a9aAzifZjrM79DtacZaJ6g8oiOggOo=;
 b=XMOpp6kh9umlXKRVyqudOThlJvTD/OgjHhvS4gO1uQ8IeL8ag+J4cBVQKrDbPnHep/XdU1
 useieCfWyiVdk80/bVzO/FfdvAB/fU3obzBg6RgU7Dl7h2bIB050CZ/y1fioscc6/0x4iw
 RIrbvXGub1uR21cOCptx72dHFpYsVVM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-ynYhuVECPaaNcACYaS1HBA-1; Fri, 15 May 2020 05:10:40 -0400
X-MC-Unique: ynYhuVECPaaNcACYaS1HBA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5AC48018A2;
 Fri, 15 May 2020 09:10:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD94760C05;
 Fri, 15 May 2020 09:10:39 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id B50D218095FF;
 Fri, 15 May 2020 09:10:39 +0000 (UTC)
Date: Fri, 15 May 2020 05:10:39 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <962317877.12564854.1589533839512.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200515090616.GA29676@dell5510>
References: <20200515070022.16407-1-pvorel@suse.cz>
 <1321342340.12558723.1589531383298.JavaMail.zimbra@redhat.com>
 <20200515090238.GA29151@dell5510> <20200515090616.GA29676@dell5510>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.6]
Thread-Topic: INSTALL: Update requirements, modernise text
Thread-Index: MbrxfKWqXWHQS7C7IaR0ttA9VFwOVA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/4] INSTALL: Update requirements,
 modernise text
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
> > > Do we want to list also optional packages here?
> > > libaio-devel libcap-devel numactl-devel openssl-devel and others?
> > I was thinking to ask users to have look into travis/*.sh (if it's
> > packaged),
> Yes, travis files are packaged in tarball.
> 
> > as I was trying to avoid maintaining the dependencies on 2 places,
> > but I can put it there.

Pointer to different file is fine. Just so it's clear that listed requirements
are bare minimum, and some tests need extra libraries to work.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
