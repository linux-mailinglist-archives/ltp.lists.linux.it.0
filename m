Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 473D5249E29
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Aug 2020 14:36:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0486A3C2FDA
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Aug 2020 14:36:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id BC3773C04C3
 for <ltp@lists.linux.it>; Wed, 19 Aug 2020 14:36:24 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id E61921400DF7
 for <ltp@lists.linux.it>; Wed, 19 Aug 2020 14:36:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597840582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TaDA7zq1mPFKIqh2UsWsnfypSoscqPK0vjHzMV1L6iM=;
 b=gt0fE8F0ybAjQ2jTxjfEfjoEet56JirW+reAicChyRzsg6+aJC+R7SlYc9QZdV8auVZEUV
 CCasU8QAAPoQ/V41UuJBGWBaq2pixZDF0yyJn2mWySW+f8+cKGLHdsK/EOF71cwc9d5HSy
 d/6cAtvFPTuYniHQEkJnfICG1o2gwSM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-IWJwF-dKPkiFRiKjNi0gkA-1; Wed, 19 Aug 2020 08:36:20 -0400
X-MC-Unique: IWJwF-dKPkiFRiKjNi0gkA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 649E151B8;
 Wed, 19 Aug 2020 12:36:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 375FA7BE92;
 Wed, 19 Aug 2020 12:36:19 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6EC8C662A1;
 Wed, 19 Aug 2020 12:36:18 +0000 (UTC)
Date: Wed, 19 Aug 2020 08:36:18 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Christian Brauner <christian.brauner@ubuntu.com>, 
 naresh kamboju <naresh.kamboju@linaro.org>, 
 viresh kumar <viresh.kumar@linaro.org>
Message-ID: <1455329861.9212470.1597840578327.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200819080204.a5iqoqvlwuizimje@wittgenstein>
References: <8eefb21d278f0846024a16281c5e19b0e3936979.1596797812.git.jstancek@redhat.com>
 <20200819080204.a5iqoqvlwuizimje@wittgenstein>
MIME-Version: 1.0
X-Originating-IP: [10.40.208.12, 10.4.195.16]
Thread-Topic: syscalls/clone302: drop CLONE_CHILD_SETTID and
 CLONE_PARENT_SETTID
Thread-Index: yaF1x5R0siJeM1fhAqQegp/QM7fqsg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/clone302: drop CLONE_CHILD_SETTID and
 CLONE_PARENT_SETTID
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
> On Fri, Aug 07, 2020 at 12:58:44PM +0200, Jan Stancek wrote:
> > Per
> > https://lore.kernel.org/linux-m68k/20200627122332.ki2otaiw3v7wndbl@wittgenstein/T/#u
> > EFAULT isn't propagated back to userspace so these will always appear
> > to succeed. Also issue is that multiple flags are tested together
> > and some arguments persisted between calls, because they were set
> > only when argument != NULL.
> > 
> > Cc: Christian Brauner <christian.brauner@ubuntu.com>
> > Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> > Signed-off-by: Jan Stancek <jstancek@redhat.com>
> > ---
> 
> Thanks!
> Acked-by: Christian Brauner <christian.brauner@ubuntu.com>

Pushed.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
