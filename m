Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E4D1C4F90
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 09:50:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D99AF3C267E
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 09:49:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 287443C176A
 for <ltp@lists.linux.it>; Tue,  5 May 2020 09:49:58 +0200 (CEST)
Received: from albireo.enyo.de (albireo.enyo.de [37.24.231.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 914922001CE
 for <ltp@lists.linux.it>; Tue,  5 May 2020 09:49:57 +0200 (CEST)
Received: from [172.17.203.2] (helo=deneb.enyo.de)
 by albireo.enyo.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 id 1jVsKv-0001MJ-KP; Tue, 05 May 2020 07:49:53 +0000
Received: from fw by deneb.enyo.de with local (Exim 4.92)
 (envelope-from <fw@deneb.enyo.de>)
 id 1jVsKs-0003TH-ES; Tue, 05 May 2020 09:49:50 +0200
From: Florian Weimer <fw@deneb.enyo.de>
To: Jan Stancek via Libc-alpha <libc-alpha@sourceware.org>
References: <1038674044.11248021.1588663714272.JavaMail.zimbra@redhat.com>
Date: Tue, 05 May 2020 09:49:50 +0200
In-Reply-To: <1038674044.11248021.1588663714272.JavaMail.zimbra@redhat.com>
 (Jan Stancek via Libc-alpha's message of "Tue, 5 May 2020 03:28:34
 -0400 (EDT)")
Message-ID: <87pnbi4y8x.fsf@mid.deneb.enyo.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [bug?] clone(CLONE_IO) failing after kernel commit commit
 ef2c41cf38a7
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
Cc: christian.brauner@ubuntu.com, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

* Jan Stancek via Libc-alpha:

> I'm seeing an issue with CLONE_IO and libc' clone() on ppc64le,
> where flags parameter appears to be sign extended before it's passed
> to kernel syscall.

Interesting, thanks for reporting this.  The manual page clearly
documents the interface as;

       int clone(int (*fn)(void *), void *child_stack,
                 int flags, void *arg, ...
                 /* pid_t *ptid, void *newtls, pid_t *ctid */ );

But the kernel uses unsigned long for clone_flags.  This looks like an
unintended userspace ABI breakage.

Rather than dropping the invalid flags check in the kernel (having the
check is valuable), I think the parameter should be changed to int or
unsigned int, or the flags check should be written in such a way that
it disregards bits that result from sign extensions: fail if
clone_flags != (int) clone_flags, otherwise set clone_flags = 0xFFFFFFFF.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
