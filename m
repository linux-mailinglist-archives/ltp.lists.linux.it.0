Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B95D7AB98DA
	for <lists+linux-ltp@lfdr.de>; Fri, 16 May 2025 11:31:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6DB183CC583
	for <lists+linux-ltp@lfdr.de>; Fri, 16 May 2025 11:31:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 799443CC578
 for <ltp@lists.linux.it>; Fri, 16 May 2025 11:31:31 +0200 (CEST)
Received: from gnu.wildebeest.org (gnu.wildebeest.org [45.83.234.184])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E14CE20074F
 for <ltp@lists.linux.it>; Fri, 16 May 2025 11:31:30 +0200 (CEST)
Received: by gnu.wildebeest.org (Postfix, from userid 1000)
 id 27772303C2A0; Fri, 16 May 2025 11:31:29 +0200 (CEST)
Date: Fri, 16 May 2025 11:31:29 +0200
From: Mark Wielaard <mark@klomp.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20250516093129.GG12775@gnu.wildebeest.org>
References: <20250516075113.522145-1-pvorel@suse.cz>
 <aCb7Pi6Vgkc8OMja@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aCb7Pi6Vgkc8OMja@yuki.lan>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] valgrind-announce: Update valgrind ML
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
Cc: valgrind-developers@lists.sourceforge.net,
 Martin Cermak <mcermak@redhat.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

On Fri, May 16, 2025 at 10:45:50AM +0200, Cyril Hrubis wrote:
> > valgrind-developers has heavy traffic, use valgrind-announce.
> 
> Was this requested by valgrind devs? I suppose this is fine as long as
> we get their ack.

I think valgrind-developers is a better place for announcing new
versions of LTP.  We can then update our own valgrind testing.
valgrind-announce is really for users when valgrind itself has a new
release.

Cheers,

Mark

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
