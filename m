Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EE21816117F
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 12:57:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8CD923C23DC
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 12:57:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 1F3C63C23A5
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 12:56:59 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 8E194600C99
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 12:56:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581940617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vuzQSBzluWZ14fi5d6iZGeemZqwC+z2JkZAouX2Fck4=;
 b=cJuikuVxhyiCPgBrv4WaLxCpLmweoxiL9xeqjbodeHD0WLncoy9eBQESD4K2XXR1jy/omG
 ft3O0ozG9jfP7gPFQjWl8HO88vH4cixv2YFVWC7tfkBLiam5WmnMRmX4GVVY1DX6Capyzt
 c5HouQlKTE5Q+9Z1DF3B5az0OSh9K+A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-3IpsqtsGNGSRgBDHZixLiQ-1; Mon, 17 Feb 2020 06:56:55 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1FD614E8;
 Mon, 17 Feb 2020 11:56:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A84B725276;
 Mon, 17 Feb 2020 11:56:54 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6719118089C8;
 Mon, 17 Feb 2020 11:56:54 +0000 (UTC)
Date: Mon, 17 Feb 2020 06:56:54 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Pankaj Vinadrao Joshi <Pankaj.VJ@exaleapsemi.com>
Message-ID: <333767604.7805569.1581940614115.JavaMail.zimbra@redhat.com>
In-Reply-To: <MAXPR0101MB14687E3C724A815D2857EA14EE1A0@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
References: <MAXPR0101MB14687E3C724A815D2857EA14EE1A0@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.5]
Thread-Topic: min_free_kbytes.c:134: FAIL: child unexpectedly failed: 139
Thread-Index: AQHV4mZtdlpcIR01/E2nMHLN6pJmPrc5w5Tp
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 3IpsqtsGNGSRgBDHZixLiQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] min_free_kbytes.c:134: FAIL: child unexpectedly failed:
 139
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
> Hi,
> i am running min_free_kbytes test,6 test cases are failing with error message
> min_free_kbytes.c:134: FAIL: child unexpectedly failed: 139.
> i am attaching the test result

Hi,

for future, can you just paste the test output to email, instead of sending screenshots of text?

You're not providing much information, such as LTP version, kernel, architecture or distro.
Or if it worked previously and started failing only now. So it's difficult for anyone to
try reproduce your steps.

Output is unusual, status codes suggest child running into SIGSEGV and SIGILL at some
point after eatup_mem(). Did you try to run this with gdb, strace or look at core files?


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
