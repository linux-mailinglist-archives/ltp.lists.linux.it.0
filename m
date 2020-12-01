Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9537A2CA03D
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Dec 2020 11:47:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4FBC23C592C
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Dec 2020 11:47:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id E5DBA3C2BF6
 for <ltp@lists.linux.it>; Tue,  1 Dec 2020 11:47:18 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 820CA600D7C
 for <ltp@lists.linux.it>; Tue,  1 Dec 2020 11:47:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606819637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LDiQo9tNhKJH7Ari73aipEo1PukobtIwQTfxGK7RQps=;
 b=PfVoVRsUHRPM0RrcfMVviiZx5lEtwH6g9/e6XAvvqUu5d7tCKfPSQgGBK6xmjdoQrLU1nz
 +WIqFEkw+6wxAujSsekKWppA5u4KSYYZSChb9aaNCr0Edaytmv0KNSglsNhz8tXEwmjxso
 3GsVv8C5sXPFgQtWqnJgOU1E8S4Qxg8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-fQZuqN0TMpqDhPlNHlEE8Q-1; Tue, 01 Dec 2020 05:47:14 -0500
X-MC-Unique: fQZuqN0TMpqDhPlNHlEE8Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D03A1842141;
 Tue,  1 Dec 2020 10:47:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5566D60BE5;
 Tue,  1 Dec 2020 10:47:13 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id CFBA14BB40;
 Tue,  1 Dec 2020 10:47:12 +0000 (UTC)
Date: Tue, 1 Dec 2020 05:47:12 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <738639647.26717511.1606819632601.JavaMail.zimbra@redhat.com>
In-Reply-To: <20201201092040.GB20076@yuki.lan>
References: <20201127163150.22903-3-chrubis@suse.cz>
 <0f8ede1f55d67b7ff4fd17c38f9bfc6a835b43a3.1606813521.git.jstancek@redhat.com>
 <20201201092040.GB20076@yuki.lan>
MIME-Version: 1.0
X-Originating-IP: [10.36.110.76, 10.4.195.19]
Thread-Topic: Add test library design document
Thread-Index: ggIEnhcPLN8LgFbA8cURdKd3hX+7Uw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] lib: Add test library design document
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
> > +## High-level picture
> > +
> > +    library process
> > +    +----------------------------+
> > +    | main                       |
> > +    |  tst_run_tcases            |
> > +    |   do_setup                 |
> > +    |   for_each_variant         |
> > +    |    for_each_filesystem     |   test process
> > +    |     fork_testrun
> > ------------->+--------------------------------------------+
> > +    |      waitpid               |   | testrun
> > |
> > +    |                            |   |  do_test_setup
> > |
> > +    |                            |   |   tst_test->setup
> > |
> > +    |                            |   |  run_tests
> > |
> > +    |                            |   |   tst_test->test(i) or
> > tst_test->test_all  |
> > +    |                            |   |  do_test_cleanup
> > |
> > +    |                            |   |   tst_test->cleanup
> > |
> > +    |                            |   |  exit(0)
> > |
> > +    |   do_exit                  |
> > +--------------------------------------------+
> > +    |    do_cleanup              |
> > +    |     exit(ret)              |
> > +    +----------------------------+
> 
> Shouldn't we wrap this to ``` so that it renders nicely on the web?

I thought the 4 spaces prefix will already do that. I was testing
it online on dillinger.io and stackedit.io. But I'm fine with adding ```,
if that's better for github.




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
