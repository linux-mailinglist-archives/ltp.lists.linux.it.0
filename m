Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D3FDBF24
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Oct 2019 09:59:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 13F133C225A
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Oct 2019 09:59:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 334443C1CB0
 for <ltp@lists.linux.it>; Fri, 18 Oct 2019 09:58:58 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 66803601926
 for <ltp@lists.linux.it>; Fri, 18 Oct 2019 09:58:58 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6465818CB8E6;
 Fri, 18 Oct 2019 07:58:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5955360852;
 Fri, 18 Oct 2019 07:58:56 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 294AD4E589;
 Fri, 18 Oct 2019 07:58:56 +0000 (UTC)
Date: Fri, 18 Oct 2019 03:58:56 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <908344166.6934710.1571385536128.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191017125442.GB31415@rei.lan>
References: <77c71c80-0ca2-6f67-d628-d337a13539d7@jv-coder.de>
 <81c89bbde27ede0ef4291df60186bdcd293a3db5.1571219422.git.jstancek@redhat.com>
 <20191017125442.GB31415@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.1]
Thread-Topic: timer_getoverrun/2-3: increase tolerance for overshoot
Thread-Index: xVtRbgWAGsWRbKnM3ikOfAxYL0hViw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Fri, 18 Oct 2019 07:58:56 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] timer_getoverrun/2-3: increase tolerance for
 overshoot
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
Cc: joerg vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


----- Original Message -----
> Hi!
> I wonder if we can measure the sleep with monotonic clock, then we can
> be more precise, since we would know how much we overshoot. But it's
> probably not worth of complicating the code.
> 
> Either way I'm fine with this version as well, acked.

I pushed current patch. If we find it's still causing issues
I'll look into the idea with monotonic clock.

Thanks,
Jan

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
