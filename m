Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 437E61C5634
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 15:05:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 043423C57EA
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 15:05:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 8C07C3C2671
 for <ltp@lists.linux.it>; Tue,  5 May 2020 09:54:41 +0200 (CEST)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A748C1A00EC1
 for <ltp@lists.linux.it>; Tue,  5 May 2020 09:54:40 +0200 (CEST)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 49GX7M5dt7z1r56d;
 Tue,  5 May 2020 09:54:39 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 49GX7M4D6cz1qsp5;
 Tue,  5 May 2020 09:54:39 +0200 (CEST)
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id W3JD9V5WcCiL; Tue,  5 May 2020 09:54:38 +0200 (CEST)
X-Auth-Info: diRSenQX8FprqlvZqmh/TpMYXspDsu23fD+ty+hh+9H3zeR34LGWi6vHop0j++Ft
Received: from igel.home (ppp-46-244-190-77.dynamic.mnet-online.de
 [46.244.190.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue,  5 May 2020 09:54:38 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id 4803D2C0B74; Tue,  5 May 2020 09:54:38 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Jan Stancek via Libc-alpha <libc-alpha@sourceware.org>
References: <100149681.11244932.1588661282331.JavaMail.zimbra@redhat.com>
 <1038674044.11248021.1588663714272.JavaMail.zimbra@redhat.com>
X-Yow: FUN is never having to say you're SUSHI!!
Date: Tue, 05 May 2020 09:54:38 +0200
In-Reply-To: <1038674044.11248021.1588663714272.JavaMail.zimbra@redhat.com>
 (Jan Stancek via Libc-alpha's message of "Tue, 5 May 2020 03:28:34
 -0400 (EDT)")
Message-ID: <874ksuke9t.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.0.91 (gnu/linux)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 05 May 2020 15:05:13 +0200
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

On Mai 05 2020, Jan Stancek via Libc-alpha wrote:

> I'm seeing an issue with CLONE_IO and libc' clone() on ppc64le,
> where flags parameter appears to be sign extended before it's passed
> to kernel syscall.

Looks like the flags argument should be declared as unsigned int,
instead of int, both in glibc and in the kernel.

#define CLONE_IO		0x80000000	/* Clone io context */

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
