Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A261E1614A6
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 15:28:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4E8E73C25DD
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 15:28:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 289453C25C1
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 15:28:10 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 70069600E35
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 15:28:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581949686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Jyi33sujOXWx+ixc7DAuroUDLhnNhNLR99L703TfUA=;
 b=JDhj3kUqM064ACunQgz2BjCBPUiEiG+5SPKJfX1TJtsIS96emXkeSRLzPfZWPtuqMhnCq0
 ntSngGH3GH/pdDiNmctwXeiynZNgoL9Q88eE7v3RZSJ2E1KD6Dv5Drf4OLiKka5jB5xMWd
 FbS1SzZHWJjSmD4m8tWAjSm2IxFHWIo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-Z0_oYMWSNfCMo9s8L9_1bQ-1; Mon, 17 Feb 2020 09:28:05 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E3B48010FB;
 Mon, 17 Feb 2020 14:28:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 202B119481;
 Mon, 17 Feb 2020 14:28:04 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id D999635AE0;
 Mon, 17 Feb 2020 14:28:03 +0000 (UTC)
Date: Mon, 17 Feb 2020 09:28:03 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Pankaj Vinadrao Joshi <Pankaj.VJ@exaleapsemi.com>
Message-ID: <1121671987.7831869.1581949683671.JavaMail.zimbra@redhat.com>
In-Reply-To: <MAXPR0101MB1468DB8754551B9C84AF3C0CEE160@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
References: <MAXPR0101MB14687E3C724A815D2857EA14EE1A0@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
 <333767604.7805569.1581940614115.JavaMail.zimbra@redhat.com>
 <MAXPR0101MB1468A92491FB531F33F10A36EE160@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
 <688644958.7809325.1581942285691.JavaMail.zimbra@redhat.com>
 <MAXPR0101MB1468DB8754551B9C84AF3C0CEE160@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.25]
Thread-Topic: [LTP] min_free_kbytes.c:134: FAIL: child unexpectedly failed: 139
Thread-Index: AQHV4mZtdlpcIR01/E2nMHLN6pJmPrc5w5Tp8OWOEejzESWd3Yzu4zT/UFIizlE=
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: Z0_oYMWSNfCMo9s8L9_1bQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

[adding back LTP list to CC]

----- Original Message -----
> //***************************   This is the result of strace -f
> 
> 
> pid 48522] mmap(NULL, 1048576, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x3e18a08000
> [pid 48522] mmap(NULL, 1048576, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x3e18908000
> [pid 48522] mmap(NULL, 1048576, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x3e18808000
> [pid 48522] mmap(NULL, 1048576, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x3e18708000
> [pid 48522] mmap(NULL, 1048576, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x3e18608000
> [pid 48522] mmap(NULL, 1048576, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x3e18508000
> [pid 48522] mmap(NULL, 1048576, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x3e18408000
> [pid 48522] mmap(NULL, 1048576, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x3e18308000
> [pid 48522] mmap(NULL, 1048576, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x3e18208000
> [pid 48522] mmap(NULL, 1048576, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x3e18108000
> [pid 48522] mmap(NULL, 1048576, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x3e18008000
> [pid 48522] mmap(NULL, 1048576, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x3e17f08000
> [pid 48522] mmap(NULL, 1048576, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x3e17e08000
> [pid 48522] mmap(NULL, 1048576, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x3e17d08000
> [pid 48522] mmap(NULL, 1048576, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x3e17c08000
> [pid 48522] mmap(NULL, 1048576, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x3e17b08000
> [pid 48522] mmap(NULL, 1048576, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x3e17a08000
> [pid 48522] mmap(NULL, 1048576, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x3e17908000
> [pid 48522] mmap(NULL, 1048576, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x3e17808000
> [pid 48522] mmap(NULL, 1048576, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x3e17708000
> [pid 48522] mmap(NULL, 1048576, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x3e17608000
> [pid 48522] mmap(NULL, 1048576, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x3e17508000
> [pid 48522] mmap(NULL, 1048576, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x3e17408000
> [pid 48522] mmap(NULL, 1048576, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x3e17308000
> [pid 48522] mmap(NULL, 1048576, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x3e17208000
> [pid 48522] mmap(NULL, 1048576, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x3e17108000
> [pid 48522] mmap(NULL, 1048576, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x3e17008000
> [pid 48522] mmap(NULL, 1048576, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x3e16f08000
> [pid 48522] mmap(NULL, 1048576, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x3e16e08000
> Segmentation fault

Ok, so we are in eatup_mem loop. mmap() suceeded, and then we seem to crash
on write to allocated area via memset(). My guess would be kernel bug.

To double-check, can you capture a core file and see where exactly child hits SIGSEGV?

> root@exaleapsemi:~/pankaj_ltp_new/ltp/testcases/kernel/mem/tunable#
> min_free_kbytes.c:173: FAIL: child unexpectedly failed: 11
> mem.c:817: INFO: set min_free_kbytes to 163644
> memfree is 8048240 kB before eatup mem
> min_free_kbytes.c:173: FAIL: child unexpectedly failed: 11
> mem.c:817: INFO: set overcommit_memory to 1
> mem.c:817: INFO: set min_free_kbytes to 327288
> memfree is 8047972 kB before eatup mem
> min_free_kbytes.c:155: FAIL: child unexpectedly failed: 11
> mem.c:817: INFO: set min_free_kbytes to 654576
> memfree is 8047800 kB before eatup mem
> min_free_kbytes.c:155: FAIL: child unexpectedly failed: 11
> mem.c:817: INFO: set min_free_kbytes to 163644
> memfree is 8039996 kB before eatup mem
> min_free_kbytes.c:155: FAIL: child unexpectedly failed: 11
> min_free_kbytes.c:103: PASS: min_free_kbytes test pass
> mem.c:817: INFO: set min_free_kbytes to 327288
> mem.c:817: INFO: set overcommit_memory to 1
> 
> Summary:
> passed   1
> failed   7
> skipped  0
> warnings 0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
