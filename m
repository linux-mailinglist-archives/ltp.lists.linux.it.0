Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0541CDFE00
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Oct 2019 09:10:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 55A6C3C22C3
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Oct 2019 09:10:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 84F313C0B88
 for <ltp@lists.linux.it>; Tue, 22 Oct 2019 09:10:30 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id D83681000A96
 for <ltp@lists.linux.it>; Tue, 22 Oct 2019 09:10:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571728227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xLp8i2VwLYayB3PFeOogwZ2PznNMiR86dbhqLB4QDcI=;
 b=fcWkJDcL9dDRLUCU6x+kuQCP66AjT0eS0FlkBEmtFF31/KB9YnEn7PO84P8kFkOQuCuZjq
 eMWIBfaDh3SIF4DAQSmRkDEmmCFp47oM9inhY16U9SzJkjwOtpPw0w/u8Jw8MdOeTTBeuY
 BAN4AJMB5oAIVnsQc9HhfRQayg1/ZKs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-1ImbHy_YNjmiFkxwc9rAgw-1; Tue, 22 Oct 2019 03:10:24 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A15FF1005509;
 Tue, 22 Oct 2019 07:10:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9737A60A9F;
 Tue, 22 Oct 2019 07:10:23 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 894A218089DC;
 Tue, 22 Oct 2019 07:10:23 +0000 (UTC)
Date: Tue, 22 Oct 2019 03:10:23 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <1931638600.8070217.1571728223473.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191018134525.GA2589@dell5510>
References: <c8843f2f4a325e820d030d9c7c36d7624f1baa82.1571393044.git.jstancek@redhat.com>
 <20191018134525.GA2589@dell5510>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.8]
Thread-Topic: lsmod01.sh: retry test couple times to lower false positives
Thread-Index: gl8prJDWrYPBAt/rKHZt5gVnoJn42g==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 1ImbHy_YNjmiFkxwc9rAgw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lsmod01.sh: retry test couple times to lower
 false positives
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
> ...
> >  	if [ "$lsmod_output" != "$modules_output" ]; then
> > -		tst_res TFAIL "lsmod output different from /proc/modules."
> > +		tst_res TINFO "lsmod output different from /proc/modules."
> 
> >  		echo "$lsmod_output" > temp1
> >  		echo "$modules_output" > temp2
> >  		diff temp1 temp2
> Also this code could be wrapped with
> if tst_cmd_available diff; then

Added this as well and pushed.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
