Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A46626D6E3
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Sep 2020 10:40:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0E6F83C2B3D
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Sep 2020 10:40:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 97D973C29DF
 for <ltp@lists.linux.it>; Thu, 17 Sep 2020 10:40:14 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 062591000968
 for <ltp@lists.linux.it>; Thu, 17 Sep 2020 10:40:13 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 32A0FB275;
 Thu, 17 Sep 2020 08:40:47 +0000 (UTC)
Date: Thu, 17 Sep 2020 10:40:39 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: "Bird, Tim" <Tim.Bird@sony.com>
Message-ID: <20200917084039.GA2352@yuki.lan>
References: <CY4PR13MB117565A7BA2A8371A3B94ED9FD200@CY4PR13MB1175.namprd13.prod.outlook.com>
 <20200916071106.GB1433@dell5510> <20200916085405.GB4464@yuki.lan>
 <CY4PR13MB1175364547D2DA3A96262516FD210@CY4PR13MB1175.namprd13.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY4PR13MB1175364547D2DA3A96262516FD210@CY4PR13MB1175.namprd13.prod.outlook.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] TPASS in new test lib
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> That's fine.  But it's probably better to avoid differences in
> test output as much as possible, when the change is so trivial.  Petr seems to think
> there was a reason that the result string was changed between the old and new C library.
> If so, what is the reason?  If the change is only cosmetic, then I'd argue it's worth
> being consistent, and I'll submit the patch properly.  (Sorry the earlier version was
> inline in the message, rather than formatted correctly.)

I do not think that there was a strong reason for the difference apart
from an attempt to make the messages easier to read for a human reader
and to make it easier to figure out what exactly happened. The format of
the output messages was changed quite a bit in order to do that.

And as I said I do not have a strong opinion here, if you think that
this is important I'm okay with the changes.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
