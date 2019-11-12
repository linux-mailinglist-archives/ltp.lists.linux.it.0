Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 051D8F8FFF
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 13:52:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 86CE13C25FE
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 13:52:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 548A73C25BA
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 13:52:43 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id B918210018A6
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 13:52:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573563161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6vqVVFf32z9soONdRTpjP7yeG453+JULpo1nL8PVZ2E=;
 b=UJg+V+uGre3HM8FcE2ltljbj69qJmJNSXLKfoHV4bZ0n01jSSFrKQqdKa0w2zaUSKF0Pap
 ADKOE2PyLqtGGzNNBgsM0YGWSUQdiovP3/UwluFy2lUA8XiQU2CLOGBrqy8v9/p13jUG+9
 ODMtkiSpNHkg1cmis3PQ1AY8D5VAZYA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-dni-7HFMPq2f058i_Grggg-1; Tue, 12 Nov 2019 07:52:38 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96B5C107ACC5;
 Tue, 12 Nov 2019 12:52:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D0A119D70;
 Tue, 12 Nov 2019 12:52:37 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 844CC18089CD;
 Tue, 12 Nov 2019 12:52:37 +0000 (UTC)
Date: Tue, 12 Nov 2019 07:52:37 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <1574856631.11670519.1573563157342.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191112123744.GA760@dell5510>
References: <95d94fede00533a07fc604de3252636b094fc8f8.1573550061.git.jstancek@redhat.com>
 <20191112123744.GA760@dell5510>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.22]
Thread-Topic: acct02: relax ac_btime checks
Thread-Index: NOY7+NwjKGuW4CIzEmNI0Z5FXhzTxw==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: dni-7HFMPq2f058i_Grggg-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] acct02: relax ac_btime checks
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
> > ac_btime is calculated back from current time and isn't accurate.
> > Problems include nanoseconds accumulation (lags behind gettimeofday),
> > suspend/resume isn't taken into account and any adjtime() (like DST
> > change) will cause ac_btime to jump as well.
> 
> > Relax the condition to ~2h around gettimeofday value at start of
> > the test. That should be enough to cover usual DST time jumps.
> 
> > Signed-off-by: Jan Stancek <jstancek@redhat.com>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> Tested-by: Petr Vorel <pvorel@suse.cz>
> on both 390x and intel.
> 
> LGTM, although on in intel I got quite a lot of entries:
> 
> acct02.c:202: INFO: Number of accounting file entries tested: 159

That could be normal if there was something running in the background.
Do you have full output? What was the ac_comm string in those entries?


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
