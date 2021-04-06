Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AF009355723
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Apr 2021 17:01:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7FD653C1E23
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Apr 2021 17:01:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5F5C13C00FC
 for <ltp@lists.linux.it>; Tue,  6 Apr 2021 17:01:15 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7C05B20173B
 for <ltp@lists.linux.it>; Tue,  6 Apr 2021 17:01:14 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D16C7B211;
 Tue,  6 Apr 2021 15:01:13 +0000 (UTC)
Date: Tue, 6 Apr 2021 16:58:15 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Akshay Mhaske <amhaske01@gmail.com>
Message-ID: <YGx3B4uw9LtHW5I8@yuki>
References: <CAEQtK3eWPsFFqBmQ9RpiOaWo5QhUSy_=-PNQCjNDJNiTOZNqKg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEQtK3eWPsFFqBmQ9RpiOaWo5QhUSy_=-PNQCjNDJNiTOZNqKg@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] cve-2015-3290
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

Hi!
> I am running kernel ltp test cases on android x86 platform,
> and cve-2015-3290 test case is failing only for 32bit and passed for 64bit.
> 
> I can see here, test case itself is broken with SIGBUS error and not giving
> any result
> 
> *pid: 5316, tid: 5324, name: cve-2015-3290  >>> cve-2015-3290 <<<04-03
> 07:59:29.741  5327  5327 F DEBUG   : uid: 004-03 07:59:29.741  5327  5327 F
> DEBUG   : signal 7 (SIGBUS), code 128 (SI_KERNEL), fault addr 0x004-03
> 07:59:29.742  5327  5327 F DEBUG   :     eax 00000007  ebx 652457bc  ecx
> 00000000  edx 0000002304-03 07:59:29.742  5327  5327 F DEBUG   :     edi
> 00000007  esi e7ac41c804-03 07:59:29.742  5327  5327 F DEBUG   :     ebp
> 00000800  esp e7ac4110  eip 6523a800*
> 
> I think assembly code is causing wrong memory address or some memory
> alignment is not proper and so we are getting SIGBUS error.

The testcase is supposed to corrupt return state from NMI in case that
the CVE is present on the system. So triggering SIGBUS may be one of the
end results if that happens. The test seems to trigger SEGFAULT for me,
which is caught as a test failure when the test is compiled with -m32.

Which means that either the CVE has been reintroduced or the test is
buggy, hard to say which one without further analysis.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
