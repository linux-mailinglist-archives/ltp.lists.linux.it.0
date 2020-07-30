Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C4B233975
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jul 2020 22:03:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 858723C4C06
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jul 2020 22:03:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 571A43C076F
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 22:03:43 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id BEB411036E33
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 22:03:42 +0200 (CEST)
Received: from localhost.localdomain
 (pool-96-246-152-186.nycmny.fios.verizon.net [96.246.152.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 009D52074B;
 Thu, 30 Jul 2020 20:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596139420;
 bh=Nb6NoNnz9vaD/ACyuYzBpeQTihylPtRPWzrvjEv46Pw=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=aWxm3EzQyI3R5yKTmhjwCH73q2hIy90aLytGjpQLXawdE3p/szijJ+xH6qwRk7ES7
 Nnk+IPXe5wOV9+EEdVS4KVpr9DtcCidDFDJgbH8+Dq2neTBHQ++PLo/MW0GhXdXVwC
 UEjwkTCm/kwaNVH6IV45GrL1Vn0jWJldvUVEemMs=
Message-ID: <1596139419.25003.16.camel@kernel.org>
From: Mimi Zohar <zohar@kernel.org>
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
Date: Thu, 30 Jul 2020 16:03:39 -0400
In-Reply-To: <20200727223041.13110-1-pvorel@suse.cz>
References: <20200727223041.13110-1-pvorel@suse.cz>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 0/4] IMA: kexec cmdline measurement
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
Cc: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Mimi Zohar <zohar@linux.vnet.ibm.com>, linux-integrity@vger.kernel.org,
 balajib@linux.microsoft.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, 2020-07-28 at 00:30 +0200, Petr Vorel wrote:
> Hi all,
> 
> sending hopefully the last version. In the end I did quite few changes,
> thus sending patchset instead of merging without review.

Nice! Thank you.

Mimi

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
