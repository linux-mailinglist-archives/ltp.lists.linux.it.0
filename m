Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A7DE03FB
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Oct 2019 14:40:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 944563C22C1
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Oct 2019 14:40:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 8911E3C1C89
 for <ltp@lists.linux.it>; Tue, 22 Oct 2019 14:40:04 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id E1070600C2C
 for <ltp@lists.linux.it>; Tue, 22 Oct 2019 14:40:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571748002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mqqePCSwHVtKDAkBdVse/gdh9g6ajfovYdwQ0+j6dvc=;
 b=TsHLSsANVds4svwFPy2ogOOCnqWriudw1JrDYqfnsAJkGRGu+SCJivT7C2LkIzHeddGR+A
 kXId5iwlNyqLjmpNB6Qvr4shq3kqct6TWLQkYBrHF7kAX5mBz3FgcsipBCdTw7l8Cjyq3z
 XLJbd3UVljDa5lm8gCF0/9pnnhYYq9g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-yjJ-q7JtOzqTZUV8epJzwQ-1; Tue, 22 Oct 2019 08:40:00 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA3D61800D79;
 Tue, 22 Oct 2019 12:39:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D244360856;
 Tue, 22 Oct 2019 12:39:59 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id CA2A818089DC;
 Tue, 22 Oct 2019 12:39:59 +0000 (UTC)
Date: Tue, 22 Oct 2019 08:39:59 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>, Li Wang <liwang@redhat.com>
Message-ID: <2016228785.8155247.1571747999778.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191022113704.GA13757@rei>
References: <651aa5d59504efe89ee8428afd95fe90a9bbea38.1571412608.git.jstancek@redhat.com>
 <20191022113704.GA13757@rei>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.1]
Thread-Topic: thp02: simplify test to lower memory requirements
Thread-Index: iQasJLd6OZxM+WcSC2daPGZkdeVtkg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: yjJ-q7JtOzqTZUV8epJzwQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] thp02: simplify test to lower memory requirements
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
> > Test is using 4 hugepages per allocation, and makes 4*3 allocations
> > in total. This is problem for aarch64, where default huge page size
> > is 512M. Systems are running into unexpected OOMs, because there
> > is no check for available memory.
> > 
> > Simplify test by:
> > - dropping 3rd allocation, it's used only for pattern comparison
> > - run test function in new child process, so we don't need to worry
> >   about cleaning up after mremap() and it lowers overall memory
> >   requirements
> > - add a simple check if there's enough memory to setup()
> > - drop .needs_root, there's no need for it
> 
> Looks good, acked.

Pushed.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
