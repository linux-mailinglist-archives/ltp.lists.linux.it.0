Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A8FEFEA1
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 14:32:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7B87D3C22C6
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 14:32:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id D77943C22A3
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 14:32:19 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 5D871100112B
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 14:32:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572960737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sugbSLwcxZDtApP/IEiYig7R9fjS4qV1nCwCyRCHH/Y=;
 b=aSL6oYZga517cPG8KdcpPitXMlECl7aw1Tf1R5dmy4OlHhW/TeQj379gaxK92T0/oO6ry5
 ipHhbHn5PR12Sb/IBE0J8e4Cudvb5Smx58nx3bI//TnINNILTHpGzJvbWF0HuCr2t0g0cf
 m9rejyzU4EXF/mlsBYYyXBAU2yMHp9c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-hcAxluPmOVim9vFcwZhNOw-1; Tue, 05 Nov 2019 08:32:14 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACF2C800C73;
 Tue,  5 Nov 2019 13:32:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A3A5E600C4;
 Tue,  5 Nov 2019 13:32:13 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 99ACF18005A9;
 Tue,  5 Nov 2019 13:32:13 +0000 (UTC)
Date: Tue, 5 Nov 2019 08:32:13 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <1812268654.10539806.1572960733575.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191105130505.GD8511@rei.lan>
References: <20191105120053.9173-1-chrubis@suse.cz>
 <20191105130505.GD8511@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.12]
Thread-Topic: lib/tst_test: Warn on repeated options
Thread-Index: /Hi4QJjX5sGrUX80VAbN4rjW21fK6Q==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: hcAxluPmOVim9vFcwZhNOw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib/tst_test: Warn on repeated options
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
> > Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> > CC: Jan Stancek <jstancek@redhat.com>
> > ---
> >  lib/tst_test.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/lib/tst_test.c b/lib/tst_test.c
> > index c7b46d0d5..f41baf3cf 100644
> > --- a/lib/tst_test.c
> > +++ b/lib/tst_test.c
> > @@ -468,6 +468,9 @@ static void parse_topt(unsigned int topts_len, int opt,
> > char *optarg)
> >  	if (i >= topts_len)
> >  		tst_brk(TBROK, "Invalid option '%c' (should not happen)", opt);
> >  
> > +	if (*toptions[i].arg)
> > +		tst_res(TWARN, "Option passed -%c multiple times", opt);
> 
> Obviously the -%c and passed should be swapped, I can do that before
> pushing if the patch gets ack.

Acked-by: Jan Stancek <jstancek@redhat.com>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
