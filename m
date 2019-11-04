Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7736FEE462
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 17:06:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0A2633C2509
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 17:06:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 87F633C23F4
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 17:06:30 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 075951000B0B
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 17:06:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572883588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nc01TisaNLhcXenQj+jNOA/Ww8ge9UmmPPieDoEFbJs=;
 b=dpiu0zvh3u5MLJHfobA+1v1boPOXWUCMUMagW+YidiDmL6sOESqUHZ2FUoH4xiWo1IZaPh
 AIzIhF8Yn6hExtXQ2Wet7WT6Qn/34LizoYPMvASXlmUJipTql4+ijm3o7sTK0yhfeDbOV9
 VdsHal3yHhbRdX6eu4YtBYsf8zXGc9g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-EoXJ93KBNpGdEYREtVuSyw-1; Mon, 04 Nov 2019 11:06:24 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 762B68017DD;
 Mon,  4 Nov 2019 16:06:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DD775D6C5;
 Mon,  4 Nov 2019 16:06:23 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6525B1803C32;
 Mon,  4 Nov 2019 16:06:23 +0000 (UTC)
Date: Mon, 4 Nov 2019 11:06:23 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <533980280.10363747.1572883583198.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191104155900.GA5683@rei.lan>
References: <4e93b0d943960d957b71bdb998b33ad30424b07c.1572881777.git.jstancek@redhat.com>
 <20191104155900.GA5683@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.29]
Thread-Topic: read_all_sys: skip debugfs
Thread-Index: 0xoATK0DtXx51eAtxsejDa/iorSAJw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: EoXJ93KBNpGdEYREtVuSyw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] read_all_sys: skip debugfs
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
> > debugfs is meant for debugging, it exposes also device registers
> > and can pretty much do anything:
> >   https://lore.kernel.org/linux-arm-kernel/1507592549.3785589.1570404050459.JavaMail.zimbra@redhat.com/
> >   https://lore.kernel.org/stable/2029139028.10333037.1572874551626.JavaMail.zimbra@redhat.com/
> > 
> > Signed-off-by: Jan Stancek <jstancek@redhat.com>
> > ---
> >  runtest/fs | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/runtest/fs b/runtest/fs
> > index 07d6e2b67964..fba19cae03e8 100644
> > --- a/runtest/fs
> > +++ b/runtest/fs
> > @@ -71,7 +71,7 @@ proc01 proc01 -m 128
> >  
> >  read_all_dev read_all -d /dev -p -q -r 10
> >  read_all_proc read_all -d /proc -q -r 10
> > -read_all_sys read_all -d /sys -q -r 10 -e /sys/power/wakeup_count
> > +read_all_sys read_all -d /sys -q -r 10 -e /sys/power/wakeup_count -e
> > '/sys/kernel/debug/*'
> 
> Do we even support multiple parameters for the same option?
> 
> I looked that the library code and I would say that we will replace the
> value with each iteration which means that we will effectively use the
> last one.

That is good point. Do we actually need to store blacklist as cmdline parameters?



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
