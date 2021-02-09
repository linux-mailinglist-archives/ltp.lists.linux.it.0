Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB612314C74
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Feb 2021 11:06:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 594B33C64B3
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Feb 2021 11:06:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 77A7F3C1C50
 for <ltp@lists.linux.it>; Tue,  9 Feb 2021 11:06:28 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 22F9B1000AEB
 for <ltp@lists.linux.it>; Tue,  9 Feb 2021 11:06:27 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3B659AD24;
 Tue,  9 Feb 2021 10:06:27 +0000 (UTC)
Date: Tue, 9 Feb 2021 11:07:35 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: ?????? <younghaopro@gmail.com>
Message-ID: <YCJe54ZzREDRJ+tQ@yuki.lan>
References: <CAD5BMqCdJXgqu2kwaRjD7=SRORDGoxENnRXBG5UrwvsmtjOzrQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD5BMqCdJXgqu2kwaRjD7=SRORDGoxENnRXBG5UrwvsmtjOzrQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] ltp build error
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
Content-Type: multipart/mixed; boundary="===============2142134014=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2142134014==
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi!
You should have just send the relevant part of the log which is:

CC testcases/kernel/syscalls/getpgrp/getpgrp01
In file included from ../../../../include/tst_test.h:14,
                 from ustat01.c:9:
/usr/include/x86_64-linux-gnu/bits/ustat.h:24:8: error: redefinition of â~@~Xstruct statfsâ~@~Y
 struct ustat
        ^~~~~
In file included from ../../../../include/tst_test.h:14,
                 from ustat02.c:10:
/usr/include/x86_64-linux-gnu/bits/ustat.h:24:8: error: redefinition of â~@~Xstruct statfsâ~@~Y
 struct ustat
        ^~~~~
In file included from /usr/include/x86_64-linux-gnu/sys/statfs.h:25,
                 from /usr/include/x86_64-linux-gnu/sys/vfs.h:4,
                 from ../../../../include/tst_safe_macros.h:14,
                 from ../../../../include/tst_test.h:93,
                 from ustat01.c:9:
/usr/include/x86_64-linux-gnu/bits/statfs.h:24:8: note: originally defined here
 struct statfs
        ^~~~~~
In file included from /usr/include/x86_64-linux-gnu/sys/statfs.h:25,
                 from /usr/include/x86_64-linux-gnu/sys/vfs.h:4,
                 from ../../../../include/tst_safe_macros.h:14,
                 from ../../../../include/tst_test.h:93,
                 from ustat02.c:10:
/usr/include/x86_64-linux-gnu/bits/statfs.h:24:8: note: originally defined here
 struct statfs
        ^~~~~~
In file included from ../../../../include/tst_test.h:14,
                 from ustat01.c:9:
/usr/include/x86_64-linux-gnu/sys/ustat.h:33:12: error: conflicting types for â~@~Xstatfsâ~@~Y
 extern int ustat (__dev_t __dev, struct ustat *__ubuf) __THROW;
            ^~~~~
In file included from ../../../../include/tst_test.h:14,
                 from ustat02.c:10:
/usr/include/x86_64-linux-gnu/sys/ustat.h:33:12: error: conflicting types for â~@~Xstatfsâ~@~Y
 extern int ustat (__dev_t __dev, struct ustat *__ubuf) __THROW;
            ^~~~~
In file included from /usr/include/x86_64-linux-gnu/sys/vfs.h:4,
                 from ../../../../include/tst_safe_macros.h:14,
                 from ../../../../include/tst_test.h:93,
                 from ustat01.c:9:
/usr/include/x86_64-linux-gnu/sys/statfs.h:31:12: note: previous declaration of â~@~Xstatfsâ~@~Y was here
 extern int statfs (const char *__file, struct statfs *__buf)
            ^~~~~~

This basically says that you have duplicate definitions of the statfs in your
system headers i.e. they are both in sys/statfs.h and sys/vfs.h.

And usually the vfs.h just includes statfs.h, so it really looks like your
system, more specifically libc headers are horribly broken.

-- 
Cyril Hrubis
chrubis@suse.cz

--===============2142134014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2142134014==--
