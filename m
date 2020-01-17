Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 76814140586
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jan 2020 09:35:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DD3103C207E
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jan 2020 09:35:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 17B5B3C207E
 for <ltp@lists.linux.it>; Fri, 17 Jan 2020 09:35:22 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id BF359600974
 for <ltp@lists.linux.it>; Fri, 17 Jan 2020 09:35:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579250119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Yhtv60kTBgLbtrf5+KxVHz2BHqtcVn/8f147NS0+So=;
 b=Xo/AyUGOolNmks53vZoo/3ptjKKC+xDJa4HBzCh2JqM9tpkVQkTgrqQ4nUh0FaQlZYCPOx
 HrcYF+K/6UDfexubAoYeIC9hPzKTvYywVDxQTTySpuCgsjJgM03+aYVLJDf8tUXElzilA9
 zk1oSx+zCYciNdPt8m+UXbt7Mv/9ryE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-px9lVYfWP7CngCFPjmpKhg-1; Fri, 17 Jan 2020 03:35:13 -0500
X-MC-Unique: px9lVYfWP7CngCFPjmpKhg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99F548017CC;
 Fri, 17 Jan 2020 08:35:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 90E4B10016EB;
 Fri, 17 Jan 2020 08:35:12 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id DB8431809563;
 Fri, 17 Jan 2020 08:35:11 +0000 (UTC)
Date: Fri, 17 Jan 2020 03:35:11 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <1477632721.2420697.1579250111441.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200116153741.GA558@rei>
References: <cki.FA900DB853.LBD049H627@redhat.com>
 <84944fa0-3c18-f8a4-47ca-7627eb4e0594@redhat.com> <20200116153741.GA558@rei>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.6]
Thread-Topic: ??? FAIL: Test report for kernel 5.4.13-rc1-7f1b863.cki (stable)
Thread-Index: p1YXf2kW0X2fHt0OMwa/2fDBBYA+iw==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] ??? FAIL: Test report for kernel 5.4.13-rc1-7f1b863.cki
 (stable)
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
Cc: Jianwen Ji <jiji@redhat.com>, Hangbin Liu <haliu@redhat.com>,
 Memory Management <mm-qe@redhat.com>,
 Linux Stable maillist <stable@vger.kernel.org>, Jianlin Shi <jishi@redhat.com>,
 CKI Project <cki-project@redhat.com>, LTP Mailing List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> Hi!
> > > One or more kernel tests failed:
> > > 
> > >      ppc64le:
> > >       ??? LTP
> > 
> > Hi, I see max_map_count failed on ppc64le:
> > https://artifacts.cki-project.org/pipelines/385189/logs/ppc64le_host_2_LTP_mm.run.log
> 
> That's strange, we do attempt to map 65536 mappings but we do not touch
> them, so these shouldn't be faulted in, so there is no real reason why
> mmap() in the child process should stop prematurely at 65532.
> 
> I guess that we cannot do much here, unless it's reproducible, because
> there is not much information there.

max_map_count.c:205: FAIL: 64882 map entries in total, but expected 65536 entries

I can reproduce it by running it in loop for couple hours. Though no idea
why we started seeing it only in 5.4.13 rc kernels, as there doesn't seem
to be any significant mm changes.

I'll try some older kernels.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
