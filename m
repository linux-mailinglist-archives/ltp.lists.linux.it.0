Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC3116BBE3
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Feb 2020 09:31:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B87AD3C25EC
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Feb 2020 09:31:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 378CE3C1447
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 09:31:47 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id D2C506008C7
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 09:31:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582619501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9GK+OH97gxk3fpUXNGVQcslPOEucxN1PbLJSQz2tfMQ=;
 b=jMi3WWx1+sxSmto2DT1EVKV5XNG/4MG/EpIn6YcCZdadmhnTiuiwkfAiHfCVlup1yBnjOR
 DwTzC9ZY8FafW8DsZFCsHQT7eqU4nG7qFCCcHfM2NehJklpQMX/N98TmA55h7Ko2Pp64D5
 Pv4/FRpxYP0lj3fm00jgmnoYB9B4m08=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-Q1ZYJXCRPzSj1bt4acqJHw-1; Tue, 25 Feb 2020 03:31:35 -0500
X-MC-Unique: Q1ZYJXCRPzSj1bt4acqJHw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6947C8017DF;
 Tue, 25 Feb 2020 08:31:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 362EA90F5B;
 Tue, 25 Feb 2020 08:31:34 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id F376338A1;
 Tue, 25 Feb 2020 08:31:33 +0000 (UTC)
Date: Tue, 25 Feb 2020 03:31:33 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Pankaj Vinadrao Joshi <Pankaj.VJ@exaleapsemi.com>
Message-ID: <768964483.8786340.1582619493789.JavaMail.zimbra@redhat.com>
In-Reply-To: <MAXPR0101MB14681EB0C7F8BBC970B19ED9EEED0@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
References: <MAXPR0101MB14687E3C724A815D2857EA14EE1A0@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
 <MAXPR0101MB14685FEB7F52C97C8835B106EE110@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
 <558576867.8097569.1582098912792.JavaMail.zimbra@redhat.com>
 <BM1PR0101MB14596D9D318FF13C32724A32EE100@BM1PR0101MB1459.INDPRD01.PROD.OUTLOOK.COM>
 <732362668.8105497.1582103304747.JavaMail.zimbra@redhat.com>
 <MAXPR0101MB1468CAB5F98BE95E3170E7A3EEED0@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
 <641229800.8775991.1582616022386.JavaMail.zimbra@redhat.com>
 <MAXPR0101MB14681EB0C7F8BBC970B19ED9EEED0@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.10]
Thread-Topic: [LTP] min_free_kbytes.c:134: FAIL: child unexpectedly failed: 139
Thread-Index: AQHV4mZtdlpcIR01/E2nMHLN6pJmPrc5w5Tp8OWOEejzESWd3Yzu4zT/UFIizlH9fo4IJsCrKxiBv1U/UJVpzTJVDPyxoTV7zPgp7IyzCSf2TxjR/rEk/0KbJ1ejmne95aOaSEC3fN/mZvM=
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: LTP Mailing List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

[adding back LTP list] Please keep the list CC-ed, you might get more responses
from other members.

----- Original Message -----
> (gdb) bt
> #0  0x0000003fe1713b92 in __vfscanf_internal (s=0x23000, format=<optimized
> out>, argptr=<optimized out>, mode_flags=<optimized out>) at
> vfscanf-internal.c:345
> Backtrace stopped: Cannot access memory at address 0xfffffffffffffff9

Which is unfortunate.

Only place I see child reaching vfscanf is via check_monitor -> get_sys_tune,
but per test output it's not check_monitor child, but eatup_mem one.

I don't see why it would crash here, and why it happens on RISCV only.
I can only recommend to try simplify the testcase to see what triggers it.

Is this the only LTP test you see crashing? 
Is it built natively on RISCV or is it cross-compiled in other environment?

> (gdb) where
> #0  0x0000003fe1713b92 in __vfscanf_internal (s=0x23000, format=<optimized
> out>, argptr=<optimized out>, mode_flags=<optimized out>) at
> vfscanf-internal.c:345
> Backtrace stopped: Cannot access memory at address 0xfffffffffffffff9
> 
> (gdb) info registers
> ra             0x16438 0x16438 <safe_waitpid+40>
> sp             0x3fffd94850 0x3fffd94850
> gp             0x29f10 0x29f10 <ipc_path+544>
> tp             0x3fe16cd720 0x3fe16cd720
> t0             0xffffffffffffffff -1
> t1             0x1366c 79468
> t2             0x1000 4096
> fp             0x1 0x1
> s1             0x180 384
> a0             0x180 384
> a1             0x3fffd948c4 274875369668
> a2             0xa 10
> a3             0x0 0
> a4             0x3fffd948c4 274875369668
> a5             0xffffffffffffffff -1
> a6             0x1 1
> a7             0x104 260
> s2             0x3fffd948c4 274875369668
> s3             0xa 10
> s4             0x79 121
> s5             0x3fe17e6008 274366095368
> s6             0x21ad0 137936
> s7             0x22000 139264
> s8             0x22000 139264
> s9             0x22000 139264
> s10            0x23000 143360
> s11            0x1fed70 2092400
> t3             0x3fe17e5790 274366093200
> t4             0x3fe17a2070 274365816944
> t5             0x3fe17a2970 274365819248
> t6             0x5 5
> pc             0x3fe1713b92 0x3fe1713b92 <__vfscanf_internal+1126>
> (gdb)
> 
> ________________________________
> Sent: Tuesday, February 25, 2020 1:03 PM
> Subject: Re: [LTP] min_free_kbytes.c:134: FAIL: child unexpectedly failed:
> 139
> 
> ----- Original Message -----
> 
> > Hi Jan,
> > i have tried to collect the core through GDB this is the result i
> > found??what
> > i should conclude from this??
> 
> Can you paste the output of backtrace? ('bt' command in gdb)
> 
> 
> > root@exaleapsemi:~/pankaj_ltpn/ltp/testcases/kernel/mem/tunable# gdb
> > ./min_free_kbytes core.378
> > GNU gdb (GDB) 8.3.1
> > Copyright (C) 2019 Free Software Foundation, Inc.
> > License GPLv3+: GNU GPL version 3 or later
> > <http://gnu.org/licenses/gpl.html>
> > This is free software: you are free to change and redistribute it.
> > There is NO WARRANTY, to the extent permitted by law.
> > Type "show copying" and "show warranty" for details.
> > This GDB was configured as "riscv64-oe-linux".
> > Type "show configuration" for configuration details.
> > For bug reporting instructions, please see:
> > <http://www.gnu.org/software/gdb/bugs/>.
> > Find the GDB manual and other documentation resources online at:
> > <http://www.gnu.org/software/gdb/documentation/>.
> 
> > For help, type "help".
> > Type "apropos word" to search for commands related to "word"...??
> > Reading symbols from ./min_free_kbytes...
> > [New LWP 378]
> > [Thread debugging using libthread_db enabled]
> > Using host libthread_db library "/lib/libthread_db.so.1".
> > Core was generated by `./min_free_kbytes'.
> > Program terminated with signal SIGSEGV, Segmentation fault.
> > #0 0x0000003fe1713b92 in __vfscanf_internal (s=0x23000, format=<optimized
> > out>, argptr=<optimized out>, mode_flags=<optimized out>) at
> > vfscanf-internal.c:345
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
