Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEC017F42E
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Mar 2020 10:53:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5281E3C6023
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Mar 2020 10:53:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 11E8A3C5FFB
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 10:53:17 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 400011401B38
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 10:53:16 +0100 (CET)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E447F208E4;
 Tue, 10 Mar 2020 09:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583833994;
 bh=HjyOiOBIg/zu40RS8VP4Cv3KOku/wIMVy17lgi55akc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qdkrwtL6a51+wl25t/LT33F1IZJ9SerKktV0R4OlWjhsMrAu71rLR7F2zBeTYOwS7
 LvhXQwcO2hxSsTZHm/9yPxrHAEbqHoqBMYQWpZ9Injb5rWsxcnZFg+TLc1RE/WD3va
 +O8o6ru55h71Gj3lntybIcB5gs8U0PF8rTHwxtTQ=
Date: Tue, 10 Mar 2020 10:53:12 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: CKI Project <cki-project@redhat.com>
Message-ID: <20200310095312.GA2534479@kroah.com>
References: <cki.FE14F151C1.JS9OFUV72I@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cki.FE14F151C1.JS9OFUV72I@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?q?=E2=9D=8C_PANICKED=3A_Test_report_for_kernel_5?=
 =?utf-8?q?=2E5=2E8-6afe1f4=2Ecki_=28stable-queue=29?=
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
Cc: Memory Management <mm-qe@redhat.com>, Ondrej Mosnacek <omosnace@redhat.com>,
 Linux Stable maillist <stable@vger.kernel.org>,
 Ondrej Moris <omoris@redhat.com>, LTP Mailing List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Mar 10, 2020 at 09:45:37AM -0000, CKI Project wrote:
> 
> Hello,
> 
> We ran automated tests on a recent commit from this kernel tree:
> 
>        Kernel repo: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
>             Commit: 6afe1f4aeae9 - ASoC: topology: Fix memleak in soc_tplg_manifest_load()
> 
> The results of these automated tests are provided below.
> 
>     Overall result: FAILED (see details below)
>              Merge: OK
>            Compile: OK
>              Tests: PANICKED

Given that there's nothing I can do about this, I'm just starting to
flat-out ignore the results of these emails :(

greg k-h

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
