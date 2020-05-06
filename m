Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA97A1C7251
	for <lists+linux-ltp@lfdr.de>; Wed,  6 May 2020 16:00:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 64C123C57B3
	for <lists+linux-ltp@lfdr.de>; Wed,  6 May 2020 16:00:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 3C2D43C2623
 for <ltp@lists.linux.it>; Wed,  6 May 2020 16:00:26 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 1B2A81A0101D
 for <ltp@lists.linux.it>; Wed,  6 May 2020 16:00:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588773620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6cavIt+1wJUKGXDavfvYxrkbncxJxKLZLvntIwWkJQs=;
 b=cCKE8wYne1V0VghWUIAWAIIS68ymrNxhWNLG0cqLZqYbFcndirp4hD3+2qd3fANbaHb5zM
 O9rlreyNHAqdCQvmwECnmAkXWthbAbUTRy0wg+tANMLhRTcARA4Mtgl/7CA9cATgqz6dWk
 kmY/1vzTj6aDQauLne8K4u7QlTvDYns=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-IM91bm2eNdWrHNoyTQZDAA-1; Wed, 06 May 2020 10:00:10 -0400
X-MC-Unique: IM91bm2eNdWrHNoyTQZDAA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6C161902EA2;
 Wed,  6 May 2020 14:00:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A2AE019175;
 Wed,  6 May 2020 14:00:09 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8866A18095FF;
 Wed,  6 May 2020 14:00:09 +0000 (UTC)
Date: Wed, 6 May 2020 10:00:09 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <1588328084.11511511.1588773609302.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200506134858.23919-1-pvorel@suse.cz>
References: <20200506134858.23919-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.23]
Thread-Topic: pty04: Fix build for kernel headers < v4.2-rc1
Thread-Index: OWD3AOUFMIOqDPEhRHDyhPx936uihQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] pty04: Fix build for kernel headers < v4.2-rc1
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


----- Original Message -----
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> https://travis-ci.org/github/pevik/ltp/builds/683787204
> 
>  configure.ac                 |  1 +
>  include/lapi/tty.h           | 17 +++++++++++++++++
>  testcases/kernel/pty/pty04.c | 17 ++++++++++-------
>  3 files changed, 28 insertions(+), 7 deletions(-)
>  create mode 100644 include/lapi/tty.h
> 

Works for me (rhel6/7), thanks Petr.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
